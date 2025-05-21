from flask import Blueprint, request, jsonify, current_app
from app.models.cdr import CDR
from app import db, jwt
from app.services.cdr_service import CDRService
from app.utils.response import success_response, error_response
from datetime import datetime

cdr_bp = Blueprint('cdr', __name__)
cdr_service = CDRService()

@cdr_bp.route('/', methods=['GET'])
@jwt.required()
def get_cdrs():
    """Lấy danh sách CDR với phân trang và lọc"""
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 10, type=int)
        source = request.args.get('source')
        destination = request.args.get('destination')
        start_date = request.args.get('start_date')
        end_date = request.args.get('end_date')
        call_type = request.args.get('call_type')
        call_status = request.args.get('call_status')

        result = cdr_service.get_cdrs(
            page=page,
            per_page=per_page,
            source=source,
            destination=destination,
            start_date=start_date,
            end_date=end_date,
            call_type=call_type,
            call_status=call_status
        )
        return success_response(result)
    except Exception as e:
        current_app.logger.error(f"Get CDRs error: {str(e)}")
        return error_response('Failed to get CDRs', 500)

@cdr_bp.route('/<string:call_id>', methods=['GET'])
@jwt.required()
def get_cdr(call_id):
    """Lấy thông tin chi tiết một CDR"""
    try:
        cdr = cdr_service.get_cdr_by_id(call_id)
        if not cdr:
            return error_response('CDR not found', 404)
        return success_response(cdr)
    except Exception as e:
        current_app.logger.error(f"Get CDR error: {str(e)}")
        return error_response('Failed to get CDR', 500)

@cdr_bp.route('/', methods=['POST'])
@jwt.required()
def create_cdr():
    """Tạo mới một CDR"""
    try:
        data = request.json
        cdr = cdr_service.create_cdr(data)
        return success_response(cdr, 'CDR created successfully', 201)
    except Exception as e:
        current_app.logger.error(f"Create CDR error: {str(e)}")
        return error_response('Failed to create CDR', 500)

@cdr_bp.route('/<string:call_id>', methods=['PUT'])
@jwt.required()
def update_cdr(call_id):
    """Cập nhật thông tin CDR"""
    try:
        data = request.json
        cdr = cdr_service.update_cdr(call_id, data)
        if not cdr:
            return error_response('CDR not found', 404)
        return success_response(cdr, 'CDR updated successfully')
    except Exception as e:
        current_app.logger.error(f"Update CDR error: {str(e)}")
        return error_response('Failed to update CDR', 500)

@cdr_bp.route('/<string:call_id>', methods=['DELETE'])
@jwt.required()
def delete_cdr(call_id):
    """Xóa một CDR"""
    try:
        result = cdr_service.delete_cdr(call_id)
        if not result:
            return error_response('CDR not found', 404)
        return success_response(None, 'CDR deleted successfully')
    except Exception as e:
        current_app.logger.error(f"Delete CDR error: {str(e)}")
        return error_response('Failed to delete CDR', 500)

@cdr_bp.route('/stats', methods=['GET'])
@jwt.required()
def get_cdr_stats():
    """Lấy thống kê CDR"""
    try:
        start_date = request.args.get('start_date')
        end_date = request.args.get('end_date')
        stats = cdr_service.get_cdr_stats(start_date, end_date)
        return success_response(stats)
    except Exception as e:
        current_app.logger.error(f"Get CDR stats error: {str(e)}")
        return error_response('Failed to get CDR stats', 500) 