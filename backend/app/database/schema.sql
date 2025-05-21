-- Tạo database nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS telesystem CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE telesystem;

-- Bảng roles (vai trò)
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bảng permissions (quyền)
CREATE TABLE IF NOT EXISTS permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    module VARCHAR(50) NOT NULL COMMENT 'Module/feature name',
    action VARCHAR(50) NOT NULL COMMENT 'Action: view, create, edit, delete',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_module_action (module, action)
);

-- Bảng role_permissions (phân quyền cho từng role)
CREATE TABLE IF NOT EXISTS role_permissions (
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);

-- Bảng credentials (lưu thông tin đăng nhập)
CREATE TABLE IF NOT EXISTS credentials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('sip', 'trunk', 'api') NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    host VARCHAR(100),
    port INT,
    context VARCHAR(50),
    caller_id VARCHAR(50),
    is_encrypted BOOLEAN DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_credential (type, username, host)
);

-- Bảng users (người dùng)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    wso2_user_id VARCHAR(100) NOT NULL UNIQUE COMMENT 'ID của user trong WSO2',
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    role_id INT NOT NULL COMMENT 'Reference to roles table',
    extension VARCHAR(20),
    employee_code VARCHAR(20),
    department VARCHAR(100),
    position VARCHAR(100),
    phone VARCHAR(20),
    credential_id INT COMMENT 'Reference to credentials table for SIP account',
    status ENUM('active', 'inactive', 'locked') NOT NULL DEFAULT 'active',
    last_login DATETIME,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id),
    FOREIGN KEY (credential_id) REFERENCES credentials(id) ON DELETE SET NULL
);

-- Bảng user_permissions (quyền riêng của từng user)
CREATE TABLE IF NOT EXISTS user_permissions (
    user_id INT NOT NULL,
    permission_id INT NOT NULL,
    granted_by INT NOT NULL COMMENT 'User ID của người cấp quyền',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE,
    FOREIGN KEY (granted_by) REFERENCES users(id)
);

-- Bảng menu_items (menu items)
CREATE TABLE IF NOT EXISTS menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    path VARCHAR(255) NOT NULL,
    icon VARCHAR(50),
    parent_id INT,
    order_index INT DEFAULT 0,
    required_permission_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES menu_items(id) ON DELETE SET NULL,
    FOREIGN KEY (required_permission_id) REFERENCES permissions(id) ON DELETE SET NULL
);

-- Bảng trunks (cấu hình trunk)
CREATE TABLE IF NOT EXISTS trunks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credential_id INT NOT NULL COMMENT 'Reference to credentials table',
    type ENUM('sip', 'iax2') NOT NULL,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    max_channels INT DEFAULT 0,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (credential_id) REFERENCES credentials(id) ON DELETE CASCADE
);

-- Bảng services (cấu hình dịch vụ)
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('ivr', 'queue', 'conference', 'voicemail') NOT NULL,
    config JSON NOT NULL,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bảng queues (cấu hình queue)
CREATE TABLE IF NOT EXISTS queues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    strategy ENUM('ringall', 'leastrecent', 'fewestcalls', 'random', 'rrmemory', 'linear', 'wrandom') NOT NULL DEFAULT 'ringall',
    timeout INT DEFAULT 0,
    retry INT DEFAULT 0,
    wrapuptime INT DEFAULT 0,
    maxlen INT DEFAULT 0,
    service_id INT,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL
);

-- Bảng queue_members (thành viên trong queue)
CREATE TABLE IF NOT EXISTS queue_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    queue_id INT NOT NULL,
    user_id INT NOT NULL,
    member_name VARCHAR(100) NOT NULL,
    interface VARCHAR(100) NOT NULL,
    penalty INT DEFAULT 0,
    paused BOOLEAN DEFAULT FALSE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (queue_id) REFERENCES queues(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Bảng cdr (Call Detail Records)
CREATE TABLE IF NOT EXISTS cdr (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    call_id VARCHAR(100) NOT NULL UNIQUE,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    call_type ENUM('inbound', 'outbound', 'internal') NOT NULL,
    call_status ENUM('answered', 'busy', 'failed', 'no-answer', 'cancel') NOT NULL,
    start_time DATETIME NOT NULL,
    answer_time DATETIME,
    end_time DATETIME,
    duration INT DEFAULT 0,
    billsec INT DEFAULT 0,
    recording_file VARCHAR(255),
    user_id INT,
    queue_id INT,
    trunk_id INT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (queue_id) REFERENCES queues(id) ON DELETE SET NULL,
    FOREIGN KEY (trunk_id) REFERENCES trunks(id) ON DELETE SET NULL,
    INDEX idx_start_time (start_time),
    INDEX idx_source (source),
    INDEX idx_destination (destination),
    INDEX idx_call_type (call_type),
    INDEX idx_call_status (call_status)
);

-- Bảng billing (hóa đơn)
CREATE TABLE IF NOT EXISTS billing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    user_id INT NOT NULL,
    trunk_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_calls INT DEFAULT 0,
    total_duration INT DEFAULT 0,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('pending', 'paid', 'cancelled') NOT NULL DEFAULT 'pending',
    payment_date DATETIME,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (trunk_id) REFERENCES trunks(id) ON DELETE CASCADE
);

-- Bảng billing_details (chi tiết hóa đơn)
CREATE TABLE IF NOT EXISTS billing_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    billing_id INT NOT NULL,
    cdr_id BIGINT NOT NULL,
    duration INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (billing_id) REFERENCES billing(id) ON DELETE CASCADE,
    FOREIGN KEY (cdr_id) REFERENCES cdr(id) ON DELETE CASCADE
);

