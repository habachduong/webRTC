import Plus from "../../../asset/plus.png"
import "./Contract.scss"
const Contract = () => {
  return (
    <div className="contract">
      <div className="contract-title">Danh sách hợp đồng</div>
      <div className="contract-content">
        <div className="contract-input">
          <label>Id Khách hàng</label>
          <input placeholder="1000000035"/>
        </div>
        <div className="contract-input">
          <label>CMND</label>
          <input placeholder="1000000035"/>
        </div>
        <div className="contract-input">
          <label>ĐT cố định</label>
          <input placeholder="1000000035"/>
        </div>
        <div className="contract-input">
          <label>Giới tính</label>
          <input placeholder="1000000035"/>
        </div>
        <div className="contract-input">
          <label>ĐT cố định</label>
          <input placeholder="1000000035"/>
        </div>
      </div>
      <div className="contract-evaluate">
        <span>Đánh giá</span>
        <img src={Plus} alt="plus"/>
      </div>
    </div>
  );
};

export default Contract;
