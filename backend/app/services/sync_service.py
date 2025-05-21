from app.models.cdr import CDR
from app.services.cdr_service import CDRService
from app import db
from datetime import datetime, timedelta
import logging

logger = logging.getLogger(__name__)

class SyncService:
    def __init__(self):
        self.cdr_service = CDRService()
        self.batch_size = 1000
        self.last_sync_time = None

    def _convert_to_solr_doc(self, cdr):
        """Chuyển đổi CDR từ MySQL sang định dạng SOLR"""
        return {
            'id': f'cdr_{cdr.call_id}',
            'call_id': cdr.call_id,
            'source_number': cdr.source_number,
            'destination_number': cdr.destination_number,
            'start_time': cdr.start_time.isoformat(),
            'end_time': cdr.end_time.isoformat() if cdr.end_time else None,
            'duration': cdr.duration,
            'call_type': cdr.call_type,
            'call_status': cdr.call_status,
            'call_direction': cdr.call_direction,
            'trunk': cdr.trunk,
            'cost': float(cdr.cost) if cdr.cost else 0.0,
            'notes': cdr.notes,
            'created_at': cdr.created_at.isoformat(),
            'updated_at': cdr.updated_at.isoformat()
        }

    def sync_all(self):
        """Đồng bộ toàn bộ dữ liệu từ MySQL sang SOLR"""
        try:
            # Lấy tất cả CDR từ MySQL
            cdrs = CDR.query.all()
            total = len(cdrs)
            logger.info(f'Bắt đầu đồng bộ {total} CDR từ MySQL sang SOLR')

            # Xử lý theo batch
            for i in range(0, total, self.batch_size):
                batch = cdrs[i:i + self.batch_size]
                solr_docs = [self._convert_to_solr_doc(cdr) for cdr in batch]
                
                # Gửi batch đến SOLR
                self.cdr_service._solr_request('POST', 'update',
                    json=solr_docs,
                    params={'commit': 'true'}
                )
                
                logger.info(f'Đã đồng bộ {i + len(batch)}/{total} CDR')

            self.last_sync_time = datetime.utcnow()
            logger.info('Hoàn thành đồng bộ dữ liệu')
            return True

        except Exception as e:
            logger.error(f'Lỗi khi đồng bộ dữ liệu: {str(e)}')
            return False

    def sync_incremental(self):
        """Đồng bộ dữ liệu mới từ lần đồng bộ cuối"""
        try:
            if not self.last_sync_time:
                return self.sync_all()

            # Lấy CDR mới từ MySQL
            cdrs = CDR.query.filter(
                CDR.updated_at >= self.last_sync_time
            ).all()
            
            total = len(cdrs)
            if total == 0:
                logger.info('Không có dữ liệu mới cần đồng bộ')
                return True

            logger.info(f'Bắt đầu đồng bộ {total} CDR mới')

            # Xử lý theo batch
            for i in range(0, total, self.batch_size):
                batch = cdrs[i:i + self.batch_size]
                solr_docs = [self._convert_to_solr_doc(cdr) for cdr in batch]
                
                # Gửi batch đến SOLR
                self.cdr_service._solr_request('POST', 'update',
                    json=solr_docs,
                    params={'commit': 'true'}
                )
                
                logger.info(f'Đã đồng bộ {i + len(batch)}/{total} CDR mới')

            self.last_sync_time = datetime.utcnow()
            logger.info('Hoàn thành đồng bộ dữ liệu mới')
            return True

        except Exception as e:
            logger.error(f'Lỗi khi đồng bộ dữ liệu mới: {str(e)}')
            return False

    def cleanup_old_data(self, days=90):
        """Xóa dữ liệu cũ từ SOLR"""
        try:
            cutoff_date = (datetime.utcnow() - timedelta(days=days)).isoformat()
            
            # Xóa dữ liệu cũ từ SOLR
            self.cdr_service._solr_request('POST', 'update',
                json={'delete': {'query': f'start_time:[* TO {cutoff_date}]'}},
                params={'commit': 'true'}
            )
            
            logger.info(f'Đã xóa dữ liệu CDR cũ hơn {days} ngày từ SOLR')
            return True

        except Exception as e:
            logger.error(f'Lỗi khi xóa dữ liệu cũ: {str(e)}')
            return False 