import React from 'react';
import './style.scss';

const ModalNumber = ({ isOpen, onClose }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content">
        <h2>Thêm số điện thoại</h2>
        <div className="modal-body">
          <div className="form-group">
            <label>Số điện thoại</label>
            <input type="tel" placeholder="Nhập số điện thoại" />
          </div>
          <div className="form-group">
            <label>Ghi chú</label>
            <textarea placeholder="Nhập ghi chú"></textarea>
          </div>
        </div>
        <div className="modal-footer">
          <button onClick={onClose}>Hủy</button>
          <button>Thêm</button>
        </div>
      </div>
    </div>
  );
};

export default ModalNumber; 