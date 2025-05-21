import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const SIPManagement = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Quản lý SIP" />
        <div className="page-content">
          <h2>Quản lý SIP</h2>
          {/* Add SIP management content here */}
        </div>
      </div>
    </div>
  );
};

export default SIPManagement; 