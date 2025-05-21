import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  editProfile: false,
  changePass: false,
  openModal: false,
  collapse: true,
  answered:false,
  tab:"1",
  call:false,
};

const appReducer = createSlice({
  name: "app",
  initialState,
  reducers: {
    setEditProfile: (states, action) => {
      states.editProfile = action.payload;
    },
    setChangePass: (states, action) => {
      states.changePass = action.payload;
    },
    setOpenModal: (states, action) => {
      states.openModal = action.payload;
    },
    setCollapse: (states, action) => {
      states.collapse = action.payload;
    },
    setAnswered: (states, action) => {
      states.answered = action.payload;
    },
    setTab: (states, action) => {
      states.tab = action.payload;
    },
    setCall: (states, action) => {
      states.call = action.payload;
    },
  },
});

export const { setEditProfile, setChangePass,setOpenModal,setCollapse,setAnswered,setTab,setCall } = appReducer.actions;
export default appReducer.reducer;
