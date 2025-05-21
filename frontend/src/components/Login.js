import React, { useEffect, useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Button, Container, Typography, Box, CircularProgress, Alert } from '@mui/material';
import { styled } from '@mui/material/styles';
import authService from '../services/auth';

const StyledContainer = styled(Container)(({ theme }) => ({
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: '100vh',
    backgroundColor: theme.palette.background.default
}));

const LoginButton = styled(Button)(({ theme }) => ({
    marginTop: theme.spacing(3),
    padding: theme.spacing(1.5, 4),
    fontSize: '1.1rem',
    backgroundColor: '#FF5000', // Màu WSO2
    '&:hover': {
        backgroundColor: '#E64A00'
    }
}));

const Login = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        const checkAuth = async () => {
            try {
                setLoading(true);
                const isAuthenticated = await authService.isAuthenticated();
                if (isAuthenticated) {
                    navigate('/dashboard');
                }
            } catch (err) {
                setError('Lỗi kiểm tra xác thực');
            } finally {
                setLoading(false);
            }
        };

        // Kiểm tra nếu có code trong URL (callback từ WSO2IS)
        const params = new URLSearchParams(location.search);
        const code = params.get('code');
        const error = params.get('error');

        if (code) {
            handleCallback(code);
        } else if (error) {
            setError('Lỗi đăng nhập: ' + error);
        } else {
            checkAuth();
        }
    }, [navigate, location]);

    const handleCallback = async (code) => {
        try {
            setLoading(true);
            await authService.handleCallback(code);
            navigate('/dashboard');
        } catch (err) {
            setError('Lỗi xử lý đăng nhập');
        } finally {
            setLoading(false);
        }
    };

    const handleLogin = () => {
        authService.login();
    };

    if (loading) {
        return (
            <StyledContainer>
                <CircularProgress size={60} />
                <Typography variant="h6" style={{ marginTop: 20 }}>
                    Đang xử lý...
                </Typography>
            </StyledContainer>
        );
    }

    return (
        <StyledContainer maxWidth="sm">
            <Box textAlign="center">
                <Typography variant="h4" component="h1" gutterBottom>
                    Chào mừng đến với Telesystem
                </Typography>
                <Typography variant="body1" color="textSecondary" paragraph>
                    Đăng nhập để tiếp tục sử dụng hệ thống
                </Typography>
                {error && (
                    <Alert severity="error" sx={{ mb: 2 }}>
                        {error}
                    </Alert>
                )}
                <LoginButton
                    variant="contained"
                    onClick={handleLogin}
                    fullWidth
                    disabled={loading}
                >
                    Đăng nhập với WSO2
                </LoginButton>
            </Box>
        </StyledContainer>
    );
};

export default Login; 