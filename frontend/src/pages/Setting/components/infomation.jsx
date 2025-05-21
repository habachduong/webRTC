import Avatar from "../../../asset/image-60.png";
import Edit from "../../../asset/edit-info.png";
import Save from "../../../asset/save.png";
import Lock from "../../../asset/lock.png"

import "./infomation.scss";
import { useDispatch } from "react-redux";
import { setChangePass } from "../../../redux/slice/appReduce";
const Information = () => {
  const dispatch = useDispatch();
  const handleOpen = () => {
    dispatch(setChangePass(true));
  };
  return (
    <div className="information">
      <div className="information-content">
        <div className="information-avatar">
          <img className="information-img" src={Avatar} alt="avatar" />
          <div className="information-edit">
            <img src={Edit} alt="edit" />
          </div>

          <p>Techcombank</p>
        </div>
        <div className="information-form">
          <div className="information-item">
            <div className="contract-input information-input">
              <label>Tên người dùng:</label>
              <input placeholder="Techcombank" />
            </div>
            <div className="contract-input information-input">
              <label>Số máy lẻ:</label>
              <input placeholder="094632318" />
            </div>
          </div>
          <div className="information-item">
            <div className="contract-input information-input">
              <label>Email:</label>
              <input placeholder="a@gmail.com" />
            </div>
            <div className="contract-input information-input">
              <label>Đổi mật khẩu:</label>
              <div className="information-pass">
                <input placeholder="*******" type="password" />
                <div className="information-change" onClick={() => handleOpen()}>
                  <p>Đổi mật khẩu</p>
                  <img src={Lock} alt="lock" />
                </div>
              </div>
            </div>
          </div>
          <div className="information-item">
            <div className="contract-input information-input">
              <label htmlFor="MNS">Mã nhân sự:</label>
              <select
                className="information-select"
                name="MNS"
                id="MNS"
                style={{ width: "48%" }} 
              >
                <option value="5">FSI 0000777</option>
                <option value="10">FSI 0000777</option>
                <option value="15">FSI 0000777</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div className="information-footer">
        <div className="information-btn">
          <img src={Save} alt="save" />
          Lưu tác nghiệp
        </div>
      </div>
    </div>
  );
};
export default Information;
