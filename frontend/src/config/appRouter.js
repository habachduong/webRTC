import { Route, Routes, Navigate, useLocation } from "react-router-dom";
import { useSelector } from "react-redux";
import Home from "../pages/home/index";
import Profile from "../pages/profile";
import Setting from "../pages/Setting";
import Login from "../pages/login";
import Register from "../pages/Register";
import ForgotPass from "../pages/forgotPass";

// Admin pages
import AdminTrunk from "../pages/admin/trunk";
import AdminService from "../pages/admin/service";
import AdminSip from "../pages/admin/sip";
import AdminQueue from "../pages/admin/queue";

// Report pages
import CdrReport from "../pages/reports/cdr";
import BillingReport from "../pages/reports/billing";
import QueueReport from "../pages/reports/queue";
import ServiceReport from "../pages/reports/service";

// Protected Route component
const ProtectedRoute = ({ children }) => {
  // Bỏ check đăng nhập, luôn cho phép truy cập
  return children;
};

const AuthRedirect = ({ children }) => {
  // Bỏ check đăng nhập, luôn cho phép truy cập
  return children;
};

const AppRouters = () => {
  return (
    <AuthRedirect>
      <Routes>
        <Route path="" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/forgotPass" element={<ForgotPass />} />
        
        {/* Protected Routes */}
        <Route path="/form" element={
          <ProtectedRoute>
            <Profile />
          </ProtectedRoute>
        } />
        
        <Route path="/setting" element={
          <ProtectedRoute>
            <Setting />
          </ProtectedRoute>
        } />
        
        <Route path="/dashboard" element={
          <ProtectedRoute>
            <Home />
          </ProtectedRoute>
        } />

        {/* Report Routes */}
        <Route path="/reports/cdr" element={
          <ProtectedRoute>
            <CdrReport />
          </ProtectedRoute>
        } />
        
        <Route path="/reports/billing" element={
          <ProtectedRoute>
            <BillingReport />
          </ProtectedRoute>
        } />
        
        <Route path="/reports/queue" element={
          <ProtectedRoute>
            <QueueReport />
          </ProtectedRoute>
        } />
        
        <Route path="/reports/service" element={
          <ProtectedRoute>
            <ServiceReport />
          </ProtectedRoute>
        } />

        {/* Admin Routes */}
        <Route path="/admin/trunk" element={
          <ProtectedRoute>
            <AdminTrunk />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/service" element={
          <ProtectedRoute>
            <AdminService />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/sip" element={
          <ProtectedRoute>
            <AdminSip />
          </ProtectedRoute>
        } />
        
        <Route path="/admin/queue" element={
          <ProtectedRoute>
            <AdminQueue />
          </ProtectedRoute>
        } />
      </Routes>
    </AuthRedirect>
  );
};

export default AppRouters;
