import InfoCaller from "./Infocaller";

import { useState } from "react";
import History from "./History";
import Save from "../../../asset/save.png"
import "./Form2.scss";
const Form2 = () => {
  const [tab, setTab] = useState("1");
  return (
    <div className="form2 form1">
      <InfoCaller />
      <div className="form2-info">
        <div className="form2-title">Thông tin khách hàng</div>
        <div className="from2-item">
          <div className="contract-input">
            <label>Id Khách hàng</label>
            <input placeholder="1000000035" />
          </div>
          <div className="contract-input">
            <label>CMND</label>
            <input placeholder="1000000035" />
          </div>
          <div className="contract-input">
            <label>Tên khách hàng</label>
            <input placeholder="1000000035" />
          </div>
        </div>
        <div className="from2-item">
          <div className="contract-input">
            <label>ĐT cố định</label>
            <input placeholder="1000000035" />
          </div>
          <div className="contract-input">
            <label>ĐT di động</label>
            <input placeholder="1000000035" />
          </div>
          <div className="contract-input">
            <label>ĐT cơ quan</label>
            <input placeholder="1000000035" />
          </div>
        </div>
        <div className="from2-item">
          <div className="contract-input">
            <label>Giới tính</label>
            <input placeholder="Nam" />
          </div>
          <div className="contract-input">
            <label>Email</label>
            <input placeholder="techcombank@gmail.com" />
          </div>
          <div className="contract-input">
            <label>Năm sinh</label>
            <input placeholder="17/08/1998" />
          </div>
        </div>
        <div className="from2-item">
          <div className="contract-input from2-input">
            <label>Chuyên viên quản lý</label>
            <input placeholder="Nguyễn Văn A" />
          </div>
          <div className="contract-input from2-input">
            <label>Queue hiện tại</label>
            <input placeholder="MGR" />
          </div>
        </div>
        <div className="from2-item">
          <div className="contract-input" style={{ width: "100%" }}>
            <label>Địa chỉ</label>
            <input placeholder="no 44 Dao Tan STR-Badinh dis.hanoi" />
          </div>
        </div>
      </div>
      <div className="form2-content form2-info">
        <div className="form2-tab">
          <div
            className={`from2-tab-item ${tab === "1" ? "active" : ""}`}
            onClick={() => setTab("1")}
          >
            Tác Nghiệp
          </div>
          <div
            className={`from2-tab-item ${tab === "2" ? "active" : ""}`}
            onClick={() => setTab("2")}
          >
            Lịch sử Tác Nghiệp
          </div>
        </div>
        <div className="form2-tab-content">
          {tab === "1" ? (
            <div className="form1-tab1">
              <div className="from2-item">
                <div className="contract-input from2-input">
                  <label>Số điện thoại</label>
                  <input placeholder="1000000035" />
                </div>
                <div className="contract-input from2-input">
                  <label>Tên người liên hệ</label>
                  <input placeholder="KH 1000000035" />
                </div>
              </div>
              <div className="from2-item">
                <div className="contract-input from2-input">
                  <label>Thời gian bắt đầu</label>
                  <input placeholder="09/06/2023 15:45:22" />
                </div>
                <div className="contract-input from2-input">
                  <label>Thời gian kết thúc</label>
                  <input placeholder="09/06/2023 15:45:22" />
                </div>
              </div>
              <div className="from2-item">
                <div className="contract-input from2-input">
                  <label htmlFor="NLH">Người liên hệ</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
                <div className="contract-input from2-input">
                <label htmlFor="NLH">Phương thức gọi</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
              </div>
              <div className="from2-item">
                <div className="contract-input from2-input">
                <label htmlFor="NLH">Kết quả</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
                <div className="contract-input from2-input">
                <label htmlFor="NLH">Phàn nàn của KH</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
              </div>
              <div className="from2-item">
                <div className="contract-input from2-input">
                <label htmlFor="NLH">Khó thu</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
                <div className="contract-input from2-input">
                <label htmlFor="NLH">Nguyên nhân nợ quá hạn</label>
                  <select
                    className="from2-select"
                    name="NLH"
                    id="NLH"
                  >
                    <option value="5">Khách hàng</option>
                    <option value="10">Khách hàng</option>
                    <option value="15">Khách hàng</option>
                  </select>
                </div>
              </div>
              <div className="contract-input" style={{ width: "100%" }}>
                <label>Chi tiết tác nghiệp</label>
                <input placeholder="1000000035" style={{ height: 124 }} />
              </div>
              <div className="form2-footer">
                <div className="from2-btn">
                  <img src={Save} alt="save" />
                  Lưu tác nghiệp
                </div>
                <div className="from2-btn btn-active">
                  Lưu tác nghiệp
                </div>
              </div>
            </div>
          ) : (
            <History />
          )}
        </div>
      </div>
    </div>
  );
};
export default Form2;
