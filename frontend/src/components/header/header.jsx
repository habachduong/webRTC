import React from 'react';
import './header.scss';

const Header = ({ title }) => {
  return (
    <header className="header">
      <div className="header-left">
        <h1>{title}</h1>
      </div>
      <div className="header-right">
        {/* Add user profile, notifications etc. here */}
      </div>
    </header>
  );
};

export default Header;