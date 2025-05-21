import ClockLight from "../../../asset/clock_light.png";
import IconSearch from "../../../asset/search.png";
import BtnSearch from "../../../asset/prime_search-plus.png";
import Excel from "../../../asset/microsoftexcellogo.png";
import { DatePicker } from "antd";

import "./menu.scss";
import { useDispatch } from "react-redux";
import { setTime } from "../../../reducers/dashboard";

const Menu = () => {
  const { RangePicker } = DatePicker;
  const dispatch = useDispatch();
  const onOk = (value) => {
    dispatch(setTime(value));
  };
 
  return (
    <div className="menu">
      <div className="menu-left">
        <div className="menu-item active">Cuộc gọi</div>
        <div className="menu-item ">Nhắn tin </div>
        <div className="menu-item">Khảo sát</div>
        {/* <div className="menu-time">
          <img src={ClockLight} alt="clock" />
          <span>28/08/2020 00:00</span>
          <strong>-</strong>
          <span>29/08/2020 00:00</span>
        </div> */}

        <RangePicker
          showTime={{
            format: "HH:mm:ss",
          }}
          format="YYYY-MM-DD HH:mm:ss"
          onOk={onOk}
          // allowClear= {false}
          suffixIcon={
            <img src={ClockLight} alt="clock" style={{ width: 18 }} />
          }
        />
      </div>
      <div className="menu-right">
        <div className="menu-search">
          <img className="menu-icon" src={IconSearch} alt="IconSearch" />
          <input className="menu-input" placeholder="Tìm kiếm" />
          <img className="menu-btn" src={BtnSearch} alt="btnSearch" />
        </div>
        <div className="menu-excel">
          <img src={Excel} alt="excel" />
          <span>Xuất Excel</span>
        </div>
      </div>
    </div>
  );
};
export default Menu;
