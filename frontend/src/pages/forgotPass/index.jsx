import InputForm from "../../components/modalForm/component/inputPass";
import Btn from "../../components/modalForm/component/btn";
import ModalForm from "../../components/modalForm";
import { useState } from "react";

const ForgotPass = () => {
  const [email,setEmail] = useState("")
  const handleEmail = (value)=>{
    setEmail(value)
  }
  return (
    <ModalForm
      data={{
        value: email,
        title: "Đặt lại mật khẩu",
        sub: "Vui lòng nhập thông tin để truy cập hệ thống",
      }}
    >
      <InputForm
        data={{
          check: "forgotPass",
          title: "Email",
          placeholder: "user1@techcombank.com.vn",
          type: "text",
          handleEmail
        }}
      />

      <Btn title={"Gửi lại mật khẩu"} />
    </ModalForm>
  );
};
export default ForgotPass;
