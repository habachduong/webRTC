import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate, useLocation } from 'react-router-dom';
import { setMenuActive } from '../../reducers/dashboard';
import { setCollapse } from '../../reducers/appReduce';
import './sidebar.scss';

// SVG Icons
import { ReactComponent as DashboardIcon } from '../../asset/svg/dashboard.svg';
import { ReactComponent as ProfileIcon } from '../../asset/svg/profile.svg';
import { ReactComponent as SettingIcon } from '../../asset/svg/setting.svg';
import { ReactComponent as AdminIcon } from '../../asset/svg/admin.svg';
import { ReactComponent as TrunkIcon } from '../../asset/svg/trunk.svg';
import { ReactComponent as ServiceIcon } from '../../asset/svg/service.svg';
import { ReactComponent as SipIcon } from '../../asset/svg/sip.svg';
import { ReactComponent as QueueIcon } from '../../asset/svg/queue.svg';
import { ReactComponent as ReportIcon } from '../../asset/svg/report.svg';
import { ReactComponent as CdrIcon } from '../../asset/svg/cdr.svg';
import { ReactComponent as BillingIcon } from '../../asset/svg/billing.svg';
import { ReactComponent as QueueReportIcon } from '../../asset/svg/queue-report.svg';
import { ReactComponent as ServiceReportIcon } from '../../asset/svg/service-report.svg';
import { ReactComponent as ArrowDown } from '../../asset/svg/arrow-down.svg';
import logo from '../../asset/logo.png';

