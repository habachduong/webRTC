import React from 'react';
import './style.scss';

const ModalAnswered = ({ isOpen, onClose, callData }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content">
        <h2>Thông tin cuộc gọi</h2>
        <div className="modal-body">
          <div className="call-info">
            <p><strong>Số điện thoại:</strong> {callData?.phone}</p>
            <p><strong>Thời gian gọi:</strong> {callData?.time}</p>
            <p><strong>Trạng thái:</strong> {callData?.status}</p>
            <p><strong>Agent:</strong> {callData?.agent}</p>
          </div>
          <div className="call-actions">
            <button className="play-recording">
              <span>▶</span> Nghe lại
            </button>
            <button className="download-recording">
              <span>↓</span> Tải xuống
            </button>
          </div>
        </div>
        <div className="modal-footer">
          <button onClick={onClose}>Đóng</button>
        </div>
      </div>
    </div>
  );
};

export default ModalAnswered; 