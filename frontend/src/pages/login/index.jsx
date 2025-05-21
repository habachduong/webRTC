import React, { useContext, useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import SipCallerContext from "../../sipCallerContext";
import {
  setAutoRegister,
  setDisplayName,
  setOutboundProxy,
  setPassword,
  setSipUri,
} from "../../actions/stateActions";
import { setRemember } from "../../reducers/appReduce";
import { setMenuActive } from "../../reducers/dashboard";
import eyeOpen from '../../asset/eye.png';
import eyeClose from '../../asset/eye-close.png';
import logo from '../../asset/logo 2.png';
import "./index.scss";

const Login = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const sipCaller = useContext(SipCallerContext);
  const { remember } = useSelector(states => states.appReduce);
  const { sipUri, password } = useSelector(states => states.user);

  const [url, setUrl] = useState("");
  const [pass, setPass] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  useEffect(() => {
    if (remember) {
      setPass(password);
      setUrl(sipUri);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const Register = () => {
    dispatch(setDisplayName({ displayName: "Dat" }));
    dispatch(setSipUri({ sipUri: url }));
    dispatch(setPassword({ password: pass }));
    dispatch(
      setOutboundProxy({ outboundProxy: "wss://fsivietnam.com.vn:8089/ws" })
    );
    sipCaller.register();
    dispatch(setAutoRegister({ autoRegister: true }));
    dispatch(setMenuActive("Home"));
    navigate("/dashboard", { replace: true });
  };

  return (
    <div className="login-root">
      <img src={logo} alt="Techcombank" className="login-logo" />
      <div className="login-form-container">
        <div className="login-title">Đăng nhập</div>
        <div className="login-sub">Vui lòng nhập thông tin để truy cập hệ thống</div>
        <div className="login-input">
          <input
            type="text"
            placeholder="user1@techcombank.com.vn"
            value={url}
            onChange={e => setUrl(e.target.value)}
            autoComplete="username"
          />
        </div>
        <div className="login-input input-pass-wrapper">
          <input
            type={showPassword ? "text" : "password"}
            placeholder="*******"
            value={pass}
            onChange={e => setPass(e.target.value)}
            autoComplete="current-password"
          />
          <button
            type="button"
            className="toggle-password"
            onClick={() => setShowPassword(!showPassword)}
            tabIndex={-1}
          >
            <img src={showPassword ? eyeOpen : eyeClose} alt={showPassword ? "Ẩn" : "Hiện"} />
          </button>
        </div>
        <div className="login-checkbox-row">
          <input
            type="checkbox"
            className="custom-checkbox"
            id="rememberMe"
            checked={remember}
            onChange={() => dispatch(setRemember(!remember))}
          />
          <label htmlFor="rememberMe">Ghi nhớ tôi</label>
          <Link to="/forgotPass" className="login-forgot">Quên mật khẩu?</Link>
        </div>
        <button className="login-btn" onClick={Register}>Đăng nhập</button>
        <div className="login-bottom">
          Chưa có tài khoản?
          <Link to="/register" className="login-register">Đăng ký</Link>
        </div>
      </div>
    </div>
  );
};

export default Login;
