import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const BillingReport = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Báo cáo Billing" />
        <div className="page-content">
          <h2>Báo cáo Billing</h2>
          {/* Add billing report content here */}
        </div>
      </div>
    </div>
  );
};

export default BillingReport; 