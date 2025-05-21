import Edit from "../../../asset/edit.png";
import Avatar from "../../../asset/image-60.png";
import History from "../../../asset/clockcounterclockwise.png";
import CallHistory from "../../../asset/group 237551.png";
import "./Infoconcat.scss";
import { useDispatch, useSelector } from "react-redux";
import { setEditProfile } from "../../../redux/slice/appReduce";
const InfoConcat = () => {
  const dispatch = useDispatch();
  const sessionHistory = useSelector((states) => states.sessionHistory);

  const formatDate = (data) => {
    const date = new Date(data);
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // Tháng bắt đầu từ 0, nên cộng thêm 1
    const day = date.getDate();

    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // Formatting to ensure double digits
    const formattedMonth = month < 10 ? `0${month}` : month;
    const formattedDay = day < 10 ? `0${day}` : day;
    const formattedHours = hours < 10 ? `0${hours}` : hours;
    const formattedMinutes = minutes < 10 ? `0${minutes}` : minutes;
    const formattedSeconds = seconds < 10 ? `0${seconds}` : seconds;

    const formattedDateTime = `${year}-${formattedMonth}-${formattedDay} ${formattedHours}:${formattedMinutes}:${formattedSeconds}`;
    return formattedDateTime;
  };

  const handleOpen = () => {
    dispatch(setEditProfile(true));
  };
  return (
    <div className="infoConcat">
      <div className="infoConcat-title">
        <p>CHI TIẾT LIÊN HỆ</p>
        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: 5,
            cursor: "pointer",
          }}
          onClick={() => handleOpen()}
        >
          <img src={Edit} alt="dit" />
          <span>Sửa</span>
        </div>
      </div>
      <div className="infoConcat-avatar">
        <img src={Avatar} alt="avatar" />
      </div>
      <div className="infoConcat-content">
        <div className="infoConcat-item">
          <p>Tên</p>
          <span>Nguyễn Văn A</span>
        </div>
        <div className="infoConcat-item">
          <p>Chức Vụ</p>
          <span></span>
        </div>
        <div className="infoConcat-item">
          <p>Doanh nghiệp</p>
          <span></span>
        </div>
        <div className="infoConcat-item">
          <p>Tài khoản quản lý</p>
          <span></span>
        </div>
        <div className="infoConcat-item">
          <p>Miêu tả thông tin</p>
          <span></span>
        </div>
        <div className="infoConcat-item">
          <p>Email</p>
          <span></span>
        </div>
        <div className="infoConcat-item">
          <p>Phone:</p>
          <span>0869394765</span>
        </div>
      </div>
      <div className="infoConcat-history">
        <div className="infoConcat-history-title">
          <img src={History} alt="history" />
          <p>LỊCH SỬ LIÊN HỆ</p>
        </div>
        {sessionHistory &&
          sessionHistory.slice(0, 4).map((item, index) => (
            <div className="infoConcat-history-item" key={index}>
              <img src={CallHistory} alt="callHistory" />
              <div className="infoConcat-history-info">
                <p>Cuộc gọi từ: {item.sipUri}</p>
                <div>
                  <span>Giao cho:</span>
                  <strong>Nguyễn Văn A</strong>
                </div>
                <div>
                  <span>Cập nhật:</span>
                  <strong>{formatDate(item.startTime)}</strong>
                </div>
              </div>
            </div>
          ))}
        {/* // <div className="infoConcat-history-item">
        //   <img src={CallHistory} alt="callHistory" />
        //   <div className="infoConcat-history-info">
        //     <p>Cuộc gọi từ: +84 59831346</p>
        //     <div>
        //       <span>Giao cho:</span>
        //       <strong>Nguyễn Văn A</strong>
        //     </div>
        //     <div>
        //       <span>Cập nhật:</span>
        //       <strong>27/07/2020 2:46:44 CH</strong>
        //     </div>
        //   </div>
        // </div>
        // <div className="infoConcat-history-item">
        //   <img src={CallHistory} alt="callHistory" />
        //   <div className="infoConcat-history-info">
        //     <p>Cuộc gọi từ: +84 59831346</p>
        //     <div>
        //       <span>Giao cho:</span>
        //       <strong>Nguyễn Văn B</strong>
        //     </div>
        //     <div>
        //       <span>Cập nhật:</span>
        //       <strong>27/07/2020 2:46:44 CH</strong>
        //     </div>
        //   </div>
        // </div> */}
      </div>
    </div>
  );
};
export default InfoConcat;
