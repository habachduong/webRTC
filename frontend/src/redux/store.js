import { combineReducers, configureStore } from "@reduxjs/toolkit";
import thunk from "redux-thunk";
import appReduce from "./slice/appReduce";
import user from "./slice/user";
import userStatus from "./slice/userStatus";

const rootReducer = combineReducers({
  appReduce,
  user,
  userStatus,
});

const store = configureStore({
  reducer: rootReducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({ serializableCheck: false }).concat(thunk),
});

export default store;
