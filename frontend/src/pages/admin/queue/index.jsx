import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const QueueManagement = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Quản lý Queue" />
        <div className="page-content">
          <h2>Quản lý Queue</h2>
          {/* Add queue management content here */}
        </div>
      </div>
    </div>
  );
};

export default QueueManagement; 