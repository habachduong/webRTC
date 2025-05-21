import React from 'react';
import './styles.scss';

const ModalForm = ({ data, children }) => {
  return (
    <div className="modal-form-overlay">
      <div className="modal-form-content">
        <div className="modal-form-header">
          <h3>{data.title}</h3>
          <p>{data.sub}</p>
        </div>
        <div className="modal-form-body">
          {children}
        </div>
      </div>
    </div>
  );
};

export default ModalForm; 