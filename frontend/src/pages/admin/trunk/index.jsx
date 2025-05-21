import React from 'react';
import Header from '../../../components/header/header';
import '../../../styles/common.scss';
import './style.scss';

const TrunkManagement = () => {
  return (
    <div className="page-container">
      <div className="page-body">
        <Header title="Quản lý Trunk" />
        <div className="page-content">
          <h2>Quản lý Trunk</h2>
          {/* Add trunk management content here */}
        </div>
      </div>
    </div>
  );
};

export default TrunkManagement; 