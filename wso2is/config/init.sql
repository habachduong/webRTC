-- Tạo user cho WSO2IS
CREATE USER IF NOT EXISTS 'wso2is'@'%' IDENTIFIED BY 'wso2is123';
GRANT ALL PRIVILEGES ON *.* TO 'wso2is'@'%';

-- Tạo các database cho WSO2IS
CREATE DATABASE IF NOT EXISTS wso2is_db;
CREATE DATABASE IF NOT EXISTS wso2is_user_db;
CREATE DATABASE IF NOT EXISTS wso2is_identity_db;
CREATE DATABASE IF NOT EXISTS wso2is_consent_db;

-- Cấp quyền cho user wso2is
GRANT ALL PRIVILEGES ON wso2is_db.* TO 'wso2is'@'%';
GRANT ALL PRIVILEGES ON wso2is_user_db.* TO 'wso2is'@'%';
GRANT ALL PRIVILEGES ON wso2is_identity_db.* TO 'wso2is'@'%';
GRANT ALL PRIVILEGES ON wso2is_consent_db.* TO 'wso2is'@'%';

FLUSH PRIVILEGES; 