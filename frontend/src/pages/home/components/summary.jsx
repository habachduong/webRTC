import SummaryTotal from "../../../asset/frame 9.png";
import SummaryTime from "../../../asset/summarytime.png";
import SummaryAnswer from "../../../asset/summaryanser.png";
import SummaryMiss from "../../../asset/summarymiss.png";
import SummaryFail from "../../../asset/summaryfail.png";
import "./summary.scss";
const Summary = ({data}) => {
  return (
    <div className="Summary">
      <div className="Summary-title">
        <div className="Summary-name">Cuộc gọi</div>
        <div className="Summary-time">
          <p>Last updated: {data.last_update}</p>
        </div>
      </div>
      <div className="Summary-content">
        <div className="Summary-item">
          <div className="Summary-avatar">
            <img src={SummaryTotal} alt="Total" />
            <span> Tổng số cuộc gọi</span>
          </div>
          <div className="Summary-number">4</div>
        </div>
        <div className="Summary-item">
          <div className="Summary-avatar">
            <img src={SummaryTime} alt="Total" />
            <span> Tổng thời gian</span>
          </div>
          <div className="Summary-number">{data.total_time}</div>
        </div>
        <div className="Summary-item">
          <div className="Summary-avatar">
            <img src={SummaryAnswer} alt="Total" />
            <span> Tổng số cuộc Answered</span>
          </div>
          <div className="Summary-number">{data.total_answered}</div>
        </div>
        <div className="Summary-item">
          <div className="Summary-avatar">
            <img src={SummaryMiss} alt="Total" />
            <span> Tổng số cuộc Missed</span>
          </div>
          <div className="Summary-number">{data.total_missed}</div>
        </div>
        <div className="Summary-item">
          <div className="Summary-avatar">
            <img src={SummaryFail} alt="Total" />
            <span> Tổng số cuộc Failed</span>
          </div>
          <div className="Summary-number">{data.total_failed}</div>
        </div>
      </div>
    </div>
  );
};

export default Summary;