-- Bảng queue_stats (thống kê queue)
CREATE TABLE IF NOT EXISTS queue_stats (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    queue_id INT NOT NULL,
    date DATE NOT NULL,
    total_calls INT DEFAULT 0,
    answered_calls INT DEFAULT 0,
    abandoned_calls INT DEFAULT 0,
    avg_wait_time INT DEFAULT 0,
    avg_talk_time INT DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (queue_id) REFERENCES queues(id) ON DELETE CASCADE,
    UNIQUE KEY unique_queue_date (queue_id, date)
);

-- Bảng service_stats (thống kê dịch vụ)
CREATE TABLE IF NOT EXISTS service_stats (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    service_id INT NOT NULL,
    date DATE NOT NULL,
    total_calls INT DEFAULT 0,
    successful_calls INT DEFAULT 0,
    failed_calls INT DEFAULT 0,
    avg_duration INT DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
    UNIQUE KEY unique_service_date (service_id, date)
);

-- Insert default roles
INSERT INTO roles (name, description) VALUES
('admin', 'Administrator - Full system access'),
('manager', 'Manager - Access to management features and reports'),
('user', 'Regular user - Basic access to assigned features')
ON DUPLICATE KEY UPDATE description = VALUES(description);

-- Insert default permissions
INSERT INTO permissions (name, description, module, action) VALUES
-- User Management
('user.view', 'View user list', 'users', 'view'),
('user.create', 'Create new user', 'users', 'create'),
('user.edit', 'Edit user information', 'users', 'edit'),
('user.delete', 'Delete user', 'users', 'delete'),
-- Trunk Management
('trunk.view', 'View trunk list', 'trunks', 'view'),
('trunk.create', 'Create new trunk', 'trunks', 'create'),
('trunk.edit', 'Edit trunk configuration', 'trunks', 'edit'),
('trunk.delete', 'Delete trunk', 'trunks', 'delete'),
-- Queue Management
('queue.view', 'View queue list', 'queues', 'view'),
('queue.create', 'Create new queue', 'queues', 'create'),
('queue.edit', 'Edit queue configuration', 'queues', 'edit'),
('queue.delete', 'Delete queue', 'queues', 'delete'),
-- CDR Reports
('cdr.view', 'View CDR reports', 'reports', 'view'),
('cdr.export', 'Export CDR data', 'reports', 'export'),
-- Billing Reports
('billing.view', 'View billing reports', 'reports', 'view'),
('billing.export', 'Export billing data', 'reports', 'export'),
-- Queue Reports
('queue.report.view', 'View queue reports', 'reports', 'view'),
('queue.report.export', 'Export queue statistics', 'reports', 'export'),
-- Service Reports
('service.report.view', 'View service reports', 'reports', 'view'),
('service.report.export', 'Export service statistics', 'reports', 'export')
ON DUPLICATE KEY UPDATE description = VALUES(description);

-- Assign permissions to roles
INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.name = 'admin'
ON DUPLICATE KEY UPDATE role_id = VALUES(role_id);

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.name = 'manager' 
AND p.name IN (
    'user.view', 'trunk.view', 'queue.view',
    'cdr.view', 'cdr.export',
    'billing.view', 'billing.export',
    'queue.report.view', 'queue.report.export',
    'service.report.view', 'service.report.export'
)
ON DUPLICATE KEY UPDATE role_id = VALUES(role_id);

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.name = 'user'
AND p.name IN (
    'cdr.view',
    'queue.report.view',
    'service.report.view'
)
ON DUPLICATE KEY UPDATE role_id = VALUES(role_id);

-- Insert default menu items
INSERT INTO menu_items (name, path, icon, parent_id, order_index, required_permission_id) VALUES
-- Admin Menu
('Quản trị', '/admin', 'admin', NULL, 1, (SELECT id FROM permissions WHERE name = 'user.view')),
('Quản lý người dùng', '/admin/users', 'user', 1, 1, (SELECT id FROM permissions WHERE name = 'user.view')),
('Quản lý trunk', '/admin/trunks', 'trunk', 1, 2, (SELECT id FROM permissions WHERE name = 'trunk.view')),
('Quản lý queue', '/admin/queues', 'queue', 1, 3, (SELECT id FROM permissions WHERE name = 'queue.view')),
-- Báo cáo Menu
('Báo cáo', '/reports', 'report', NULL, 2, (SELECT id FROM permissions WHERE name = 'cdr.view')),
('CDR Logs', '/reports/cdr', 'cdr', 5, 1, (SELECT id FROM permissions WHERE name = 'cdr.view')),
('Billing Report', '/reports/billing', 'billing', 5, 2, (SELECT id FROM permissions WHERE name = 'billing.view')),
('Queue Report', '/reports/queue', 'queue-report', 5, 3, (SELECT id FROM permissions WHERE name = 'queue.report.view')),
('Service Reports', '/reports/service', 'service-report', 5, 4, (SELECT id FROM permissions WHERE name = 'service.report.view'))
ON DUPLICATE KEY UPDATE 
    icon = VALUES(icon),
    required_permission_id = VALUES(required_permission_id);

-- Tạo user admin mặc định
INSERT INTO users (wso2_user_id, username, email, full_name, role_id, status)
SELECT 
    'admin@telesystem.com',
    'admin',
    'admin@telesystem.com',
    'System Administrator',
    r.id,
    'active'
FROM roles r
WHERE r.name = 'admin'
ON DUPLICATE KEY UPDATE 
    role_id = VALUES(role_id),
    status = VALUES(status); 