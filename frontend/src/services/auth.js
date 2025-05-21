import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';
const WSO2_IS_URL = process.env.REACT_APP_WSO2_IS_URL || 'https://localhost:9443';
const WSO2_CLIENT_ID = process.env.REACT_APP_WSO2_CLIENT_ID;
const WSO2_REDIRECT_URI = process.env.REACT_APP_WSO2_REDIRECT_URI || 'http://localhost:3000/api/auth/callback';

// Cấu hình axios
axios.defaults.withCredentials = true;

const authService = {
    login: () => {
        // Chuyển hướng đến trang đăng nhập WSO2IS
        const authUrl = `${WSO2_IS_URL}/oauth2/authorize?` +
            `response_type=code&` +
            `client_id=${WSO2_CLIENT_ID}&` +
            `redirect_uri=${encodeURIComponent(WSO2_REDIRECT_URI)}&` +
            `scope=openid profile email&` +
            `state=${Math.random().toString(36).substring(7)}`;
        window.location.href = authUrl;
    },

    handleCallback: async (code) => {
        try {
            const response = await axios.post(`${API_URL}/auth/callback`, { code });
            return response.data;
        } catch (error) {
            console.error('Lỗi xử lý callback:', error);
            throw error;
        }
    },

    logout: async () => {
        try {
            await axios.post(`${API_URL}/auth/logout`);
            // Chuyển hướng đến trang logout của WSO2IS
            const logoutUrl = `${WSO2_IS_URL}/oidc/logout?` +
                `post_logout_redirect_uri=${encodeURIComponent(window.location.origin)}`;
            window.location.href = logoutUrl;
        } catch (error) {
            console.error('Lỗi đăng xuất:', error);
            throw error;
        }
    },

    getUser: async () => {
        try {
            const response = await axios.get(`${API_URL}/auth/user`);
            return response.data;
        } catch (error) {
            console.error('Lỗi lấy thông tin user:', error);
            throw error;
        }
    },

    isAuthenticated: async () => {
        try {
            await authService.getUser();
            return true;
        } catch (error) {
            return false;
        }
    }
};

export default authService; 