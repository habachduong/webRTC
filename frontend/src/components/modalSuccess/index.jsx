import React from 'react';
import './style.scss';

const ModalSuccess = ({ isOpen, onClose, message }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content success">
        <div className="modal-icon">✓</div>
        <h2>Thành công</h2>
        <p>{message}</p>
        <button onClick={onClose}>Đóng</button>
      </div>
    </div>
  );
};

export default ModalSuccess; 