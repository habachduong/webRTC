import InfoCaller from "./Infocaller";
import Avatar from "../../../asset/image-60.png";
import Share from "../../../asset/sharenetwork.png";
import Note from "../../../asset/note.png";
import Clock from "../../../asset/clock.png";
import Call from "../../../asset/phone calling.png";
import ArrowDown from "../../../asset/arrow - down 2.png";
import Group from "../../../asset/group.png";
import "./form1.scss";
import History from "./History";
const Form1 = () => {
  return (
    <div className="form1">
      <InfoCaller />
      <div className="form1-comment">
        <div className="from1-comment-title">
          <img src={Avatar} alt="avatar" />
          <div className="form1-comment-right">
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                gap: 24,
              }}
            >
              <div className="from1-comment-item">
                <img src={Share} alt="share" />
                <p>Phản hồi khách hàng</p>
              </div>
              <div className="from1-comment-item active">
                <img src={Note} alt="share" />
                <p>Ghi chú nội bộ</p>
              </div>
              <div className="from1-comment-item">
                <img src={Clock} alt="share" />
                <p>Tác vụ</p>
              </div>
            </div>
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                gap: 8,
              }}
            >
              <img style={{width:20,height:20}} src={Call} alt="call" />
              <img style={{width:20,height:20}} src={ArrowDown} alt="ArroeDown" />
            </div>
          </div>
        </div>
        <div className="from1-comment-content">
          <textarea placeholder="Nội dung ghi chú nội bộ..." />
          <div className="from1-comment-footer">
            <img src={Group} alt="group" />
            <div className="from1-comment-btn">
              <div className="from1-btn">Đặt lại</div>
              <div className="from1-btn active">Thêm ghi chú</div>
            </div>
          </div>
        </div>
        <div className="from1-history-title">
          <p>Lịch sử trao đổi</p>
        </div>
        <History />
      </div>
    </div>
  );
};

export default Form1;
