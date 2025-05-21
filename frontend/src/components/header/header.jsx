import React from 'react';
import './header.scss';
import hamburgerMenu from '../../asset/hamburger menu.png';

const Header = ({ title, onMenuClick }) => {
  return (
    <header className="header">
      <div className="header-left">
        <button className="menu-button" onClick={onMenuClick}>
          <img src={hamburgerMenu} alt="Menu" />
        </button>
        <h1>{title}</h1>
      </div>
      <div className="header-right">
        {/* Add user profile, notifications etc. here */}
      </div>
    </header>
  );
};

export default Header; 