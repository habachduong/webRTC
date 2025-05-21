import React from 'react';
import './style.scss';

const ModalChangePass = ({ isOpen, onClose }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content">
        <h2>Đổi mật khẩu</h2>
        <div className="modal-body">
          <div className="form-group">
            <label>Mật khẩu cũ</label>
            <input type="password" />
          </div>
          <div className="form-group">
            <label>Mật khẩu mới</label>
            <input type="password" />
          </div>
          <div className="form-group">
            <label>Xác nhận mật khẩu mới</label>
            <input type="password" />
          </div>
        </div>
        <div className="modal-footer">
          <button onClick={onClose}>Hủy</button>
          <button>Lưu</button>
        </div>
      </div>
    </div>
  );
};

export default ModalChangePass; 