import Avatar from "../../../asset/image-60.png";
import "./Infocaller.scss"
const InfoCaller = () => {
  return (
    <div className="infoCaller">
      <img src={Avatar} alt="avatar" />
      <div className="infoCaller-info">
        <div className="infoCaller-phone">Cuộc gọi từ: +84941673123</div>
        <div className="infoCaller-lh">
          <p>Liên hệ 8491573414</p>
          <span>27/07/2020 2:46:44 CH</span>
        </div>
      </div>
    </div>
  );
};

export default InfoCaller;
