import { useSelector } from "react-redux";
import Contract from "./components/Contract";
import Form1 from "./components/Form1";
import Form2 from "./components/Form2";

import InfoConcat from "./components/Infoconcat";
import MenuProfile from "./components/menu";

import { useEffect, useState } from "react";
import Header from "../../components/header/header";
import Sidebar from "../../components/sidebar/sidebar";
import "./index.scss"

const Profile = () => {
  const { tabs, formId } = useSelector((states) => states.appReduce);
  const [form, setForm] = useState(null);
  useEffect(() => {
    setForm(tabs.find((item) => item.id === formId).form);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [formId]);

  return (
    <div className="Profile">
      <Sidebar/>
      <div className="Profile-body">
        <Header/>
        <MenuProfile/>
        <div className="Profile-content" style={{ display: "flex" }}>
          <Contract />
          {form === "1" && <Form1 />}
          {form === "2" && <Form2 />}
          <InfoConcat />
        </div>
      </div>
    </div>
  );
};
export default Profile;
