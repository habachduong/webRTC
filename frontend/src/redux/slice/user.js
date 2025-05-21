import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  autoRegister: false,
  displayName:null, 
  sipUri:null, 
  password:null, 
  outboundProxy:null
};

const user = createSlice({
  name: "user",
  initialState,
  reducers: {
    setAutoRegister: (states, action) => {
      states.autoRegister = action.payload;
    },
  },
});

export const { setAutoRegister } = user.actions;
export default user.reducer;
