import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const QueueReport = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Báo cáo Queue" />
        <div className="page-content">
          <h2>Báo cáo Queue</h2>
          {/* Add queue report content here */}
        </div>
      </div>
    </div>
  );
};

export default QueueReport; 