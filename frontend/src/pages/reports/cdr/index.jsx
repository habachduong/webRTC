import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const CDRReport = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Báo cáo CDR" />
        <div className="page-content">
          <h2>Báo cáo CDR</h2>
          {/* Add CDR report content here */}
        </div>
      </div>
    </div>
  );
};

export default CDRReport; 