// import { useDispatch } from "react-redux";
import Cell from "../../../asset/cell 2.png";
import "./menu.scss"
// import { setDeleteTab } from "../../../reducers/appReduce";
const MenuProfile = ({formId}) => {
  // const dispatch = useDispatch()
  // const deleteForm = () => {
  //   dispatch(setDeleteTab(formId))
  // }
  return (
    <div className="menuProfile">
      <img src={Cell} alt="cell" />
    </div>
  );
};
export default MenuProfile;
