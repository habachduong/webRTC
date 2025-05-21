import { useEffect, useState } from "react";
import Information from "./components/infomation";
import "./style.scss";
import Automatic from "./components/automatic";
import Sidebar from "../../components/sidebar/sidebar";
import Header from "../../components/header/header";
import { useDispatch } from "react-redux";
import { setCleanTab } from "../../reducers/appReduce";
const Setting = () => {
  const [tab, setTab] = useState("1");
  const dispatch = useDispatch();
  useEffect(()=>{
    dispatch(setCleanTab([]))
    // eslint-disable-next-line react-hooks/exhaustive-deps
  },[])
  return (
    <div className="Setting">
      <Sidebar />
      <div className="Setting-body">
        <Header />
        <div className="Setting-menu">
          <div
            className={`Setting-item ${tab === "1" ? "Setting-active" : ""}`}
            onClick={() => setTab("1")}
          >
            {" "}
            Thông tin người dùng
          </div>
          <div
            className={`Setting-item ${tab === "2" ? "Setting-active" : ""}`}
            onClick={() => setTab("2")}
          >
            {" "}
            Tự động hóa
          </div>
        </div>
        <div className="Setting-content">
          {tab === "1" ? <Information /> : <Automatic />}
        </div>
      </div>
    </div>
  );
};
export default Setting;
