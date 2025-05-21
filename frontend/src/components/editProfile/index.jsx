import React from 'react';
import './style.scss';

const EditProfile = ({ isOpen, onClose }) => {
  if (!isOpen) return null;

  return (
    <div className="modal-overlay">
      <div className="modal-content">
        <h2>Chỉnh sửa thông tin</h2>
        <div className="modal-body">
          {/* Add form content here */}
        </div>
        <div className="modal-footer">
          <button onClick={onClose}>Đóng</button>
          <button>Lưu</button>
        </div>
      </div>
    </div>
  );
};

export default EditProfile; 