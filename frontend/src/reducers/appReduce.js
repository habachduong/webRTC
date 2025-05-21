import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  editProfile: false,
  changePass: false,
  openModal: false,
  collapse: true,
  answered: false,
  tabs: [],
  call: false,
  formId: null,
  autoReceived: false,
  remember: false
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
      states.tabs = states.tabs.concat(action.payload);
    },
    setDeleteTab: (states, action) => {
      states.tabs = states.tabs.filter((item) => item.id !== action.payload);
    },
    setCleanTab: (states, action) => {
      states.tabs = action.payload;
    },
    setCall: (states, action) => {
      states.call = action.payload;
    },
    setFormId: (states, action) => {
      states.formId = action.payload;
    },
    setAutoReceived: (states, action) => {
      states.autoReceived = action.payload;
    },
    setRemember: (states, action) => {
      states.remember = action.payload;
    }
  },
});

export const {
  setEditProfile,
  setChangePass,
  setOpenModal,
  setCollapse,
  setAnswered,
  setTab,
  setCall,
  setDeleteTab,
  setFormId,
  setAutoReceived,
  setCleanTab,
  setRemember
} = appReducer.actions;
export default appReducer.reducer;
