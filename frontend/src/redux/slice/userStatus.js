import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  registerInProgress: false,
};

const userStatus = createSlice({
  name: "userStatus",
  initialState,
  reducers: {
    setRegisterInPProgress: (states, action) => {
      states.registerInProgress = action.payload;
    },
  },
});

export const { setRegisterInPProgress } = userStatus.actions;
export default userStatus.reducer;
