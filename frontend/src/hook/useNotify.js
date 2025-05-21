import { toast } from "react-toastify";
const DEFAULT_TIME_AUTO_HIDE_TOASTIFY = 3000

const useNotify = () => {
  const error = (message, position = "top-right", autoClose, icon) => {
    toast.error(message, {
      position: position,
      autoClose: autoClose || DEFAULT_TIME_AUTO_HIDE_TOASTIFY,
      hideProgressBar: true,
      theme: "colored",
      closeButton: false,
    });
  };

  const success = (message, position = "top-right", autoClose) => {
    toast.success(message, {
      position: position,
      autoClose: autoClose || DEFAULT_TIME_AUTO_HIDE_TOASTIFY,
      hideProgressBar: true,
      theme: "colored",
      closeButton: false,
    });
  };

  const warning = (message, position = "top-right", autoClose) => {
    toast.warning(message, {
      position: position,
      autoClose: autoClose || DEFAULT_TIME_AUTO_HIDE_TOASTIFY,
      hideProgressBar: true,
      theme: "colored",
      closeButton: false,
    });
  };

  return { error, success, warning };
};

export default useNotify;
