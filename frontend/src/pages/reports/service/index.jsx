import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const ServiceReport = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Báo cáo Service" />
        <div className="page-content">
          <h2>Báo cáo Service</h2>
          {/* Add service report content here */}
        </div>
      </div>
    </div>
  );
};

export default ServiceReport; 