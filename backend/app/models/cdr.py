from app import db
from datetime import datetime

class CDR(db.Model):
    __tablename__ = 'cdrs'

    id = db.Column(db.Integer, primary_key=True)
    call_id = db.Column(db.String(50), unique=True, nullable=False)
    source_number = db.Column(db.String(20), nullable=False)
    destination_number = db.Column(db.String(20), nullable=False)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime)
    duration = db.Column(db.Integer)  # Duration in seconds
    call_type = db.Column(db.String(20))  # inbound, outbound
    call_status = db.Column(db.String(20))  # completed, failed, busy
    call_result = db.Column(db.String(50))
    call_quality = db.Column(db.Float)
    call_cost = db.Column(db.Float)
    call_route = db.Column(db.String(50))
    call_notes = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    def __repr__(self):
        return f'<CDR {self.call_id}>'

    def to_dict(self):
        return {
            'id': self.id,
            'call_id': self.call_id,
            'source_number': self.source_number,
            'destination_number': self.destination_number,
            'start_time': self.start_time.isoformat() if self.start_time else None,
            'end_time': self.end_time.isoformat() if self.end_time else None,
            'duration': self.duration,
            'call_type': self.call_type,
            'call_status': self.call_status,
            'call_result': self.call_result,
            'call_quality': self.call_quality,
            'call_cost': self.call_cost,
            'call_route': self.call_route,
            'call_notes': self.call_notes,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        } 