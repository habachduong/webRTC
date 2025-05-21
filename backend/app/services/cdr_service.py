from app.models.cdr import CDR
from app import db
from datetime import datetime
import requests
import os
from urllib.parse import urljoin

class CDRService:
    def __init__(self):
        self.solr_url = os.getenv('SOLR_URL')
        self.solr_auth = None
        if os.getenv('SOLR_USERNAME') and os.getenv('SOLR_PASSWORD'):
            self.solr_auth = (os.getenv('SOLR_USERNAME'), os.getenv('SOLR_PASSWORD'))
        self.verify_ssl = os.getenv('SOLR_SSL_VERIFY', 'false').lower() == 'true'
        self.timeout = (
            int(os.getenv('SOLR_CONNECTION_TIMEOUT', 5000)) / 1000,
            int(os.getenv('SOLR_SOCKET_TIMEOUT', 30000)) / 1000
        )

    def _solr_request(self, method, endpoint, **kwargs):
        """Thực hiện request đến SOLR"""
        url = urljoin(self.solr_url, endpoint)
        kwargs.setdefault('auth', self.solr_auth)
        kwargs.setdefault('verify', self.verify_ssl)
        kwargs.setdefault('timeout', self.timeout)
        
        response = requests.request(method, url, **kwargs)
        response.raise_for_status()
        return response.json()

    def get_cdrs(self, page=1, per_page=10, **filters):
        """Lấy danh sách CDR từ SOLR với phân trang và lọc"""
        query = '*:*'
        fq = []
        
        if filters.get('source'):
            fq.append(f'source_number:{filters["source"]}')
        if filters.get('destination'):
            fq.append(f'destination_number:{filters["destination"]}')
        if filters.get('start_date'):
            fq.append(f'start_time:[{filters["start_date"]} TO *]')
        if filters.get('end_date'):
            fq.append(f'start_time:[* TO {filters["end_date"]}]')
        if filters.get('call_type'):
            fq.append(f'call_type:{filters["call_type"]}')
        if filters.get('call_status'):
            fq.append(f'call_status:{filters["call_status"]}')

        params = {
            'q': query,
            'start': (page - 1) * per_page,
            'rows': per_page,
            'sort': 'start_time desc',
            'wt': 'json'
        }
        if fq:
            params['fq'] = fq

        result = self._solr_request('GET', 'select', params=params)
        
        return {
            'items': result.get('response', {}).get('docs', []),
            'total': result.get('response', {}).get('numFound', 0),
            'page': page,
            'per_page': per_page
        }

    def get_cdr_by_id(self, call_id):
        """Lấy thông tin CDR theo ID"""
        params = {
            'q': f'call_id:{call_id}',
            'wt': 'json'
        }
        result = self._solr_request('GET', 'select', params=params)
        docs = result.get('response', {}).get('docs', [])
        return docs[0] if docs else None

    def create_cdr(self, data):
        """Tạo mới CDR trong SOLR"""
        # Thêm timestamp
        data['created_at'] = datetime.utcnow().isoformat()
        data['updated_at'] = data['created_at']
        
        # Gửi request đến SOLR
        self._solr_request('POST', 'update', 
            json=[data],
            params={'commit': 'true'}
        )
        
        return data

    def update_cdr(self, call_id, data):
        """Cập nhật CDR trong SOLR"""
        # Kiểm tra CDR tồn tại
        cdr = self.get_cdr_by_id(call_id)
        if not cdr:
            return None

        # Cập nhật timestamp
        data['updated_at'] = datetime.utcnow().isoformat()
        data['id'] = cdr['id']  # Giữ nguyên ID
        
        # Gửi request đến SOLR
        self._solr_request('POST', 'update',
            json=[data],
            params={'commit': 'true'}
        )
        
        return data

    def delete_cdr(self, call_id):
        """Xóa CDR từ SOLR"""
        cdr = self.get_cdr_by_id(call_id)
        if not cdr:
            return False

        # Gửi request xóa đến SOLR
        self._solr_request('POST', 'update',
            json={'delete': {'query': f'call_id:{call_id}'}},
            params={'commit': 'true'}
        )
        
        return True

    def get_cdr_stats(self, start_date=None, end_date=None):
        """Lấy thống kê CDR từ SOLR"""
        query = '*:*'
        fq = []
        
        if start_date:
            fq.append(f'start_time:[{start_date} TO *]')
        if end_date:
            fq.append(f'start_time:[* TO {end_date}]')

        params = {
            'q': query,
            'wt': 'json',
            'rows': 0,
            'facet': 'true',
            'facet.field': ['call_type', 'call_status'],
            'facet.date': 'start_time',
            'facet.date.start': start_date or 'NOW-30DAYS',
            'facet.date.end': end_date or 'NOW',
            'facet.date.gap': '+1DAY'
        }
        if fq:
            params['fq'] = fq

        result = self._solr_request('GET', 'select', params=params)
        
        return {
            'total': result.get('response', {}).get('numFound', 0),
            'facets': result.get('facet_counts', {}),
            'date_facets': result.get('facet_dates', {})
        } 