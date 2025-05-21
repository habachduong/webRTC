import { Switch } from "antd";
import Save from "../../../asset/save.png";
// import Rectangle from "../../../asset/rectangle 1.png";
// import Setting from "../../../asset/lets-icons_setting-line-light.png";
// import Polygon from "../../../asset/polygon 2.png";
// import Call from "../../../asset/call.png";
// import CallAgree from "../../../asset/callagree.png";
import "./automatic.scss";
import { useDispatch, useSelector } from "react-redux";
import { setCollapse } from "../../../redux/slice/appReduce";
import { setAutoReceived } from "../../../reducers/appReduce";

const Automatic = () => {
  const {autoReceived,collapse} = useSelector(states => states.appReduce)
  const dispatch = useDispatch()
  const onCollapse = (checked) => {
    dispatch(setCollapse(checked))
  };
  const onAutoReceived = (checked) => {
    dispatch(setAutoReceived(checked))
  }
  return (
    <div className="automatic">
      <div className="automatic-body">
        <div className="automatic-content">
          <div className="automatic-item">
            <p>Tự động nhận cuộc gọi đến:</p>
            <Switch checked={autoReceived} onChange={onAutoReceived} />
          </div>
          <div className="automatic-item">
            <p>Sử dựng popup thu gọn</p>
            <Switch checked={collapse} onChange={onCollapse} />
          </div>
          <div className="automatic-item">
            <p>Tự động bật form ghi chú</p>
            <Switch defaultChecked />
          </div>
          <div className="automatic-item">
            <p>Tự động truyển thành trạng thái inActive sau(phút)</p>
            <div className="automatic-time">
              <div className="automatic-time-item automatic-active">5</div>
              <div className="automatic-time-item">10</div>
              <div className="automatic-time-item">15</div>
            </div>
          </div>
        </div>
        <div className="automatic-footer">
          <div className="automatic-btn">
            <img src={Save} alt="save" />
            Lưu thông tin
          </div>
        </div>
      </div>
      {/* <div className="automatic-demo">
        <div className="modal" style={{ display: "block" }}>
          <div className="modal-title">
            <div className="modal-name">Le Thi Soa</div>
            <div className="modal-icon">
              <img
                className="modal-rectangle"
                src={Rectangle}
                alt="Rectangle"
              />
              <img className="modal-setting" src={Setting} alt="Setting" />
              <img className="modal-polygon" src={Polygon} alt="Polygon" />
            </div>
          </div>
          <div className="modal-content">
            <div className="modal-info">
              <div className="modal-header">
                <p>Cuộc gọi đến</p>
              </div>

              <div className="modal-time">00:12</div>
            </div>
            <p className="modal-caller">Anh Vu</p>
            <div style={{ marginBottom: 34 }}>
              <span className="modal-phone">via</span>
              <strong>842873030065</strong>
            </div>
            <div
              className={`modal-InformationCaller ${
                collapse ? "modal-InformationCaller-active" : ""
              }`}
            >
              <p className="modal-InfoName">Nguyen Anh Vu</p>
              <p className="modal-InfoName">CID: 989312</p>
              <p className="modal-InfoName"> Camp: 98122</p>
            </div>
          </div>
          <div className="modal-iconCall">
            <div className="modal-refuse">
              <img src={Call} alt="call" />
              <div className="modal-point1  modal-point"></div>
              <div className="modal-point2 modal-point"></div>
              <div className="modal-point3 modal-point"></div>
              <div className="modal-point4 modal-point"></div>
            </div>
            <div className="modal-agree">
              <div className="modal-point4  modal-point"></div>
              <div className="modal-point3 modal-point"></div>
              <div className="modal-point3 modal-point"></div>
              <div className="modal-point1 modal-point"></div>
              <img src={CallAgree} alt="call" />
            </div>
          </div>
        </div>
      </div> */}
    </div>
  );
};
export default Automatic;
