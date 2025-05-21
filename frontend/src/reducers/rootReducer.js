import { combineReducers } from 'redux';
import user from './user';
import sessions from './sessions';
import sessionHistory from './sessionHistory';
import userStatus from './userStatus';
import notifications from './notifications';
import appReduce from './appReduce';
import dashboard from './dashboard';

export default combineReducers({
	user,
	sessions,
	sessionHistory,
	userStatus,
	notifications,
	appReduce,
	dashboard,
});