const Sidebar = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { pathname } = useLocation();
  const { menuActive } = useSelector((state) => state.dashboard);
  const { collapse } = useSelector((state) => state.appReduce);
  const { user } = useSelector((state) => state.user);
  const [adminMenuOpen, setAdminMenuOpen] = useState(false);
  const [reportMenuOpen, setReportMenuOpen] = useState(false);
  const [activeKey, setActiveKey] = useState('');

  const isAdmin = user?.role === 'admin';

  // Theo dõi thay đổi của pathname để cập nhật activeKey
  useEffect(() => {
    // Xác định menu item nào đang active dựa trên pathname
    if (pathname === '/dashboard') {
      setActiveKey('dashboard');
    } else if (pathname === '/form') {
      setActiveKey('profile');
    } else if (pathname === '/setting') {
      setActiveKey('setting');
    } else if (pathname.startsWith('/admin/trunk')) {
      setActiveKey('trunk');
      setAdminMenuOpen(true);
    } else if (pathname.startsWith('/admin/service')) {
      setActiveKey('service');
      setAdminMenuOpen(true);
    } else if (pathname.startsWith('/admin/sip')) {
      setActiveKey('sip');
      setAdminMenuOpen(true);
    } else if (pathname.startsWith('/admin/queue')) {
      setActiveKey('queue');
      setAdminMenuOpen(true);
    } else if (pathname.startsWith('/reports/cdr')) {
      setActiveKey('cdr-logs');
      setReportMenuOpen(true);
    } else if (pathname.startsWith('/reports/billing')) {
      setActiveKey('billing');
      setReportMenuOpen(true);
    } else if (pathname.startsWith('/reports/queue')) {
      setActiveKey('queue-report');
      setReportMenuOpen(true);
    } else if (pathname.startsWith('/reports/service')) {
      setActiveKey('service-report');
      setReportMenuOpen(true);
    }
    
    // Cập nhật menuActive trong Redux để đồng bộ
    dispatch(setMenuActive(activeKey));
  }, [pathname, dispatch]);

  const menuItems = [
    {
      key: 'dashboard',
      label: 'Dashboard',
      icon: DashboardIcon,
      path: '/dashboard'
    },
    {
      key: 'profile',
      label: 'Profile',
      icon: ProfileIcon,
      path: '/form'
    },
    {
      key: 'setting',
      label: 'Cài đặt',
      icon: SettingIcon,
      path: '/setting'
    }
  ];

  const adminMenuItems = [
    {
      key: 'trunk',
      label: 'Cấu hình Trunk',
      icon: TrunkIcon,
      path: '/admin/trunk'
    },
    {
      key: 'service',
      label: 'Cấu hình dịch vụ',
      icon: ServiceIcon,
      path: '/admin/service'
    },
    {
      key: 'sip',
      label: 'Cấu hình SIP',
      icon: SipIcon,
      path: '/admin/sip'
    },
    {
      key: 'queue',
      label: 'Cấu hình Queue',
      icon: QueueIcon,
      path: '/admin/queue'
    }
  ];

  const reportMenuItems = [
    {
      key: 'cdr-logs',
      label: 'CDR Logs',
      icon: CdrIcon,
      path: '/reports/cdr'
    },
    {
      key: 'billing',
      label: 'Billing Report',
      icon: BillingIcon,
      path: '/reports/billing'
    },
    {
      key: 'queue-report',
      label: 'Queue Report',
      icon: QueueReportIcon,
      path: '/reports/queue'
    },
    {
      key: 'service-report',
      label: 'Service Reports',
      icon: ServiceReportIcon,
      path: '/reports/service'
    }
  ];

  const handleMenuClick = (key, path) => {
    setActiveKey(key);
    dispatch(setMenuActive(key));
    navigate(path);
  };

  const toggleAdminMenu = () => {
    setAdminMenuOpen(!adminMenuOpen);
  };

  const toggleReportMenu = () => {
    setReportMenuOpen(!reportMenuOpen);
  };

  const toggleCollapse = () => {
    dispatch(setCollapse(!collapse));
  };

  const renderSubMenu = (items, isOpen, menuKey) => {
    if (!collapse && isOpen) {
      return (
        <div className="submenu">
          {items.map((item) => (
            <div
              key={item.key}
              className={`submenu-item ${activeKey === item.key ? 'active mm-active' : ''}`}
              onClick={() => handleMenuClick(item.key, item.path)}
            >
              <item.icon className="icon" />
              <span>{item.label}</span>
            </div>
          ))}
        </div>
      );
    }
    return null;
  };

  return (
    <div className={`sidebar ${collapse ? 'collapsed' : ''}`}>
      <div className="sidebar-header">
        <img src={logo} alt="Logo" className="logo" />
        {!collapse && <span className="title">TeleSystem</span>}
      </div>

      <div className="sidebar-menu">
        {menuItems.map((item) => (
          <div
            key={item.key}
            className={`menu-item ${activeKey === item.key ? 'active mm-active' : ''}`}
            onClick={() => handleMenuClick(item.key, item.path)}
          >
            <item.icon className="icon" />
            {!collapse && <span>{item.label}</span>}
          </div>
        ))}

        {/* Report Menu */}
        <div className="menu-group">
          <div 
            className={`menu-item group-header ${reportMenuOpen ? 'open' : ''} ${
              ['cdr-logs', 'billing', 'queue-report', 'service-report'].includes(activeKey) ? 'mm-active' : ''
            }`}
            onClick={toggleReportMenu}
          >
            <ReportIcon className="icon" />
            {!collapse && (
              <>
                <span>Báo cáo</span>
                <ArrowDown 
                  className={`arrow ${reportMenuOpen ? 'rotate' : ''}`}
                />
              </>
            )}
          </div>
          {renderSubMenu(reportMenuItems, reportMenuOpen, 'report')}
        </div>

        {/* Admin Menu */}
        {isAdmin && (
          <div className="menu-group">
            <div 
              className={`menu-item group-header ${adminMenuOpen ? 'open' : ''} ${
                ['trunk', 'service', 'sip', 'queue'].includes(activeKey) ? 'mm-active' : ''
              }`}
              onClick={toggleAdminMenu}
            >
              <AdminIcon className="icon" />
              {!collapse && (
                <>
                  <span>Admin</span>
                  <ArrowDown 
                    className={`arrow ${adminMenuOpen ? 'rotate' : ''}`}
                  />
                </>
              )}
            </div>
            {renderSubMenu(adminMenuItems, adminMenuOpen, 'admin')}
          </div>
        )}
      </div>

      <div className="sidebar-footer">
        <button className="collapse-btn" onClick={toggleCollapse}>
          {collapse ? '>' : '<'}
        </button>
      </div>
    </div>
  );
};

export default Sidebar;