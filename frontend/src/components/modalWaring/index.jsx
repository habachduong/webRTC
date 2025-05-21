import React from 'react';
import './style.scss';

const ModalWarning = ({ isOpen, onClose, message }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content warning">
        <div className="modal-icon">!</div>
        <h2>Cảnh báo</h2>
        <p>{message}</p>
        <button onClick={onClose}>Đóng</button>
      </div>
    </div>
  );
};

export default ModalWarning; 