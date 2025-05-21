import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  time: null,
  menuActive: "Home"
};

const Dashboard = createSlice({
  name: "app",
  initialState,
  reducers: {
    setTime: (states, action) => {
      states.time = action.payload;
    },
    setMenuActive: (states, action) => {
      states.menuActive = action.payload;
    },
  },
});

export const {
  setTime,
  setMenuActive
} = Dashboard.actions;
export default Dashboard.reducer;
