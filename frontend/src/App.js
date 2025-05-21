import "./app.scss";
import Modal from "./components/modal/modal";
import EditProfile from "./components/editProfile";
import ModalSuccess from "./components/modalSuccess";
import ModalWaring from "./components/modalWaring";
import ChangePass from "./components/modalChangePass";
import AppRouters from "./config/appRouter";
import ModalAnswered from "./components/modalAnswered";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import ModalNumber from "./components/modalNumber";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import SipCallerContext from "./sipCallerContext";
import { store } from "./store";
import SipCaller from "./sipCaller";
import { useNavigate } from "react-router-dom";
import { v4 as uuidv4 } from "uuid";
import { setFormId, setTab } from "./reducers/appReduce";

function App() {
  const { autoRegister } = useSelector((states) => states.user);
  const { autoReceived } = useSelector((states) => states.appReduce);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  let sipCaller;
  const Answer = () => {
    const generateRandomId = () => {
      return uuidv4();
    };
    const random = () => {
      const randomFraction = Math.random();

      const randomChar = randomFraction < 0.5 ? "1" : "2";

      return randomChar;
    };
    const id = generateRandomId();
    const data = {
      id: id,
      phone: "0869394765",
      form: random(),
    };
    dispatch(setFormId(id));
    dispatch(setTab(data));
    navigate("/form", { replace: true });
  };
  SipCaller.init({ store, Answer });
  sipCaller = new SipCaller();
  global.sipCaller = sipCaller;

  if (autoRegister) {
    sipCaller.register();
  }
  useEffect(() => {
    if (autoRegister) {
      sipCaller.register();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [autoReceived]);

  return (
    <div className="App">
      <SipCallerContext.Provider value={sipCaller}>
        <ToastContainer className="foo" />
        <div className="App-content">
          <div className="App-right" style={{ position: "relative" }}>
            <AppRouters />
            <Modal />
            <EditProfile />
            <ModalSuccess />
            <ModalWaring />
            <ChangePass />
            <ModalAnswered />
            <ModalNumber />
          </div>
        </div>
      </SipCallerContext.Provider>
    </div>
  );
}

export default App;
