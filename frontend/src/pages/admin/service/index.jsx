import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const ServiceManagement = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Quản lý Service" />
        <div className="page-content">
          <h2>Quản lý Service</h2>
          {/* Add service management content here */}
        </div>
      </div>
    </div>
  );
};

export default ServiceManagement; 