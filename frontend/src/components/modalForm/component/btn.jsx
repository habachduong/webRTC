import React from 'react';
import './btn.scss';

const Button = ({ 
  type = 'button',
  variant = 'primary',
  size = 'medium',
  children,
  onClick,
  disabled,
  className = ''
}) => {
  return (
    <button
      type={type}
      className={`btn btn-${variant} btn-${size} ${className}`}
      onClick={onClick}
      disabled={disabled}
    >
      {children}
    </button>
  );
};

export default Button; 