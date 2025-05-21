import React, { useState } from 'react';
import './inputPass.scss';
import eyeOpen from '../../../asset/eye.png';
import eyeClose from '../../../asset/eye-close.png';

const InputPass = ({ label, name, value, onChange, error, required }) => {
  const [showPassword, setShowPassword] = useState(false);

  return (
    <div className="input-pass-group">
      <label htmlFor={name}>
        {label}
        {required && <span className="required">*</span>}
      </label>
      <div className="input-pass-wrapper">
        <input
          type={showPassword ? 'text' : 'password'}
          id={name}
          name={name}
          value={value}
          onChange={onChange}
          className={error ? 'error' : ''}
        />
        <button
          type="button"
          className="toggle-password"
          onClick={() => setShowPassword(!showPassword)}
        >
          <img
            src={showPassword ? eyeOpen : eyeClose}
            alt={showPassword ? 'Hide password' : 'Show password'}
          />
        </button>
      </div>
      {error && <span className="error-message">{error}</span>}
    </div>
  );
};

export default InputPass; 