import os
import json
import redis
from datetime import datetime, timedelta
import logging

logger = logging.getLogger(__name__)

class RedisService:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(RedisService, cls).__new__(cls)
            cls._instance._initialize()
        return cls._instance

    def _initialize(self):
        """Khởi tạo kết nối Redis"""
        try:
            self.redis = redis.Redis(
                host=os.getenv('REDIS_HOST', 'redis'),
                port=int(os.getenv('REDIS_PORT', 6379)),
                password=os.getenv('REDIS_PASSWORD', None),
                db=int(os.getenv('REDIS_DB', 0)),
                ssl=os.getenv('REDIS_SSL_ENABLED', 'false').lower() == 'true',
                ssl_cert_reqs=None if os.getenv('REDIS_SSL_VERIFY', 'false').lower() == 'false' else 'required',
                socket_timeout=int(os.getenv('REDIS_SOCKET_TIMEOUT', 5)),
                socket_connect_timeout=int(os.getenv('REDIS_SOCKET_CONNECT_TIMEOUT', 5)),
                retry_on_timeout=os.getenv('REDIS_RETRY_ON_TIMEOUT', 'true').lower() == 'true',
                max_connections=int(os.getenv('REDIS_MAX_CONNECTIONS', 10))
            )
            # Test kết nối
            self.redis.ping()
            logger.info('Kết nối Redis thành công')
        except Exception as e:
            logger.error(f'Lỗi kết nối Redis: {str(e)}')
            raise

    def set(self, key, value, expire=None):
        """Lưu giá trị vào Redis"""
        try:
            if isinstance(value, (dict, list)):
                value = json.dumps(value)
            self.redis.set(key, value, ex=expire)
            return True
        except Exception as e:
            logger.error(f'Lỗi khi lưu vào Redis: {str(e)}')
            return False

    def get(self, key, default=None):
        """Lấy giá trị từ Redis"""
        try:
            value = self.redis.get(key)
            if value is None:
                return default
            try:
                return json.loads(value)
            except json.JSONDecodeError:
                return value.decode('utf-8')
        except Exception as e:
            logger.error(f'Lỗi khi đọc từ Redis: {str(e)}')
            return default

    def delete(self, key):
        """Xóa key từ Redis"""
        try:
            return self.redis.delete(key) > 0
        except Exception as e:
            logger.error(f'Lỗi khi xóa từ Redis: {str(e)}')
            return False

    def exists(self, key):
        """Kiểm tra key có tồn tại không"""
        try:
            return self.redis.exists(key) > 0
        except Exception as e:
            logger.error(f'Lỗi khi kiểm tra key trong Redis: {str(e)}')
            return False

    def setex(self, key, expire, value):
        """Lưu giá trị với thời gian hết hạn"""
        return self.set(key, value, expire)

    def ttl(self, key):
        """Lấy thời gian còn lại của key"""
        try:
            return self.redis.ttl(key)
        except Exception as e:
            logger.error(f'Lỗi khi lấy TTL từ Redis: {str(e)}')
            return -1

    def incr(self, key, amount=1):
        """Tăng giá trị của key"""
        try:
            return self.redis.incr(key, amount)
        except Exception as e:
            logger.error(f'Lỗi khi tăng giá trị trong Redis: {str(e)}')
            return None

    def decr(self, key, amount=1):
        """Giảm giá trị của key"""
        try:
            return self.redis.decr(key, amount)
        except Exception as e:
            logger.error(f'Lỗi khi giảm giá trị trong Redis: {str(e)}')
            return None

    def expire(self, key, seconds):
        """Đặt thời gian hết hạn cho key"""
        try:
            return self.redis.expire(key, seconds)
        except Exception as e:
            logger.error(f'Lỗi khi đặt expire cho key trong Redis: {str(e)}')
            return False

    def keys(self, pattern='*'):
        """Tìm các key theo pattern"""
        try:
            return [key.decode('utf-8') for key in self.redis.keys(pattern)]
        except Exception as e:
            logger.error(f'Lỗi khi tìm keys trong Redis: {str(e)}')
            return []

    def flush_db(self):
        """Xóa toàn bộ dữ liệu trong database hiện tại"""
        try:
            return self.redis.flushdb()
        except Exception as e:
            logger.error(f'Lỗi khi xóa database trong Redis: {str(e)}')
            return False

    def close(self):
        """Đóng kết nối Redis"""
        try:
            self.redis.close()
            logger.info('Đã đóng kết nối Redis')
        except Exception as e:
            logger.error(f'Lỗi khi đóng kết nối Redis: {str(e)}') 