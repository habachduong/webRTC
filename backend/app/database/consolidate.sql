-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2025 at 06:56 AM
-- Server version: 8.0.21
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asterisk`
--

-- --------------------------------------------------------

--
-- Table structure for table `1113_log_email`
--

CREATE TABLE `1113_log_email` (
  `ma` int NOT NULL,
  `email_address` varchar(30) NOT NULL,
  `header` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `4321_monitor`
--

CREATE TABLE `4321_monitor` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `queue_name` varchar(50) NOT NULL,
  `membername` varchar(200) NOT NULL,
  `interface` varchar(100) NOT NULL,
  `penalty` int NOT NULL,
  `incoming_calls` int NOT NULL,
  `total_in_time` int NOT NULL,
  `AVG_in_time` int NOT NULL,
  `out_calls` int NOT NULL,
  `out_times` int NOT NULL,
  `AVG_out` int NOT NULL,
  `direct_miss_calls` int NOT NULL,
  `queue_miss_calls` int NOT NULL,
  `forwarded_calls` int NOT NULL,
  `callout_calls` int NOT NULL,
  `callout_ans` int NOT NULL,
  `callout_times` int NOT NULL,
  `last_login_queue` datetime NOT NULL,
  `status` int NOT NULL,
  `paused` int NOT NULL,
  `time_on_queue` int NOT NULL,
  `lastupdate_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `ma` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `service_id` int NOT NULL,
  `number` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `agents`
--
DELIMITER $$
CREATE TRIGGER `agent_after_update` AFTER UPDATE ON `agents` FOR EACH ROW BEGIN 
UPDATE queue_member_table SET interface = concat('Local/',NEW.number,'@default'), membername =NEW.name WHERE interface=concat('Local/',OLD.number,'@default');

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_campaign`
--

CREATE TABLE `agent_campaign` (
  `id` int NOT NULL,
  `campaign_id` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `agent_name` varchar(200) NOT NULL,
  `total_contact_assiged` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_daily_report`
--

CREATE TABLE `agent_daily_report` (
  `id` bigint NOT NULL,
  `date` date NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `queue_id` int NOT NULL,
  `queue_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incoming_calls` int NOT NULL,
  `total_in_time` int NOT NULL,
  `AVG_in_time` int NOT NULL,
  `out_calls` int NOT NULL,
  `out_times` int NOT NULL,
  `AVG_out` int NOT NULL,
  `direct_miss_calls` int NOT NULL,
  `queue_miss_calls` int NOT NULL,
  `forwarded_calls` int NOT NULL,
  `callout_calls` int NOT NULL,
  `callout_ans` int NOT NULL,
  `callout_times` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_group`
--

CREATE TABLE `agent_group` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `order` tinyint NOT NULL,
  `leader` varchar(200) NOT NULL,
  `can_assign` tinyint NOT NULL,
  `total_call` int NOT NULL,
  `total_answered` int NOT NULL,
  `total_time_talk` int NOT NULL,
  `total_time_wait` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_performance_daily`
--

CREATE TABLE `agent_performance_daily` (
  `id` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_number` int NOT NULL,
  `agent_name` varchar(30) NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `total_call` int NOT NULL,
  `total_answered` int NOT NULL,
  `total_time_talk` int NOT NULL,
  `total_time_wait` int NOT NULL,
  `avg_time` int NOT NULL,
  `service_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_call_by_sys` int NOT NULL,
  `total_answered_by_sys` int NOT NULL,
  `total_time_talk_by_sys` int NOT NULL,
  `total_time_wait_by_sys` int NOT NULL,
  `avg_time_by_sys` int NOT NULL,
  `appointment` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_performance_daily_backup`
--

CREATE TABLE `agent_performance_daily_backup` (
  `id` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_number` int NOT NULL,
  `agent_name` varchar(30) NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `total_call` int NOT NULL,
  `total_answered` int NOT NULL,
  `total_time_talk` int NOT NULL,
  `total_time_wait` int NOT NULL,
  `avg_time` int NOT NULL,
  `service_id` int NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agent_status`
--

CREATE TABLE `agent_status` (
  `agentId` varchar(40) NOT NULL DEFAULT '',
  `agentName` varchar(40) DEFAULT NULL,
  `agentStatus` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `callid` double(18,6) UNSIGNED DEFAULT '0.000000',
  `queue` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `amc_cdr_temp`
--

CREATE TABLE `amc_cdr_temp` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL,
  `realdst` varchar(80) NOT NULL,
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `uniqueid2` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `userfield2` varchar(30) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `queue_event` text NOT NULL,
  `case_id` tinyint NOT NULL,
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `API_Auto_dialer_Queues`
--

CREATE TABLE `API_Auto_dialer_Queues` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `precall_ratio` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '\r\n',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'start',
  `active_calls` int NOT NULL,
  `customers_count` int NOT NULL,
  `agents_count` int NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `API_Auto_dialer_Queue_Agent`
--

CREATE TABLE `API_Auto_dialer_Queue_Agent` (
  `id` int NOT NULL,
  `agent_number` int NOT NULL,
  `agent_flex_status` varchar(80) NOT NULL,
  `agent_total_calls` int NOT NULL,
  `pbx_status` varchar(80) NOT NULL,
  `lastcall` datetime NOT NULL,
  `queue_code` varchar(20) NOT NULL,
  `last_flex` datetime NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `API_Auto_dialer_Queue_Customers`
--

CREATE TABLE `API_Auto_dialer_Queue_Customers` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `order_id` varchar(80) NOT NULL,
  `customer_id` varchar(80) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `agent_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `agent_connected` varchar(10) NOT NULL,
  `status` varchar(80) NOT NULL,
  `date` datetime NOT NULL,
  `dialAt` datetime NOT NULL,
  `ringAt` datetime NOT NULL,
  `connectedAt` datetime NOT NULL,
  `hangupAt` datetime NOT NULL,
  `hangup_reason` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `originate_success` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `API_call_config`
--

CREATE TABLE `API_call_config` (
  `id` int NOT NULL,
  `API_username` varchar(100) NOT NULL,
  `API_password` varchar(100) NOT NULL,
  `API_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `API_log_call`
--

CREATE TABLE `API_log_call` (
  `id` bigint NOT NULL,
  `datecall` datetime NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_send` text NOT NULL,
  `status_code` varchar(100) NOT NULL,
  `data_return` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `API_log_request`
--

CREATE TABLE `API_log_request` (
  `id` bigint NOT NULL,
  `datecall` datetime NOT NULL,
  `path` varchar(100) NOT NULL,
  `data_get` text NOT NULL,
  `data_return` text NOT NULL,
  `user` varchar(20) NOT NULL,
  `ipadd` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `API_request_config`
--

CREATE TABLE `API_request_config` (
  `API_username` varchar(100) NOT NULL,
  `API_password` varchar(100) NOT NULL,
  `key_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ast_config`
--

CREATE TABLE `ast_config` (
  `id` int NOT NULL,
  `cat_metric` int NOT NULL DEFAULT '0',
  `var_metric` int NOT NULL DEFAULT '0',
  `commented` int NOT NULL DEFAULT '0',
  `filename` varchar(128) NOT NULL DEFAULT '',
  `category` varchar(128) NOT NULL DEFAULT 'default',
  `var_name` varchar(128) NOT NULL DEFAULT '',
  `var_val` text NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `zsection` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact`
--

CREATE TABLE `bcp_contact` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact_79`
--

CREATE TABLE `bcp_contact_79` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact_120`
--

CREATE TABLE `bcp_contact_120` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact_138`
--

CREATE TABLE `bcp_contact_138` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact_309`
--

CREATE TABLE `bcp_contact_309` (
  `id` int NOT NULL DEFAULT '0',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bcp_contact_backup`
--

CREATE TABLE `bcp_contact_backup` (
  `id` int NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_import` datetime NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_add` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_monitor`
--

CREATE TABLE `bridge_monitor` (
  `uniqueid` varchar(32) NOT NULL,
  `linkedid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `callerid` varchar(20) NOT NULL,
  `calledid` varchar(20) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `bridge_monitor`
--
DELIMITER $$
CREATE TRIGGER `bridge_monitor_del` AFTER DELETE ON `bridge_monitor` FOR EACH ROW BEGIN
UPDATE agent_performance_daily SET status='' where agent_number=OLD.calledid AND date=DATE(NOW());
UPDATE agent_performance_daily SET status='' where agent_number=OLD.callerid AND date=DATE(NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bridge_monitor_update` AFTER UPDATE ON `bridge_monitor` FOR EACH ROW BEGIN
UPDATE agent_performance_daily SET status=concat('<=',NEW.callerid) where agent_number=NEW.calledid AND date=DATE(NOW());
UPDATE agent_performance_daily SET status=concat('=>',NEW.calledid) where agent_number=NEW.callerid AND date=DATE(NOW());

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_END_result_agent_5`
--

CREATE TABLE `callout_report_END_result_agent_5` (
  `id` bigint NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(200) NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_total_contact` int NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(100) NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `1` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `2` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `3` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `4` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `5` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `6` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `7` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến người thân',
  `8` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `9` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `10` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `11` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `12` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_đặt hẹn _ đủ thông tin in thẻ',
  `13` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_chưa cung cấp đủ thông tin ',
  `14` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `15` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `22` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách đã có SP tương tự của Techcombank',
  `28` int NOT NULL DEFAULT '0' COMMENT 'KH trans',
  `29` int NOT NULL DEFAULT '0' COMMENT 'KH login - chưa chi tiêu',
  `31` int NOT NULL DEFAULT '0' COMMENT 'Không đổi được pass do máy không tương thích smart otp',
  `32` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `33` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding từ chối chi tiêu',
  `34` int NOT NULL DEFAULT '0' COMMENT 'Kh onboarding từ chối chi tiêu muốn khóa thẻ',
  `35` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding đồng ý chi tiêu',
  `36` int NOT NULL DEFAULT '0' COMMENT 'Số điện thoại người duyệt trùng SĐT người tạo',
  `37` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_ do hạn mức thấp',
  `38` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `39` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_do không cung cấp được CMT, Họ khẩu/ KT3',
  `143` int NOT NULL DEFAULT '0' COMMENT 'Lỗi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_END_result_agent_11`
--

CREATE TABLE `callout_report_END_result_agent_11` (
  `id` bigint NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(200) NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_total_contact` int NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(100) NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `231` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng Active: KH chuẩn bị thực hiện giao dịch ( tháng T+1)',
  `230` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chuẩn bị thực hiện giao dịch ( tháng T)',
  `229` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - Khách hàng mở tài khoản đóng thuế ( 1 năm 1 đến 2 lần giao dịch)',
  `228` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - mở tk nhưng chưa có nhu cầu sử dụng (cty mới thành lập chưa gd trong năm nay, không hoạt động đang bị ảnh hưởng bởi các yếu tố)',
  `227` int NOT NULL DEFAULT '0' COMMENT 'NTB_Giá phí chưa cạnh tranh/ sản phẩm cạnh tranh',
  `226` int NOT NULL DEFAULT '0' COMMENT 'NTB_Sản phẩm Khó sử dụng và phức tạp',
  `225` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đã mở TK thành công',
  `224` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH cần thêm thời gian chuẩn bị hso',
  `223` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang chuẩn bị hồ sơ',
  `222` int NOT NULL DEFAULT '0' COMMENT 'KH đã active sp/dvu',
  `221` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang ở tỉnh thành không có TCB',
  `220` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thao tác bị lỗi',
  `219` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH không đủ hồ sơ để upload lên luồng',
  `218` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã đến quầy mở TK',
  `217` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã mở TK tại NH khác',
  `216` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thấy luồng up hồ sơ online phức tạp muốn ra quầy',
  `215` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không thuộc đối tượng KH DN',
  `214` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 chuyển NH khác',
  `213` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 do dừng hoạt động',
  `212` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN tạm dừng hoạt động/phá sản/ giải thể chuẩn bị đóng tài khoản',
  `211` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH không còn hoạt động XNK nữa',
  `210` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không chia sẻ thông tin',
  `209` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH xin ý kiến người ra quyết đinh',
  `208` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chưa được TCB cung cấp lending trước đây khi có nhu cầu',
  `207` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH chỉ gd nội địa',
  `206` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chỉ XK (nhận tiền về)',
  `205` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không còn hđ XNK',
  `204` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã ngừng HĐ/ tạm ngưng HĐ',
  `203` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chỉ thích gd tại quầy do lớn tuổi hoặc theo thói quen',
  `202` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang dùng NH khác ổn định k muốn thay đổi',
  `201` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `200` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang có QH lending tại bank khác',
  `199` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `198` int NOT NULL DEFAULT '0' COMMENT 'NTB_Trải nghiệm tại TCB không tốt ( Chất lượng dịch vụ tại quầy, tổng đài, chuyên viên chăm sóc … --> Con người)',
  `197` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Sản phẩm chưa hấp dẫn với KH',
  `196` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH muốn TK số đẹp',
  `195` int NOT NULL DEFAULT '0' COMMENT 'NTB_  Kh tham chỉ tham khảo hồ sơ mở TK tại TCB',
  `194` int NOT NULL DEFAULT '0' COMMENT 'NTB_Xem lại danh mục hồ sơ',
  `193` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Chưa có thời gian chuẩn bị hồ sơ',
  `192` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ/ Chủ tài khoản là người nước ngoài ko muốn sử dụng dịch vụ',
  `191` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN quá xa CN/PGD TCB',
  `190` int NOT NULL DEFAULT '0' COMMENT 'ETB_Doanh nghiệp đặc thù (HCSN, Chỉ định công ty mẹ con, DN FDI phải dùng NH chỉ định)',
  `189` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ- KT lớn tuổi không muốn thay đổi',
  `188` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH chưa hài lòng về dịch vụ của TCB - ghi rõ dịch vụ chưa hài lòng (Vay, bảo lãnh, LC, giao dịch tại quầy, giao dịch online…)',
  `187` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang có khoản vay bên NH khác',
  `186` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH có nhu cầu  tín dụng tuy nhiên KH chưa đủ điều kiện vay của TCB, NH khác đang chào thông tin vay/ đang cho vay',
  `185` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang sử dụng Ngân hàng khác do thói quen/ mối quan hệ của chủ DN, KTT ',
  `184` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN có thói quen dùng TK cá nhân của chủ DN, dùng tiền mặt.',
  `183` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN chưa có đơn hàng',
  `182` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH quan tâm về giá phí ',
  `181` int NOT NULL DEFAULT '0' COMMENT 'ETB_Hoạt động KD của cty sụt giảm',
  `152` int NOT NULL DEFAULT '0' COMMENT 'KH chủ động liên hệ hỗ trợ',
  `151` int NOT NULL DEFAULT '0' COMMENT 'KH đang active',
  `150` int NOT NULL DEFAULT '0' COMMENT 'KH deactive',
  `149` int NOT NULL DEFAULT '0' COMMENT 'KH inactive',
  `148` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 10trđ',
  `147` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 50trđ',
  `146` int NOT NULL DEFAULT '0' COMMENT '3.KH CASA',
  `145` int NOT NULL DEFAULT '0' COMMENT '2.KH XNK',
  `144` int NOT NULL DEFAULT '0' COMMENT '1. KH group CD',
  `101` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `102` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `103` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `104` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `105` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `106` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `107` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến giám đốc/KTT',
  `108` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `109` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `110` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `111` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `112` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm',
  `113` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm -đã giao dịch',
  `114` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `115` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `122` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách hàng dừng hoạt động/giải thể/phá sản',
  `128` int NOT NULL DEFAULT '0' COMMENT 'KH đã giao dịch (feb; feb-e)',
  `129` int NOT NULL DEFAULT '0' COMMENT 'KH ACTIVE VIEW (feb)',
  `130` int NOT NULL DEFAULT '0' COMMENT 'Lỗi',
  `131` int NOT NULL DEFAULT '0' COMMENT 'KH không đăng nhập được khi chuyển đổi sang Smart OTP',
  `132` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `133` int NOT NULL DEFAULT '0' COMMENT 'KH có FEB-từ chối giao dịch',
  `134` int NOT NULL DEFAULT '0' COMMENT 'Kh  từ chối chi tiêu muốn ngừng sử dụng dv TCB',
  `136` int NOT NULL DEFAULT '0' COMMENT 'KH quên mật khẩu',
  `137` int NOT NULL DEFAULT '0' COMMENT 'KH chỉ muốn sử dụng gói 1 chữ ký',
  `138` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `139` int NOT NULL DEFAULT '0' COMMENT 'Nhu cầu cao hơn so với các tính năng đang có trên hệ thống',
  `140` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm FEB-chưa giao dịch',
  `141` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `142` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_ KH đồng ý sẽ ra quầy đăng ký dịch vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_END_result_campaign_5`
--

CREATE TABLE `callout_report_END_result_campaign_5` (
  `id` bigint NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(200) NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `1` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `2` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `3` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `4` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `5` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `6` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `7` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến người thân',
  `8` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `9` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `10` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `11` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `12` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_đặt hẹn _ đủ thông tin in thẻ',
  `13` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_chưa cung cấp đủ thông tin ',
  `14` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `15` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `22` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách đã có SP tương tự của Techcombank',
  `28` int NOT NULL DEFAULT '0' COMMENT 'KH trans',
  `29` int NOT NULL DEFAULT '0' COMMENT 'KH login - chưa chi tiêu',
  `31` int NOT NULL DEFAULT '0' COMMENT 'Không đổi được pass do máy không tương thích smart otp',
  `32` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `33` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding từ chối chi tiêu',
  `34` int NOT NULL DEFAULT '0' COMMENT 'Kh onboarding từ chối chi tiêu muốn khóa thẻ',
  `35` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding đồng ý chi tiêu',
  `36` int NOT NULL DEFAULT '0' COMMENT 'Số điện thoại người duyệt trùng SĐT người tạo',
  `37` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_ do hạn mức thấp',
  `38` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `39` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_do không cung cấp được CMT, Họ khẩu/ KT3',
  `143` int NOT NULL DEFAULT '0' COMMENT 'Lỗi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_END_result_campaign_11`
--

CREATE TABLE `callout_report_END_result_campaign_11` (
  `id` bigint NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(200) NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `231` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng Active: KH chuẩn bị thực hiện giao dịch ( tháng T+1)',
  `230` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chuẩn bị thực hiện giao dịch ( tháng T)',
  `229` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - Khách hàng mở tài khoản đóng thuế ( 1 năm 1 đến 2 lần giao dịch)',
  `228` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - mở tk nhưng chưa có nhu cầu sử dụng (cty mới thành lập chưa gd trong năm nay, không hoạt động đang bị ảnh hưởng bởi các yếu tố)',
  `227` int NOT NULL DEFAULT '0' COMMENT 'NTB_Giá phí chưa cạnh tranh/ sản phẩm cạnh tranh',
  `226` int NOT NULL DEFAULT '0' COMMENT 'NTB_Sản phẩm Khó sử dụng và phức tạp',
  `225` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đã mở TK thành công',
  `224` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH cần thêm thời gian chuẩn bị hso',
  `223` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang chuẩn bị hồ sơ',
  `222` int NOT NULL DEFAULT '0' COMMENT 'KH đã active sp/dvu',
  `221` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang ở tỉnh thành không có TCB',
  `220` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thao tác bị lỗi',
  `219` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH không đủ hồ sơ để upload lên luồng',
  `218` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã đến quầy mở TK',
  `217` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã mở TK tại NH khác',
  `216` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thấy luồng up hồ sơ online phức tạp muốn ra quầy',
  `215` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không thuộc đối tượng KH DN',
  `214` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 chuyển NH khác',
  `213` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 do dừng hoạt động',
  `212` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN tạm dừng hoạt động/phá sản/ giải thể chuẩn bị đóng tài khoản',
  `211` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH không còn hoạt động XNK nữa',
  `210` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không chia sẻ thông tin',
  `209` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH xin ý kiến người ra quyết đinh',
  `208` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chưa được TCB cung cấp lending trước đây khi có nhu cầu',
  `207` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH chỉ gd nội địa',
  `206` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chỉ XK (nhận tiền về)',
  `205` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không còn hđ XNK',
  `204` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã ngừng HĐ/ tạm ngưng HĐ',
  `203` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chỉ thích gd tại quầy do lớn tuổi hoặc theo thói quen',
  `202` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang dùng NH khác ổn định k muốn thay đổi',
  `201` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `200` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang có QH lending tại bank khác',
  `199` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `198` int NOT NULL DEFAULT '0' COMMENT 'NTB_Trải nghiệm tại TCB không tốt ( Chất lượng dịch vụ tại quầy, tổng đài, chuyên viên chăm sóc … --> Con người)',
  `197` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Sản phẩm chưa hấp dẫn với KH',
  `196` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH muốn TK số đẹp',
  `195` int NOT NULL DEFAULT '0' COMMENT 'NTB_  Kh tham chỉ tham khảo hồ sơ mở TK tại TCB',
  `194` int NOT NULL DEFAULT '0' COMMENT 'NTB_Xem lại danh mục hồ sơ',
  `193` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Chưa có thời gian chuẩn bị hồ sơ',
  `192` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ/ Chủ tài khoản là người nước ngoài ko muốn sử dụng dịch vụ',
  `191` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN quá xa CN/PGD TCB',
  `190` int NOT NULL DEFAULT '0' COMMENT 'ETB_Doanh nghiệp đặc thù (HCSN, Chỉ định công ty mẹ con, DN FDI phải dùng NH chỉ định)',
  `189` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ- KT lớn tuổi không muốn thay đổi',
  `188` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH chưa hài lòng về dịch vụ của TCB - ghi rõ dịch vụ chưa hài lòng (Vay, bảo lãnh, LC, giao dịch tại quầy, giao dịch online…)',
  `187` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang có khoản vay bên NH khác',
  `186` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH có nhu cầu  tín dụng tuy nhiên KH chưa đủ điều kiện vay của TCB, NH khác đang chào thông tin vay/ đang cho vay',
  `185` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang sử dụng Ngân hàng khác do thói quen/ mối quan hệ của chủ DN, KTT ',
  `184` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN có thói quen dùng TK cá nhân của chủ DN, dùng tiền mặt.',
  `183` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN chưa có đơn hàng',
  `182` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH quan tâm về giá phí ',
  `181` int NOT NULL DEFAULT '0' COMMENT 'ETB_Hoạt động KD của cty sụt giảm',
  `152` int NOT NULL DEFAULT '0' COMMENT 'KH chủ động liên hệ hỗ trợ',
  `151` int NOT NULL DEFAULT '0' COMMENT 'KH đang active',
  `150` int NOT NULL DEFAULT '0' COMMENT 'KH deactive',
  `149` int NOT NULL DEFAULT '0' COMMENT 'KH inactive',
  `148` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 10trđ',
  `147` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 50trđ',
  `146` int NOT NULL DEFAULT '0' COMMENT '3.KH CASA',
  `145` int NOT NULL DEFAULT '0' COMMENT '2.KH XNK',
  `144` int NOT NULL DEFAULT '0' COMMENT '1. KH group CD',
  `101` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `102` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `103` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `104` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `105` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `106` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `107` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến giám đốc/KTT',
  `108` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `109` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `110` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `111` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `112` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm',
  `113` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm -đã giao dịch',
  `114` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `115` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `122` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách hàng dừng hoạt động/giải thể/phá sản',
  `128` int NOT NULL DEFAULT '0' COMMENT 'KH đã giao dịch (feb; feb-e)',
  `129` int NOT NULL DEFAULT '0' COMMENT 'KH ACTIVE VIEW (feb)',
  `130` int NOT NULL DEFAULT '0' COMMENT 'Lỗi',
  `131` int NOT NULL DEFAULT '0' COMMENT 'KH không đăng nhập được khi chuyển đổi sang Smart OTP',
  `132` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `133` int NOT NULL DEFAULT '0' COMMENT 'KH có FEB-từ chối giao dịch',
  `134` int NOT NULL DEFAULT '0' COMMENT 'Kh  từ chối chi tiêu muốn ngừng sử dụng dv TCB',
  `136` int NOT NULL DEFAULT '0' COMMENT 'KH quên mật khẩu',
  `137` int NOT NULL DEFAULT '0' COMMENT 'KH chỉ muốn sử dụng gói 1 chữ ký',
  `138` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `139` int NOT NULL DEFAULT '0' COMMENT 'Nhu cầu cao hơn so với các tính năng đang có trên hệ thống',
  `140` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm FEB-chưa giao dịch',
  `141` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `142` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_ KH đồng ý sẽ ra quầy đăng ký dịch vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_summary_daily__5`
--

CREATE TABLE `callout_report_summary_daily__5` (
  `id` bigint NOT NULL,
  `date` date NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(100) NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_total_contact` int NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(100) NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `1` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `2` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `3` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `4` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `5` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `6` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `7` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến người thân',
  `8` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `9` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `10` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `11` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `12` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_đặt hẹn _ đủ thông tin in thẻ',
  `13` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý mua_chưa cung cấp đủ thông tin ',
  `14` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `15` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `22` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách đã có SP tương tự của Techcombank',
  `28` int NOT NULL DEFAULT '0' COMMENT 'KH trans',
  `29` int NOT NULL DEFAULT '0' COMMENT 'KH login - chưa chi tiêu',
  `31` int NOT NULL DEFAULT '0' COMMENT 'Không đổi được pass do máy không tương thích smart otp',
  `32` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `33` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding từ chối chi tiêu',
  `34` int NOT NULL DEFAULT '0' COMMENT 'Kh onboarding từ chối chi tiêu muốn khóa thẻ',
  `35` int NOT NULL DEFAULT '0' COMMENT 'KH onboarding đồng ý chi tiêu',
  `36` int NOT NULL DEFAULT '0' COMMENT 'Số điện thoại người duyệt trùng SĐT người tạo',
  `37` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_ do hạn mức thấp',
  `38` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `39` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_do không cung cấp được CMT, Họ khẩu/ KT3',
  `143` int NOT NULL DEFAULT '0' COMMENT 'Lỗi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_report_summary_daily__11`
--

CREATE TABLE `callout_report_summary_daily__11` (
  `id` bigint NOT NULL,
  `date` date NOT NULL,
  `campaign_group_id` int NOT NULL,
  `campaign_group_name` varchar(200) NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `campaign_total_contact` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_total_contact` int NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(100) NOT NULL,
  `contacted` int NOT NULL,
  `UTC` int NOT NULL,
  `231` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng Active: KH chuẩn bị thực hiện giao dịch ( tháng T+1)',
  `230` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chuẩn bị thực hiện giao dịch ( tháng T)',
  `229` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - Khách hàng mở tài khoản đóng thuế ( 1 năm 1 đến 2 lần giao dịch)',
  `228` int NOT NULL DEFAULT '0' COMMENT 'NTB_Khách hàng từ chối - mở tk nhưng chưa có nhu cầu sử dụng (cty mới thành lập chưa gd trong năm nay, không hoạt động đang bị ảnh hưởng bởi các yếu tố)',
  `227` int NOT NULL DEFAULT '0' COMMENT 'NTB_Giá phí chưa cạnh tranh/ sản phẩm cạnh tranh',
  `226` int NOT NULL DEFAULT '0' COMMENT 'NTB_Sản phẩm Khó sử dụng và phức tạp',
  `225` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đã mở TK thành công',
  `224` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH cần thêm thời gian chuẩn bị hso',
  `223` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang chuẩn bị hồ sơ',
  `222` int NOT NULL DEFAULT '0' COMMENT 'KH đã active sp/dvu',
  `221` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang ở tỉnh thành không có TCB',
  `220` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thao tác bị lỗi',
  `219` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH không đủ hồ sơ để upload lên luồng',
  `218` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã đến quầy mở TK',
  `217` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã mở TK tại NH khác',
  `216` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH thấy luồng up hồ sơ online phức tạp muốn ra quầy',
  `215` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không thuộc đối tượng KH DN',
  `214` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 chuyển NH khác',
  `213` int NOT NULL DEFAULT '0' COMMENT 'ETB_Đã đóng TK trên T24 do dừng hoạt động',
  `212` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN tạm dừng hoạt động/phá sản/ giải thể chuẩn bị đóng tài khoản',
  `211` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH không còn hoạt động XNK nữa',
  `210` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không chia sẻ thông tin',
  `209` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH xin ý kiến người ra quyết đinh',
  `208` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chưa được TCB cung cấp lending trước đây khi có nhu cầu',
  `207` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH chỉ gd nội địa',
  `206` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH chỉ XK (nhận tiền về)',
  `205` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH không còn hđ XNK',
  `204` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đã ngừng HĐ/ tạm ngưng HĐ',
  `203` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Kh chỉ thích gd tại quầy do lớn tuổi hoặc theo thói quen',
  `202` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH đang dùng NH khác ổn định k muốn thay đổi',
  `201` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `200` int NOT NULL DEFAULT '0' COMMENT 'NTB_KH đang có QH lending tại bank khác',
  `199` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH sử dụng Ngân hàng theo chỉ định của đối tác/ cty mẹ',
  `198` int NOT NULL DEFAULT '0' COMMENT 'NTB_Trải nghiệm tại TCB không tốt ( Chất lượng dịch vụ tại quầy, tổng đài, chuyên viên chăm sóc … --> Con người)',
  `197` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Sản phẩm chưa hấp dẫn với KH',
  `196` int NOT NULL DEFAULT '0' COMMENT 'NTB_ KH muốn TK số đẹp',
  `195` int NOT NULL DEFAULT '0' COMMENT 'NTB_  Kh tham chỉ tham khảo hồ sơ mở TK tại TCB',
  `194` int NOT NULL DEFAULT '0' COMMENT 'NTB_Xem lại danh mục hồ sơ',
  `193` int NOT NULL DEFAULT '0' COMMENT 'NTB_ Chưa có thời gian chuẩn bị hồ sơ',
  `192` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ/ Chủ tài khoản là người nước ngoài ko muốn sử dụng dịch vụ',
  `191` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN quá xa CN/PGD TCB',
  `190` int NOT NULL DEFAULT '0' COMMENT 'ETB_Doanh nghiệp đặc thù (HCSN, Chỉ định công ty mẹ con, DN FDI phải dùng NH chỉ định)',
  `189` int NOT NULL DEFAULT '0' COMMENT 'ETB_GĐ- KT lớn tuổi không muốn thay đổi',
  `188` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH chưa hài lòng về dịch vụ của TCB - ghi rõ dịch vụ chưa hài lòng (Vay, bảo lãnh, LC, giao dịch tại quầy, giao dịch online…)',
  `187` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang có khoản vay bên NH khác',
  `186` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH có nhu cầu  tín dụng tuy nhiên KH chưa đủ điều kiện vay của TCB, NH khác đang chào thông tin vay/ đang cho vay',
  `185` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH đang sử dụng Ngân hàng khác do thói quen/ mối quan hệ của chủ DN, KTT ',
  `184` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN có thói quen dùng TK cá nhân của chủ DN, dùng tiền mặt.',
  `183` int NOT NULL DEFAULT '0' COMMENT 'ETB_DN chưa có đơn hàng',
  `182` int NOT NULL DEFAULT '0' COMMENT 'ETB_KH quan tâm về giá phí ',
  `181` int NOT NULL DEFAULT '0' COMMENT 'ETB_Hoạt động KD của cty sụt giảm',
  `152` int NOT NULL DEFAULT '0' COMMENT 'KH chủ động liên hệ hỗ trợ',
  `151` int NOT NULL DEFAULT '0' COMMENT 'KH đang active',
  `150` int NOT NULL DEFAULT '0' COMMENT 'KH deactive',
  `149` int NOT NULL DEFAULT '0' COMMENT 'KH inactive',
  `148` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 10trđ',
  `147` int NOT NULL DEFAULT '0' COMMENT 'TOI ~ 50trđ',
  `146` int NOT NULL DEFAULT '0' COMMENT '3.KH CASA',
  `145` int NOT NULL DEFAULT '0' COMMENT '2.KH XNK',
  `144` int NOT NULL DEFAULT '0' COMMENT '1. KH group CD',
  `101` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau_ Máy bận',
  `102` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không  nghe máy',
  `103` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- Không liên lạc được',
  `104` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `105` int NOT NULL DEFAULT '0' COMMENT 'Gọi lại sau- do KH bận',
  `106` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không quan tâm/ ko có nhu cầu ko rõ lý do',
  `107` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_ cần hỏi ý kiến giám đốc/KTT',
  `108` int NOT NULL DEFAULT '0' COMMENT 'Từ chối_Không gọi lại nữa do Kh phản ứng dữ dội...',
  `109` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc_do ít ưu đãi, khuyến mại...',
  `110` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _ do phí lãi',
  `111` int NOT NULL DEFAULT '0' COMMENT 'Cân nhắc _do thích dùng tiền mặt/ sợ lạm chi',
  `112` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm',
  `113` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm -đã giao dịch',
  `114` int NOT NULL DEFAULT '0' COMMENT 'Khác',
  `115` int NOT NULL DEFAULT '0' COMMENT 'Chưa gọi',
  `122` int NOT NULL DEFAULT '0' COMMENT 'Từ chối _Khách hàng dừng hoạt động/giải thể/phá sản',
  `128` int NOT NULL DEFAULT '0' COMMENT 'KH đã giao dịch (feb; feb-e)',
  `129` int NOT NULL DEFAULT '0' COMMENT 'KH ACTIVE VIEW (feb)',
  `130` int NOT NULL DEFAULT '0' COMMENT 'Lỗi',
  `131` int NOT NULL DEFAULT '0' COMMENT 'KH không đăng nhập được khi chuyển đổi sang Smart OTP',
  `132` int NOT NULL DEFAULT '0' COMMENT 'Ko đổi được pass hoặc login do lỗi hệ thống',
  `133` int NOT NULL DEFAULT '0' COMMENT 'KH có FEB-từ chối giao dịch',
  `134` int NOT NULL DEFAULT '0' COMMENT 'Kh  từ chối chi tiêu muốn ngừng sử dụng dv TCB',
  `136` int NOT NULL DEFAULT '0' COMMENT 'KH quên mật khẩu',
  `137` int NOT NULL DEFAULT '0' COMMENT 'KH chỉ muốn sử dụng gói 1 chữ ký',
  `138` int NOT NULL DEFAULT '0' COMMENT 'Từ chối - vi phạm KVRR',
  `139` int NOT NULL DEFAULT '0' COMMENT 'Nhu cầu cao hơn so với các tính năng đang có trên hệ thống',
  `140` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_Đồng ý sử dụng sản phẩm FEB-chưa giao dịch',
  `141` int NOT NULL DEFAULT '0' COMMENT 'Sai số',
  `142` int NOT NULL DEFAULT '0' COMMENT 'LLĐ_ KH đồng ý sẽ ra quầy đăng ký dịch vụ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `call_log_status`
--

CREATE TABLE `call_log_status` (
  `id` int NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `trunk` varchar(30) NOT NULL,
  `dial_number` varchar(20) NOT NULL,
  `callerid` varchar(20) NOT NULL,
  `calldate` datetime NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `call_note`
--

CREATE TABLE `call_note` (
  `id` bigint NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `agent_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_id` int NOT NULL,
  `campaign_contact_id` int NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `result_id` int NOT NULL,
  `result_name` varchar(100) NOT NULL,
  `result_connected` int NOT NULL,
  `reason_id` int NOT NULL,
  `reason_name` varchar(100) NOT NULL,
  `list_id` int NOT NULL,
  `list_name` varchar(100) NOT NULL,
  `is_completed_call` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `call_note_backup`
--

CREATE TABLE `call_note_backup` (
  `id` bigint NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `agent_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_id` int NOT NULL,
  `campaign_contact_id` int NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `result_id` int NOT NULL,
  `result_name` varchar(100) NOT NULL,
  `result_connected` int NOT NULL,
  `reason_id` int NOT NULL,
  `reason_name` varchar(100) NOT NULL,
  `list_id` int NOT NULL,
  `list_name` varchar(100) NOT NULL,
  `is_completed_call` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `call_out_list_call_filter`
--

CREATE TABLE `call_out_list_call_filter` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` tinyint NOT NULL,
  `set_to_default` tinyint NOT NULL,
  `set_appointment` tinyint NOT NULL,
  `set_callback` tinyint NOT NULL,
  `set_continue_call` tinyint NOT NULL,
  `set_for_collector` tinyint NOT NULL,
  `set_for_today_filter` tinyint NOT NULL,
  `is_completed_call` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_out_products`
--

CREATE TABLE `call_out_products` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_out_reason_list`
--

CREATE TABLE `call_out_reason_list` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_out_result_call`
--

CREATE TABLE `call_out_result_call` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `list_id` int NOT NULL,
  `list_name` varchar(200) NOT NULL,
  `show_in_form` tinyint NOT NULL,
  `is_contacted_call` tinyint NOT NULL,
  `show_list_reason` tinyint NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_status`
--

CREATE TABLE `call_status` (
  `callId` double(18,6) NOT NULL,
  `callerId` varchar(13) NOT NULL,
  `status` varchar(30) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `queue` varchar(25) NOT NULL,
  `position` varchar(11) NOT NULL,
  `originalPosition` varchar(11) NOT NULL,
  `holdtime` varchar(11) NOT NULL,
  `keyPressed` varchar(11) NOT NULL,
  `callduration` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `qa_id` int NOT NULL,
  `qa_name` varchar(100) NOT NULL,
  `result_group_id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `ten_chien_dich` varchar(200) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `run` tinyint NOT NULL,
  `total_contact` int UNSIGNED NOT NULL,
  `total_agent` int UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL,
  `total_assiged` int UNSIGNED NOT NULL,
  `total_not_assiged` int UNSIGNED NOT NULL,
  `agents` text NOT NULL,
  `contacts` text NOT NULL,
  `owner_by` int NOT NULL,
  `owner_by_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_backup`
--

CREATE TABLE `campaign_backup` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `qa_id` int NOT NULL,
  `qa_name` varchar(100) NOT NULL,
  `result_group_id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `ten_chien_dich` varchar(200) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `run` tinyint NOT NULL,
  `total_contact` int UNSIGNED NOT NULL,
  `total_agent` int UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL,
  `total_assiged` int UNSIGNED NOT NULL,
  `total_not_assiged` int UNSIGNED NOT NULL,
  `agents` text NOT NULL,
  `contacts` text NOT NULL,
  `owner_by` int NOT NULL,
  `owner_by_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5`
--

CREATE TABLE `campaign_contact_5` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_backup`
--

CREATE TABLE `campaign_contact_5_backup` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_backup_6_2022`
--

CREATE TABLE `campaign_contact_5_backup_6_2022` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_bk_23_7`
--

CREATE TABLE `campaign_contact_5_bk_23_7` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_temp_79`
--

CREATE TABLE `campaign_contact_5_temp_79` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_temp_147`
--

CREATE TABLE `campaign_contact_5_temp_147` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_temp_150`
--

CREATE TABLE `campaign_contact_5_temp_150` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_temp_175`
--

CREATE TABLE `campaign_contact_5_temp_175` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_5_temp_189`
--

CREATE TABLE `campaign_contact_5_temp_189` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `contact_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `cccd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile2` varchar(50) DEFAULT NULL,
  `businessphone` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `loai_the` varchar(50) DEFAULT NULL,
  `Khach_type` varchar(50) DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `note2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_8`
--

CREATE TABLE `campaign_contact_8` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11`
--

CREATE TABLE `campaign_contact_11` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11_temp_79`
--

CREATE TABLE `campaign_contact_11_temp_79` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11_temp_126`
--

CREATE TABLE `campaign_contact_11_temp_126` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11_temp_127`
--

CREATE TABLE `campaign_contact_11_temp_127` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11_temp_131`
--

CREATE TABLE `campaign_contact_11_temp_131` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_11_temp_294`
--

CREATE TABLE `campaign_contact_11_temp_294` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_17`
--

CREATE TABLE `campaign_contact_17` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_17_temp_334`
--

CREATE TABLE `campaign_contact_17_temp_334` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_contact_17_temp_355`
--

CREATE TABLE `campaign_contact_17_temp_355` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(200) NOT NULL,
  `list_id` int NOT NULL DEFAULT '0',
  `list_name` varchar(200) NOT NULL,
  `result_id` int NOT NULL DEFAULT '0',
  `result_name` varchar(200) NOT NULL,
  `CampainName` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `ma_bbc` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `reason_id` int NOT NULL DEFAULT '0',
  `reason_name` varchar(200) NOT NULL,
  `user_add` varchar(200) NOT NULL,
  `date_add` datetime DEFAULT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(200) NOT NULL,
  `assigned_by_number` varchar(20) NOT NULL,
  `assigned_by_id` int NOT NULL DEFAULT '0',
  `assigned_group` varchar(50) NOT NULL,
  `date_import` datetime NOT NULL,
  `contact_id` varchar(50) DEFAULT NULL,
  `name_congty` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mst` varchar(50) DEFAULT NULL,
  `name_director` varchar(100) DEFAULT NULL,
  `phone_director` varchar(50) DEFAULT NULL,
  `mail_director` varchar(50) DEFAULT NULL,
  `name_KTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_KTT` varchar(50) DEFAULT NULL,
  `mail_KTT` varchar(50) DEFAULT NULL,
  `other_phone` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `BB_active` varchar(50) DEFAULT NULL,
  `trans_active` varchar(100) DEFAULT NULL,
  `NXK2022` varchar(50) DEFAULT NULL,
  `OTT_status` varchar(50) DEFAULT NULL,
  `OTT_Value` varchar(50) DEFAULT NULL,
  `FX_status` varchar(50) DEFAULT NULL,
  `FX_Value` varchar(50) DEFAULT NULL,
  `Dthu_2021` varchar(50) DEFAULT NULL,
  `Cashin_2022` varchar(50) DEFAULT NULL,
  `Wallet` varchar(50) DEFAULT NULL,
  `Avg_casa` varchar(50) DEFAULT NULL,
  `date_goilai` datetime DEFAULT NULL,
  `connected` int DEFAULT '0',
  `last_connected` datetime DEFAULT NULL,
  `ma_cn` varchar(50) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note2` varchar(50) DEFAULT NULL,
  `note3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `doing` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_group`
--

CREATE TABLE `campaign_group` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ghichu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner_by` int NOT NULL,
  `owner_by_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_group_backup`
--

CREATE TABLE `campaign_group_backup` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ghichu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner_by` int NOT NULL,
  `owner_by_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdr`
--

CREATE TABLE `cdr` (
  `recid` int UNSIGNED NOT NULL COMMENT 'Record ID',
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL,
  `realdst` varchar(80) NOT NULL,
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `uniqueid2` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `userfield2` varchar(30) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `queue_event` text NOT NULL,
  `case_id` tinyint NOT NULL,
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `cdr`
--
DELIMITER $$
CREATE TRIGGER `cdr_insert` AFTER INSERT ON `cdr` FOR EACH ROW BEGIN
DECLARE IDs INT;
SET IDs=(SELECT logid FROM user_log WHERE agent=NEW.src AND userfield=NEW.userfield  AND logout_time='0000-00-00 00:00:00' AND DATE(login_time)=DATE(NEW.calldate) ORDER BY login_time ASC LIMIT 1);

IF (NEW.realdst='*11' AND IDs Is NULL) THEN
INSERT user_log SET login_time=NEW.calldate,agent=NEW.src,userfield=NEW.userfield;
END IF;
IF NEW.realdst='*12' THEN
UPDATE user_log SET logout_time=NEW.calldate WHERE agent=NEW.src AND userfield=NEW.userfield AND logid=IDs;
END IF;

IF(LENGTH(NEW.realsrc)=5) THEN
	IF (NEW.duration="ANSWERED") THEN
		UPDATE agent_performance_daily SET 		total_answered=total_answered+1, total_call=total_call+1, total_time_talk=total_time_talk+NEW.billsec, total_time_wait=total_time_wait+NEW.duration-NEW.billsec WHERE agent_number = NEW.realsrc AND `date`=DATE(NOW());
	ELSE
    	UPDATE agent_performance_daily SET 		total_call=total_call+1, total_time_talk=total_time_talk+NEW.billsec, total_time_wait=total_time_wait+NEW.duration-NEW.billsec WHERE agent_number = NEW.realsrc AND `date`=DATE(NOW());
	END IF;
END IF;


END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cdr_insert_before` BEFORE INSERT ON `cdr` FOR EACH ROW BEGIN
IF(NEW.realsrc='') OR (NEW.realsrc IS NULL) THEN
SET NEW.realsrc=NEW.src;
END IF;
IF(NEW.realdst='') OR (NEW.realdst IS NULL) THEN
SET NEW.realdst=NEW.`dst`;
END IF;
IF(locate(";",NEW.userfield)>0) THEN 
SET NEW.userfield=substr(NEW.userfield,1,locate(";",NEW.userfield)-1);
SET NEW.userfield2=substr(NEW.userfield,locate(";",NEW.userfield)+1);
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cdr_update` AFTER UPDATE ON `cdr` FOR EACH ROW BEGIN
END
$$
DELIMITER ;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `cdr_bill`
--

CREATE TABLE `cdr_bill` (
  `recid` bigint NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `calldate` datetime NOT NULL,
  `src` varchar(80) NOT NULL,
  `dst` varchar(80) NOT NULL,
  `duration` int NOT NULL,
  `billsec` int NOT NULL,
  `accountcode` varchar(100) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `gateway` tinyint NOT NULL,
  `prefix_network` varchar(10) NOT NULL,
  `type_id` int UNSIGNED NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `sec_block_first` int UNSIGNED NOT NULL,
  `sec_pass_1st_block` int UNSIGNED NOT NULL,
  `sec_block_second` int UNSIGNED NOT NULL,
  `price_block_first` int UNSIGNED NOT NULL,
  `price_block_second` int UNSIGNED NOT NULL,
  `total_block_first` int UNSIGNED NOT NULL,
  `total_block_second` int UNSIGNED NOT NULL,
  `bill` int UNSIGNED NOT NULL,
  `date_update` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `cdr_user_emailed`
--

CREATE TABLE `cdr_user_emailed` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `recid` int NOT NULL,
  `emailed` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `check`
--

CREATE TABLE `check` (
  `id` int NOT NULL,
  `phone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `config_name` varchar(40) NOT NULL,
  `config_value` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config_field_type`
--

CREATE TABLE `config_field_type` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_input_type`
--

CREATE TABLE `config_input_type` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `size` int NOT NULL,
  `default` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_license_bria`
--

CREATE TABLE `config_license_bria` (
  `id` int NOT NULL,
  `license_key` varchar(100) NOT NULL,
  `number_license` int NOT NULL,
  `used` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `config_license_bria`
--
DELIMITER $$
CREATE TRIGGER `add_license` AFTER INSERT ON `config_license_bria` FOR EACH ROW BEGIN
UPDATE sip_user SET license_key=NEW.license_key WHERE license_id=NEW.id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_license` AFTER UPDATE ON `config_license_bria` FOR EACH ROW BEGIN
IF OLD.license_key<>NEW.license_key THEN
UPDATE sip_user SET license_key=NEW.license_key WHERE license_id=NEW.id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `config_services`
--

CREATE TABLE `config_services` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `max_agent` int NOT NULL,
  `current_agent` int NOT NULL DEFAULT '0',
  `in_number` varchar(20) NOT NULL,
  `local_callerid` varchar(20) NOT NULL,
  `pstn_callerid` varchar(30) NOT NULL,
  `template` varchar(50) NOT NULL,
  `virtual_name` varchar(100) NOT NULL,
  `document_root` varchar(100) NOT NULL,
  `cdr_database` varchar(100) NOT NULL,
  `sync_date` datetime DEFAULT NULL,
  `date_update` datetime NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `active` tinyint NOT NULL,
  `active_time_check` tinyint NOT NULL,
  `time_work` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `out_time_file_record_name` varchar(100) NOT NULL,
  `out_time_file_record_id` int NOT NULL,
  `out_time_queue_id` int NOT NULL,
  `out_time_queue_name` varchar(100) NOT NULL,
  `active_vip_check` tinyint NOT NULL,
  `vip_queue_name` varchar(100) NOT NULL,
  `vip_queue_id` int NOT NULL,
  `welcome_file_recorded` varchar(100) NOT NULL,
  `active_welcome` int NOT NULL,
  `welcome_file_recorded_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `config_services`
--
DELIMITER $$
CREATE TRIGGER `service_add` AFTER INSERT ON `config_services` FOR EACH ROW BEGIN 
UPDATE cdr_bill SET service_id=NEW.id, service_name=NEW.name where  prefix_network =NEW.in_number;
UPDATE sip_user SET service_name=NEW.name WHERE service_id=NEW.id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `service_update` AFTER UPDATE ON `config_services` FOR EACH ROW BEGIN 
UPDATE cdr_bill SET service_name=NEW.name where service_id=NEW.id;
IF(OLD.name <> NEW.name) THEN
UPDATE sip_user SET service_name=NEW.name where service_id=NEW.id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `config_service_dtmf`
--

CREATE TABLE `config_service_dtmf` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `dtmf` varchar(2) NOT NULL,
  `queue_id` int NOT NULL,
  `queue_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_service_survey`
--

CREATE TABLE `config_service_survey` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_name` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint NOT NULL,
  `date_active_from` date NOT NULL,
  `date_active_to` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conf_meetme`
--

CREATE TABLE `conf_meetme` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `confno` varchar(100) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `pin` varchar(20) NOT NULL,
  `opts` varchar(100) NOT NULL,
  `adminpin` varchar(20) NOT NULL,
  `adminopts` varchar(100) NOT NULL,
  `members` int NOT NULL,
  `maxusers` int NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `conf_meetme`
--
DELIMITER $$
CREATE TRIGGER `meetme_add` AFTER INSERT ON `conf_meetme` FOR EACH ROW UPDATE conf_meetme_group a SET total=(select count(*) from conf_meetme b where a.id=b.group_id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `meetme_update` AFTER UPDATE ON `conf_meetme` FOR EACH ROW IF (NEW.group_id<> OLD.group_id) THEN
UPDATE conf_meetme_group a SET total=(select count(*) from conf_meetme b where a.id=b.group_id);
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `conf_meetme_group`
--

CREATE TABLE `conf_meetme_group` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `total` int NOT NULL,
  `ghichu` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `conf_meetme_group`
--
DELIMITER $$
CREATE TRIGGER `group_meet_update` AFTER UPDATE ON `conf_meetme_group` FOR EACH ROW IF (OLD.name <> NEW.name) THEN
UPDATE conf_meetme SET group_name=NEW.name where group_id=NEW.id;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company` varchar(100) NOT NULL,
  `company_add` varchar(100) NOT NULL,
  `agent_name` varchar(20) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `db_log`
--

CREATE TABLE `db_log` (
  `id` bigint NOT NULL,
  `query` text NOT NULL,
  `user_action` varchar(100) NOT NULL,
  `date_update` datetime NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fail_26_10`
--

CREATE TABLE `fail_26_10` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL,
  `realdst` varchar(80) NOT NULL,
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `uniqueid2` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `userfield2` varchar(30) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `queue_event` text NOT NULL,
  `case_id` tinyint NOT NULL,
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_recorded`
--

CREATE TABLE `file_recorded` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `ma` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `idcha_menu` varchar(11) NOT NULL,
  `homepage` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interface`
--

CREATE TABLE `interface` (
  `ma` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ivr_tree`
--

CREATE TABLE `ivr_tree` (
  `ma` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) NOT NULL,
  `para` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_event`
--

CREATE TABLE `log_event` (
  `ma` int NOT NULL,
  `date` datetime NOT NULL,
  `user` varchar(20) NOT NULL,
  `table` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `query` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_tmp`
--

CREATE TABLE `log_tmp` (
  `id` bigint NOT NULL DEFAULT '0',
  `datecall` datetime NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_send` text NOT NULL,
  `status_code` varchar(100) NOT NULL,
  `data_return` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_fields`
--

CREATE TABLE `mapping_fields` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `standard_tel` tinyint NOT NULL,
  `ol_field` varchar(50) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `form_width` tinyint NOT NULL,
  `begin_zero` int NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `synced` tinyint NOT NULL,
  `default_show` int NOT NULL,
  `edit` int NOT NULL,
  `export` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_fields_backup_10_7_2022`
--

CREATE TABLE `mapping_fields_backup_10_7_2022` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `standard_tel` tinyint NOT NULL,
  `ol_field` varchar(50) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `form_width` tinyint NOT NULL,
  `begin_zero` int NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `synced` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_fields_callerid`
--

CREATE TABLE `mapping_fields_callerid` (
  `id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_fields_old`
--

CREATE TABLE `mapping_fields_old` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `standard_tel` tinyint NOT NULL,
  `ol_field` varchar(50) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `form_width` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `synced` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetme`
--

CREATE TABLE `meetme` (
  `bookid` int NOT NULL,
  `confno` char(80) NOT NULL DEFAULT '0',
  `starttime` datetime DEFAULT '1900-01-01 12:00:00',
  `endtime` datetime DEFAULT '2038-01-01 12:00:00',
  `pin` char(20) DEFAULT NULL,
  `adminpin` char(20) DEFAULT NULL,
  `opts` char(20) DEFAULT NULL,
  `adminopts` char(20) DEFAULT NULL,
  `recordingfilename` char(80) DEFAULT NULL,
  `recordingformat` char(10) DEFAULT NULL,
  `maxusers` int DEFAULT NULL,
  `members` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ma` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `idcha` int NOT NULL,
  `label` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `network_prefix`
--

CREATE TABLE `network_prefix` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `type_id` int NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `prefix` varchar(10) NOT NULL,
  `sec_pass_1st_block` int UNSIGNED NOT NULL,
  `sec_block_first` int UNSIGNED NOT NULL,
  `price_block_first` int UNSIGNED NOT NULL,
  `sec_block_second` int UNSIGNED NOT NULL,
  `price_block_second` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `network_prefix`
--
DELIMITER $$
CREATE TRIGGER `addnew` AFTER INSERT ON `network_prefix` FOR EACH ROW BEGIN
UPDATE network_type a set total=(select count(*) from network_prefix b where b.type_id=a.id);
UPDATE prefix_group a set total =(Select count(*) from network_prefix b where b.group_id=a.id); 

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `del` AFTER DELETE ON `network_prefix` FOR EACH ROW BEGIN
UPDATE network_type a set total=(select count(*) from network_prefix b where b.type_id=OLD.type_id);
UPDATE prefix_group a set total =(Select count(*) from network_prefix b where b.group_id=OLD.group_id); 

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `network_prefix` FOR EACH ROW BEGIN
IF OLD.type_id<> NEW.type_id THEN
UPDATE network_type a set total=(select count(*) from network_prefix b where b.type_id=a.id);
END IF;
IF OLD.group_id<> NEW.group_id THEN
UPDATE prefix_group a set total =(Select count(*) from network_prefix b where b.group_id=a.id); 
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `network_type`
--

CREATE TABLE `network_type` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `kyhieu` varchar(30) NOT NULL,
  `sec_pass_1st_block` int UNSIGNED NOT NULL,
  `sec_block_first` int UNSIGNED NOT NULL,
  `sec_block_second` int UNSIGNED NOT NULL,
  `total` int NOT NULL,
  `ghichu` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `network_type`
--
DELIMITER $$
CREATE TRIGGER `update_network_type` AFTER UPDATE ON `network_type` FOR EACH ROW BEGIN 
IF(OLD.sec_pass_1st_block<>NEW.sec_pass_1st_block) ||
(OLD.sec_block_first<>NEW.sec_block_first) ||
(OLD.sec_block_second<>NEW.sec_block_second) THEN

UPDATE network_prefix SET sec_pass_1st_block=NEW.sec_pass_1st_block,
sec_block_first=NEW.sec_block_first,
sec_block_second=NEW.sec_block_second
where type_id=NEW.id;

END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `old_API_Auto_dialer_Queues`
--

CREATE TABLE `old_API_Auto_dialer_Queues` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `precall_ratio` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '\r\n',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'start',
  `active_calls` int NOT NULL,
  `customers_count` int NOT NULL,
  `agents_count` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `old_API_Auto_dialer_Queue_Agent`
--

CREATE TABLE `old_API_Auto_dialer_Queue_Agent` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_flex_status` varchar(80) NOT NULL,
  `last_flex` datetime NOT NULL,
  `agent_total_calls` int NOT NULL,
  `pbx_status` varchar(80) NOT NULL,
  `lastcall` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `old_API_Auto_dialer_Queue_Customers`
--

CREATE TABLE `old_API_Auto_dialer_Queue_Customers` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `order_id` varchar(80) NOT NULL,
  `customer_id` varchar(80) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `agent_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(80) NOT NULL,
  `date` datetime NOT NULL,
  `dialAt` datetime NOT NULL,
  `ringAt` datetime NOT NULL,
  `connectedAt` datetime NOT NULL,
  `hangupAt` datetime NOT NULL,
  `hangup_reason` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pbx_config`
--

CREATE TABLE `pbx_config` (
  `config_name` varchar(40) NOT NULL,
  `config_value` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portal_login_history`
--

CREATE TABLE `portal_login_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `action` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prefix_group`
--

CREATE TABLE `prefix_group` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `kyhieu` varchar(20) NOT NULL,
  `price_block_first` int UNSIGNED NOT NULL,
  `price_block_second` int UNSIGNED NOT NULL,
  `total` int NOT NULL,
  `ghichu` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `prefix_group`
--
DELIMITER $$
CREATE TRIGGER `update_prefix_group` AFTER UPDATE ON `prefix_group` FOR EACH ROW BEGIN 
IF(OLD.price_block_first<>NEW.price_block_first) ||
(OLD.price_block_second<>NEW.price_block_second) THEN
UPDATE network_prefix SET price_block_first=NEW.price_block_first,
price_block_second=NEW.price_block_second
where group_id=NEW.id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queues_users`
--

CREATE TABLE `queues_users` (
  `ma` int NOT NULL,
  `user_id` tinyint NOT NULL,
  `queue_id` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue_abandon_monitor`
--

CREATE TABLE `queue_abandon_monitor` (
  `id` int NOT NULL,
  `queuename` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `callerid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uniqueid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queue_join_log`
--

CREATE TABLE `queue_join_log` (
  `id` int UNSIGNED NOT NULL,
  `queue_name` varchar(30) NOT NULL,
  `callerid` varchar(20) NOT NULL,
  `calldate` datetime NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `update_cdr` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `queue_join_log`
--
DELIMITER $$
CREATE TRIGGER `queue_join_insert` AFTER INSERT ON `queue_join_log` FOR EACH ROW BEGIN
UPDATE queue_table SET status_holdtime=status_holdtime+1 where name=NEW.queue_name;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `queue_join_log_update` AFTER UPDATE ON `queue_join_log` FOR EACH ROW BEGIN
IF(NEW.update_cdr=1) THEN
UPDATE `cdr` set `cdr`.`queue_event`=concat(`queue_event`,'-> ',NEW.queue_name,'(',NEW.`status`,')') where cdr.`uniqueid`=NEW.`uniqueid`;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_join_monitor`
--

CREATE TABLE `queue_join_monitor` (
  `id` int NOT NULL,
  `queuename` varchar(200) NOT NULL,
  `callerid` varchar(20) NOT NULL,
  `uniqueid` varchar(30) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queue_log`
--

CREATE TABLE `queue_log` (
  `id` int NOT NULL,
  `time` datetime NOT NULL,
  `cdr_uniqueid` varchar(32) NOT NULL,
  `callid` varchar(100) NOT NULL,
  `queuename` varchar(200) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `agent_number` int NOT NULL,
  `event` varchar(32) NOT NULL,
  `data` varchar(100) NOT NULL,
  `data1` varchar(100) NOT NULL,
  `data2` varchar(100) NOT NULL,
  `data3` varchar(100) NOT NULL,
  `data4` varchar(100) NOT NULL,
  `data5` varchar(100) NOT NULL,
  `update_cdr` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `queue_log`
--
DELIMITER $$
CREATE TRIGGER `queue_log_insert` AFTER INSERT ON `queue_log` FOR EACH ROW BEGIN 
IF NEW.`event`='RINGNOANSWER' THEN
UPDATE agent_daily_report SET queue_miss_calls=queue_miss_calls+1  WHERE `agent_name` like concat(NEW.agent,' [%') AND queue_name =NEW.queuename AND `date`=DATE(NEW.time) ;
UPDATE queue_member_table SET status_callsmiss=status_callsmiss+1 where membername=NEW.agent;

END IF;
IF (NEW.`event`='COMPLETEAGENT') OR (NEW.`event`='COMPLETECALLER') THEN
UPDATE agent_daily_report SET incoming_calls=incoming_calls+1,total_in_time=total_in_time+NEW.data2, AVG_in_time=total_in_time/incoming_calls 
WHERE `agent_name` like concat(NEW.agent,' [%') AND queue_name =NEW.queuename AND `date`=DATE(NEW.time) ;

UPDATE queue_member_table SET status_callstaken=status_callstaken+1, status_lastcall=NOW() where membername=NEW.agent;

UPDATE queue_table SET status_completed=status_completed+1 where name=NEW.queuename ;

END IF;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_log_newsys`
--

CREATE TABLE `queue_log_newsys` (
  `id` int NOT NULL,
  `time` datetime NOT NULL,
  `cdr_uniqueid` varchar(32) NOT NULL,
  `callid` varchar(100) NOT NULL,
  `queuename` varchar(200) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `event` varchar(32) NOT NULL,
  `data` varchar(100) NOT NULL,
  `data1` varchar(100) NOT NULL,
  `data2` varchar(100) NOT NULL,
  `data3` varchar(100) NOT NULL,
  `data4` varchar(100) NOT NULL,
  `data5` varchar(100) NOT NULL,
  `update_cdr` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `queue_log_newsys`
--
DELIMITER $$
CREATE TRIGGER `queue_log_instert` AFTER INSERT ON `queue_log_newsys` FOR EACH ROW BEGIN 
IF NEW.`event`='RINGNOANSWER' THEN
UPDATE queue_member_table SET unanswer_count=unanswer_count+1 where paused=0 AND membername=NEW.`agent`;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `queue_log_update` AFTER UPDATE ON `queue_log_newsys` FOR EACH ROW BEGIN
IF(NEW.`update_cdr`=1) THEN
IF(NEW.queuename<>'NONE') THEN
	IF(NEW.agent='NONE') THEN
    	update cdr set queue_event=concat(`queue_event`,'-> ',NEW.event,'(',NEW.queuename,')') where `cdr`.`uniqueid`=NEW.`callid`;
	ELSE
    	update cdr set queue_event=concat(`queue_event`,'-> ',NEW.event,'(',NEW.agent,')') where `cdr`.`uniqueid`=NEW.`callid`;
    END IF;
END IF;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_log_temp`
--

CREATE TABLE `queue_log_temp` (
  `id` int NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `cdr_uniqueid` varchar(32) CHARACTER SET latin1 NOT NULL,
  `callid` varchar(100) CHARACTER SET latin1 NOT NULL,
  `queuename` varchar(200) CHARACTER SET latin1 NOT NULL,
  `agent` varchar(100) CHARACTER SET latin1 NOT NULL,
  `event` varchar(32) CHARACTER SET latin1 NOT NULL,
  `data` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data1` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data2` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data3` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data4` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data5` varchar(100) CHARACTER SET latin1 NOT NULL,
  `update_cdr` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queue_member_table`
--

CREATE TABLE `queue_member_table` (
  `uniqueid` int UNSIGNED NOT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `penalty` int DEFAULT NULL,
  `paused` int DEFAULT NULL,
  `unanswer_count` tinyint NOT NULL DEFAULT '0',
  `service_id` int NOT NULL,
  `status_status` varchar(200) NOT NULL,
  `status_lastcall` varchar(200) NOT NULL,
  `status_incall` int NOT NULL,
  `status_callstaken` int NOT NULL,
  `status_callsmiss` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `queue_member_table`
--
DELIMITER $$
CREATE TRIGGER `queue_member_delete` AFTER DELETE ON `queue_member_table` FOR EACH ROW BEGIN
update queue_table a set `total`=(select count(*) from queue_member_table b  where a.name=b.queue_name),total_paused=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.paused=1),total_incall=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.status_incall=1);
IF OLD.service_id=1 THEN
DELETE FROM 4321_monitor WHERE id=OLD.uniqueid;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `queue_member_insert` AFTER INSERT ON `queue_member_table` FOR EACH ROW BEGIN
update queue_table a set `total`=(select count(*) from queue_member_table b  where a.name=b.queue_name),total_paused=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.paused=1), total_incall=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.status_incall=1);

IF NEW.service_id=1 THEN
INSERT IGNORE INTO 4321_monitor SET id=NEW.uniqueid,service_id=NEW.service_id,queue_name=NEW.queue_name,membername=NEW.membername,interface=NEW.interface,penalty=NEW.penalty,paused=NEW.paused;
END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `queue_member_update` AFTER UPDATE ON `queue_member_table` FOR EACH ROW BEGIN
update queue_table a set `total`=(select count(*) from queue_member_table b  where a.name=b.queue_name),total_paused=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.paused=1), total_incall=(select count(*) from queue_member_table b  where a.name=b.queue_name and b.status_incall=1);
IF NEW.service_id=1 THEN
UPDATE 4321_monitor SET membername=NEW.membername, interface=NEW.interface, penalty=NEW.penalty, paused=NEW.paused where id=NEW.uniqueid;
END IF;
IF(NEW.paused!=1) THEN
UPDATE 4321_monitor SET last_login_queue=NOW() where id=NEW.uniqueid;
END IF;
IF(NEW.paused=1) THEN
UPDATE 4321_monitor SET  time_on_queue=time_on_queue+(TIME_TO_SEC(NOW()) - TIME_TO_SEC(last_login_queue))/60 where id=NEW.uniqueid;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_strategy`
--

CREATE TABLE `queue_strategy` (
  `ma` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue_table`
--

CREATE TABLE `queue_table` (
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ma` int NOT NULL,
  `tittle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `monitor_join` tinyint(1) DEFAULT NULL,
  `monitor_format` varchar(128) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_lessthan` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int DEFAULT NULL,
  `announce_round_seconds` int DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `retry` int DEFAULT NULL,
  `wrapuptime` int DEFAULT NULL,
  `maxlen` int DEFAULT '1',
  `servicelevel` int DEFAULT NULL,
  `strategy` varchar(128) DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT 'paused,inuse,ringing',
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `defaultrule` varchar(50) NOT NULL,
  `eventmemberstatus` tinyint(1) DEFAULT '1',
  `eventwhencalled` tinyint(1) DEFAULT '1',
  `reportholdtime` tinyint(1) DEFAULT '0',
  `memberdelay` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `timeoutrestart` tinyint(1) DEFAULT NULL,
  `ringinuse` tinyint(1) DEFAULT '0',
  `setinterfacevar` tinyint(1) DEFAULT NULL,
  `service_id` int NOT NULL,
  `total` tinyint NOT NULL,
  `status_talktime` int NOT NULL,
  `status_calls` int NOT NULL,
  `status_completed` int NOT NULL,
  `status_holdtime` int NOT NULL,
  `status_abandoned` int NOT NULL,
  `total_paused` int NOT NULL,
  `total_incall` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_total_call`
--

CREATE TABLE `report_total_call` (
  `total_incall` bigint NOT NULL DEFAULT '0',
  `total_time_in_call` decimal(32,0) DEFAULT NULL,
  `total_answered` decimal(23,0) DEFAULT NULL,
  `total_time_answered` decimal(32,0) DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_total_call_in`
--

CREATE TABLE `report_total_call_in` (
  `total_incall` bigint NOT NULL DEFAULT '0',
  `total_time_in_call` decimal(32,0) DEFAULT NULL,
  `total_answered` decimal(23,0) DEFAULT NULL,
  `total_time_answered` decimal(32,0) DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ma` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_number` int NOT NULL,
  `max_agent` int NOT NULL,
  `local_callerid` varchar(20) NOT NULL,
  `pstn_callerid` varchar(20) NOT NULL,
  `ghichu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sipuser_ip_trigger`
--

CREATE TABLE `sipuser_ip_trigger` (
  `id` int NOT NULL,
  `ipaddr` varchar(45) NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sip_active`
--

CREATE TABLE `sip_active` (
  `id` int NOT NULL,
  `sip_name` int NOT NULL,
  `date_active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sip_temp`
--

CREATE TABLE `sip_temp` (
  `ma` int NOT NULL DEFAULT '0',
  `name` varchar(80) CHARACTER SET latin1 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sip_user`
--

CREATE TABLE `sip_user` (
  `ma` int NOT NULL,
  `old_id` int NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `nhansuID` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `active_forward` tinyint NOT NULL DEFAULT '0',
  `context` varchar(80) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib','unavailable') DEFAULT 'allowed_not_screened',
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT NULL,
  `remotesecret` varchar(250) DEFAULT NULL,
  `transport` enum('tcp','udp','tcp,udp') DEFAULT NULL,
  `host` varchar(31) NOT NULL DEFAULT 'dynamic',
  `nat` varchar(5) NOT NULL DEFAULT 'no',
  `type` enum('user','peer','friend') NOT NULL DEFAULT 'friend',
  `accountcode` varchar(20) DEFAULT NULL,
  `amaflags` varchar(13) DEFAULT NULL,
  `call-limit` varchar(3) NOT NULL DEFAULT '1',
  `callgroup` varchar(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `defaultip` varchar(15) DEFAULT NULL,
  `dtmfmode` varchar(7) DEFAULT NULL,
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `insecure` varchar(4) DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `pickupgroup` varchar(10) DEFAULT NULL,
  `qualify` char(3) DEFAULT NULL,
  `regexten` varchar(80) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'ulaw,alaw,g729',
  `fullcontact` varchar(80) NOT NULL DEFAULT '',
  `ipaddr` varchar(45) NOT NULL,
  `computername` varchar(100) NOT NULL,
  `port` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `defaultuser` varchar(80) NOT NULL DEFAULT '',
  `subscribecontext` varchar(80) DEFAULT NULL,
  `directmedia` enum('yes','no') DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('never','yes','no') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int UNSIGNED DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT 'yes',
  `allowsubscribe` enum('yes','no') DEFAULT 'yes',
  `allowtransfer` enum('yes','no') DEFAULT 'yes',
  `ignoresdpversion` enum('yes','no') DEFAULT 'no',
  `template` varchar(100) DEFAULT NULL,
  `videosupport` enum('yes','no','always') DEFAULT 'no',
  `maxcallbitrate` int UNSIGNED DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT 'yes',
  `session-timers` enum('originate','accept','refuse') DEFAULT 'accept',
  `session-expires` int UNSIGNED DEFAULT '1800',
  `session-minse` int UNSIGNED DEFAULT '90',
  `session-refresher` enum('uac','uas') DEFAULT 'uas',
  `t38pt_usertpsource` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(250) DEFAULT NULL,
  `callbackextension` varchar(250) DEFAULT NULL,
  `registertrying` enum('yes','no') DEFAULT 'yes',
  `timert1` int UNSIGNED DEFAULT '500',
  `timerb` int UNSIGNED DEFAULT NULL,
  `qualifyfreq` int UNSIGNED DEFAULT '120',
  `contactpermit` varchar(250) DEFAULT NULL,
  `contactdeny` varchar(250) DEFAULT NULL,
  `lastms` int NOT NULL,
  `regserver` varchar(100) NOT NULL DEFAULT '',
  `regseconds` int NOT NULL DEFAULT '0',
  `useragent` varchar(50) NOT NULL DEFAULT '',
  `service_id` int NOT NULL DEFAULT '0',
  `service_name` varchar(100) NOT NULL,
  `license_id` int NOT NULL,
  `license_key` varchar(50) NOT NULL,
  `date_update` datetime NOT NULL,
  `passlogin_portal` varchar(50) NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_leader` tinyint NOT NULL,
  `header` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Triggers `sip_user`
--
DELIMITER $$
CREATE TRIGGER `sipuser_after_update` AFTER UPDATE ON `sip_user` FOR EACH ROW BEGIN 
INSERT IGNORE into sipuser_ip_trigger set ipaddr=NEW.ipaddr, service_id=NEW.service_id, name=new.name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sip_user_backup`
--

CREATE TABLE `sip_user_backup` (
  `ma` int NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `active_forward` tinyint NOT NULL DEFAULT '0',
  `context` varchar(80) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib','unavailable') DEFAULT 'allowed_not_screened',
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT NULL,
  `remotesecret` varchar(250) DEFAULT NULL,
  `transport` enum('tcp','udp','tcp,udp') DEFAULT NULL,
  `host` varchar(31) NOT NULL DEFAULT 'dynamic',
  `nat` varchar(5) NOT NULL DEFAULT 'no',
  `type` enum('user','peer','friend') NOT NULL DEFAULT 'friend',
  `accountcode` varchar(20) DEFAULT NULL,
  `amaflags` varchar(13) DEFAULT NULL,
  `call-limit` varchar(3) NOT NULL DEFAULT '1',
  `callgroup` varchar(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `defaultip` varchar(15) DEFAULT NULL,
  `dtmfmode` varchar(7) DEFAULT NULL,
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `insecure` varchar(4) DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `pickupgroup` varchar(10) DEFAULT NULL,
  `qualify` char(3) DEFAULT NULL,
  `regexten` varchar(80) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'ulaw,alaw',
  `fullcontact` varchar(80) NOT NULL DEFAULT '',
  `ipaddr` varchar(45) NOT NULL,
  `computername` varchar(100) NOT NULL,
  `port` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `defaultuser` varchar(80) NOT NULL DEFAULT '',
  `subscribecontext` varchar(80) DEFAULT NULL,
  `directmedia` enum('yes','no') DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('never','yes','no') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int UNSIGNED DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT 'yes',
  `allowsubscribe` enum('yes','no') DEFAULT 'yes',
  `allowtransfer` enum('yes','no') DEFAULT 'yes',
  `ignoresdpversion` enum('yes','no') DEFAULT 'no',
  `template` varchar(100) DEFAULT NULL,
  `videosupport` enum('yes','no','always') DEFAULT 'no',
  `maxcallbitrate` int UNSIGNED DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT 'yes',
  `session-timers` enum('originate','accept','refuse') DEFAULT 'accept',
  `session-expires` int UNSIGNED DEFAULT '1800',
  `session-minse` int UNSIGNED DEFAULT '90',
  `session-refresher` enum('uac','uas') DEFAULT 'uas',
  `t38pt_usertpsource` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(250) DEFAULT NULL,
  `callbackextension` varchar(250) DEFAULT NULL,
  `registertrying` enum('yes','no') DEFAULT 'yes',
  `timert1` int UNSIGNED DEFAULT '500',
  `timerb` int UNSIGNED DEFAULT NULL,
  `qualifyfreq` int UNSIGNED DEFAULT '120',
  `contactpermit` varchar(250) DEFAULT NULL,
  `contactdeny` varchar(250) DEFAULT NULL,
  `lastms` int NOT NULL,
  `regserver` varchar(100) NOT NULL DEFAULT '',
  `regseconds` int NOT NULL DEFAULT '0',
  `useragent` varchar(50) NOT NULL DEFAULT '',
  `service_id` int NOT NULL DEFAULT '0',
  `service_name` varchar(100) NOT NULL,
  `license_id` int NOT NULL,
  `license_key` varchar(50) NOT NULL,
  `date_update` datetime NOT NULL,
  `passlogin_portal` varchar(50) NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) NOT NULL,
  `is_leader` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `system_crontab`
--

CREATE TABLE `system_crontab` (
  `id` int NOT NULL,
  `minute` varchar(2) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `daym` varchar(4) NOT NULL,
  `month` varchar(2) NOT NULL,
  `dayw` varchar(2) NOT NULL,
  `script` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_mapping`
--

CREATE TABLE `temp_mapping` (
  `service_id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `standard_tel` tinyint NOT NULL,
  `ol_field` varchar(50) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `form_width` tinyint NOT NULL,
  `begin_zero` int NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `synced` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `url`
--

CREATE TABLE `url` (
  `ma` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `services` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profile_image` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'image/avtar.png',
  `extension` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loggedin` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `last_login_date` datetime NOT NULL,
  `last_logout_date` datetime NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `header` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ma` int NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homepage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'index.php',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint NOT NULL,
  `staff_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_end` date NOT NULL,
  `default_status` tinyint NOT NULL,
  `group` int NOT NULL DEFAULT '1',
  `must_change_pass` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_queues`
--

CREATE TABLE `users_queues` (
  `ma` int NOT NULL,
  `user_id` tinyint NOT NULL,
  `queue_id` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_city`
--

CREATE TABLE `user_city` (
  `ma` int NOT NULL,
  `user_id` int NOT NULL,
  `city_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_function`
--

CREATE TABLE `user_function` (
  `ma` int NOT NULL,
  `user_id` int NOT NULL,
  `function_id` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ky_hieu` varchar(20) NOT NULL,
  `header` varchar(100) NOT NULL,
  `services` varchar(100) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `total` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `user_group`
--
DELIMITER $$
CREATE TRIGGER `user_group_update` AFTER UPDATE ON `user_group` FOR EACH ROW update `user` set group_name=NEW.`name`, services=NEW.`services` where group_id=NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `logid` int NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL,
  `agent` int NOT NULL,
  `userfield` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `user_log`
--
DELIMITER $$
CREATE TRIGGER `user_log_insert` AFTER INSERT ON `user_log` FOR EACH ROW IF NEW.login_time<>'0000-00-00 00:00:00' THEN 
UPDATE queue_member_table SET unanswer_count=0 WHERE interface like CONCAT('%', NEW.agent, '%');
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `userlog_update` AFTER UPDATE ON `user_log` FOR EACH ROW IF NEW.login_time<>'0000-00-00 00:00:00' THEN 
UPDATE queue_member_table SET unanswer_count=0 WHERE interface like CONCAT('%', NEW.agent, '%');
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_queue`
--

CREATE TABLE `user_queue` (
  `ma` int NOT NULL,
  `user_id` int NOT NULL,
  `queue_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(200) NOT NULL,
  `ky_hieu` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `total` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `user_role`
--
DELIMITER $$
CREATE TRIGGER `user_role_update` AFTER UPDATE ON `user_role` FOR EACH ROW UPDATE `user` SET `role_name`=NEW.name, `path`=NEW.path where `role_id`=NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_service`
--

CREATE TABLE `user_service` (
  `ma` int NOT NULL,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_79` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_145`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_145` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_146`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_146` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_147`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_147` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_148`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_148` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_149`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_149` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_151`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_151` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_175`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_175` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_176`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_176` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_agent_by_result_5_user_177`
-- (See below for the actual view)
--
CREATE TABLE `view_agent_by_result_5_user_177` (
`agent_group_id` int
,`agent_group_name` varchar(100)
,`agent_id` int
,`agent_name` varchar(100)
,`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`contacts` decimal(32,0)
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5` (
`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`date` date
,`total_1` decimal(32,0)
,`total_10` decimal(32,0)
,`total_11` decimal(32,0)
,`total_12` decimal(32,0)
,`total_13` decimal(32,0)
,`total_14` decimal(32,0)
,`total_143` decimal(32,0)
,`total_15` decimal(32,0)
,`total_2` decimal(32,0)
,`total_22` decimal(32,0)
,`total_28` decimal(32,0)
,`total_29` decimal(32,0)
,`total_3` decimal(32,0)
,`total_31` decimal(32,0)
,`total_32` decimal(32,0)
,`total_33` decimal(32,0)
,`total_34` decimal(32,0)
,`total_35` decimal(32,0)
,`total_36` decimal(32,0)
,`total_37` decimal(32,0)
,`total_38` decimal(32,0)
,`total_39` decimal(32,0)
,`total_4` decimal(32,0)
,`total_5` decimal(32,0)
,`total_6` decimal(32,0)
,`total_7` decimal(32,0)
,`total_8` decimal(32,0)
,`total_9` decimal(32,0)
,`total_contacted` decimal(32,0)
,`total_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_79` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_145`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_145` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_147`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_147` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_148`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_148` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_149`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_149` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_151`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_151` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_175`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_175` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_176`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_176` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_campaign_by_result_5_user_177`
-- (See below for the actual view)
--
CREATE TABLE `view_campaign_by_result_5_user_177` (
`campaign_group_id` int
,`campaign_group_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(200)
,`campaign_total_contact` int
,`t_1` decimal(32,0)
,`t_10` decimal(32,0)
,`t_11` decimal(32,0)
,`t_12` decimal(32,0)
,`t_13` decimal(32,0)
,`t_14` decimal(32,0)
,`t_143` decimal(32,0)
,`t_15` decimal(32,0)
,`t_2` decimal(32,0)
,`t_22` decimal(32,0)
,`t_28` decimal(32,0)
,`t_29` decimal(32,0)
,`t_3` decimal(32,0)
,`t_31` decimal(32,0)
,`t_32` decimal(32,0)
,`t_33` decimal(32,0)
,`t_34` decimal(32,0)
,`t_35` decimal(32,0)
,`t_36` decimal(32,0)
,`t_37` decimal(32,0)
,`t_38` decimal(32,0)
,`t_39` decimal(32,0)
,`t_4` decimal(32,0)
,`t_5` decimal(32,0)
,`t_6` decimal(32,0)
,`t_7` decimal(32,0)
,`t_8` decimal(32,0)
,`t_9` decimal(32,0)
,`t_contacted` decimal(32,0)
,`t_UTC` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,1_user_194`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,1_user_194` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,1_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,1_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,1_user_336`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,1_user_336` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,7_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,7_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,11_user_161`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,11_user_161` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,11_user_162`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,11_user_162` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,11_user_295`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,11_user_295` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,23,40,41,42_user_87`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,23,40,41,42_user_87` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,23,40,41,42_user_309`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,23,40,41,42_user_309` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,23,40,41,42_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,23,40,41,42_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,23,40,41_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,23,40,41_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,23_user_309`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,23_user_309` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_300`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_300` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,38,39,4_user_300`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_,28,29,30,31,32,33,34,35,36,38,39,4_user_300` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1,_user_138`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1,_user_138` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1,_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1,_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_2`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_2` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_76`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_76` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_137`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_137` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_138`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_138` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_140`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_140` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_141`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_141` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_142`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_142` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_143`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_143` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_194`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_194` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_332`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_332` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_335`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_335` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_336`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_336` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_1_user_355`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_1_user_355` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_84`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_84` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_86`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_86` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_87`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_87` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_280`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_280` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_299`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_299` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_323`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_323` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_331`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_331` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_338`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_338` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_2_user_341`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_2_user_341` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_300`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_300` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_301`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_301` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_304`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_304` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_305`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_305` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_307`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_307` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_4_user_329`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_4_user_329` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7,_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7,_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_2`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_2` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_76`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_76` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_111`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_111` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_120`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_120` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_122`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_122` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_124`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_124` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_152`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_152` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_163`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_163` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_7_user_355`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_7_user_355` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_8_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_8_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_9_user_2`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_9_user_2` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_10_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_10_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_10_user_164`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_10_user_164` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_10_user_290`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_10_user_290` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_10_user_299`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_10_user_299` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_10_user_342`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_10_user_342` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_126`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_126` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_131`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_131` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_136`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_136` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_161`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_161` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_162`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_162` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_294`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_294` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_295`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_295` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_337`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_337` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_346`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_346` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_11_user_347`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_11_user_347` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_15_user_2`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_15_user_2` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_15_user_59`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_15_user_59` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_15_user_66`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_15_user_66` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_15_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_15_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_15_user_76`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_15_user_76` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_17_user_355`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_17_user_355` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23,40,41,42,2,_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23,40,41,42,2,_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23,40,41,42,43,_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23,40,41,42,43,_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23,40,41,42,_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23,40,41,42,_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23,40,41,42,_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23,40,41,42,_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_76`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_76` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_79`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_79` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_309`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_309` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_323`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_323` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_341`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_341` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_23_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_23_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_27_user_356`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_27_user_356` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_300`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_300` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_307`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_307` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_313`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_313` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_314`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_314` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_317`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_317` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_318`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_318` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_319`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_319` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_320`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_320` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_326`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_326` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_328`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_328` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_330`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_330` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_28_user_370`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_28_user_370` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_29_user_313`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_29_user_313` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_29_user_326`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_29_user_326` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_33_user_313`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_33_user_313` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_33_user_320`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_33_user_320` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_34_user_320`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_34_user_320` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_35_user_317`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_35_user_317` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_36_user_313`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_36_user_313` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_36_user_314`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_36_user_314` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_40_user_73`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_40_user_73` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_40_user_309`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_40_user_309` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_40_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_40_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_40_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_40_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_41_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_41_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_41_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_41_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_42_user_76`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_42_user_76` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_42_user_309`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_42_user_309` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_42_user_334`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_42_user_334` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_login_report_42_user_343`
-- (See below for the actual view)
--
CREATE TABLE `view_login_report_42_user_343` (
`agent` int
,`login_time` datetime
,`logout_time` datetime
,`total` bigint
,`userfield` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `vip_list`
--

CREATE TABLE `vip_list` (
  `id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_79`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_79`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/09/26 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/09/26 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_145`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_145`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_145`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/06 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/06 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_146`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_146`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_146`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/25 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/25 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_147`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_147`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_147`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/08 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/08 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_148`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_148`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_148`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/09/30 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/09/30 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_149`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_149`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_149`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/01 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/01 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_151`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_151`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_151`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/25 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/25 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_175`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_175`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_175`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/08/10 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/08/10 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_176`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_176`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_176`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/07/20 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/07/20 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_agent_by_result_5_user_177`
--
DROP TABLE IF EXISTS `view_agent_by_result_5_user_177`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_agent_by_result_5_user_177`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`agent_id` AS `agent_id`, `callout_report_summary_daily__5`.`agent_name` AS `agent_name`, `callout_report_summary_daily__5`.`agent_group_id` AS `agent_group_id`, `callout_report_summary_daily__5`.`agent_group_name` AS `agent_group_name`, sum(`callout_report_summary_daily__5`.`agent_total_contact`) AS `contacts`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/08/11 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/08/11 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id`, `callout_report_summary_daily__5`.`agent_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5`  AS SELECT `callout_report_summary_daily__5`.`date` AS `date`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `total_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `total_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `total_1`, sum(`callout_report_summary_daily__5`.`2`) AS `total_2`, sum(`callout_report_summary_daily__5`.`3`) AS `total_3`, sum(`callout_report_summary_daily__5`.`4`) AS `total_4`, sum(`callout_report_summary_daily__5`.`5`) AS `total_5`, sum(`callout_report_summary_daily__5`.`6`) AS `total_6`, sum(`callout_report_summary_daily__5`.`7`) AS `total_7`, sum(`callout_report_summary_daily__5`.`8`) AS `total_8`, sum(`callout_report_summary_daily__5`.`9`) AS `total_9`, sum(`callout_report_summary_daily__5`.`10`) AS `total_10`, sum(`callout_report_summary_daily__5`.`11`) AS `total_11`, sum(`callout_report_summary_daily__5`.`12`) AS `total_12`, sum(`callout_report_summary_daily__5`.`13`) AS `total_13`, sum(`callout_report_summary_daily__5`.`14`) AS `total_14`, sum(`callout_report_summary_daily__5`.`15`) AS `total_15`, sum(`callout_report_summary_daily__5`.`22`) AS `total_22`, sum(`callout_report_summary_daily__5`.`28`) AS `total_28`, sum(`callout_report_summary_daily__5`.`29`) AS `total_29`, sum(`callout_report_summary_daily__5`.`31`) AS `total_31`, sum(`callout_report_summary_daily__5`.`32`) AS `total_32`, sum(`callout_report_summary_daily__5`.`33`) AS `total_33`, sum(`callout_report_summary_daily__5`.`34`) AS `total_34`, sum(`callout_report_summary_daily__5`.`35`) AS `total_35`, sum(`callout_report_summary_daily__5`.`36`) AS `total_36`, sum(`callout_report_summary_daily__5`.`37`) AS `total_37`, sum(`callout_report_summary_daily__5`.`38`) AS `total_38`, sum(`callout_report_summary_daily__5`.`39`) AS `total_39`, sum(`callout_report_summary_daily__5`.`143`) AS `total_143` FROM `callout_report_summary_daily__5` WHERE (`callout_report_summary_daily__5`.`date` >= '2021-09-25') GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_79`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_79`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/09/01 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/09/26 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_145`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_145`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_145`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/12/04 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/12/04 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_147`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_147`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_147`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/09/30 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/09/30 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_148`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_148`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_148`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/09/30 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/09/30 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_149`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_149`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_149`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/01 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/01 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_151`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_151`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_151`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2021/11/25 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2021/11/25 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_175`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_175`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_175`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/08/04 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/08/04 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_176`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_176`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_176`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/07/20 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/07/20 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_campaign_by_result_5_user_177`
--
DROP TABLE IF EXISTS `view_campaign_by_result_5_user_177`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_campaign_by_result_5_user_177`  AS SELECT `callout_report_summary_daily__5`.`campaign_group_id` AS `campaign_group_id`, `callout_report_summary_daily__5`.`campaign_group_name` AS `campaign_group_name`, `callout_report_summary_daily__5`.`campaign_id` AS `campaign_id`, `callout_report_summary_daily__5`.`campaign_name` AS `campaign_name`, `callout_report_summary_daily__5`.`campaign_total_contact` AS `campaign_total_contact`, sum(`callout_report_summary_daily__5`.`contacted`) AS `t_contacted`, sum(`callout_report_summary_daily__5`.`UTC`) AS `t_UTC`, sum(`callout_report_summary_daily__5`.`1`) AS `t_1`, sum(`callout_report_summary_daily__5`.`2`) AS `t_2`, sum(`callout_report_summary_daily__5`.`3`) AS `t_3`, sum(`callout_report_summary_daily__5`.`4`) AS `t_4`, sum(`callout_report_summary_daily__5`.`5`) AS `t_5`, sum(`callout_report_summary_daily__5`.`6`) AS `t_6`, sum(`callout_report_summary_daily__5`.`7`) AS `t_7`, sum(`callout_report_summary_daily__5`.`8`) AS `t_8`, sum(`callout_report_summary_daily__5`.`9`) AS `t_9`, sum(`callout_report_summary_daily__5`.`10`) AS `t_10`, sum(`callout_report_summary_daily__5`.`11`) AS `t_11`, sum(`callout_report_summary_daily__5`.`12`) AS `t_12`, sum(`callout_report_summary_daily__5`.`13`) AS `t_13`, sum(`callout_report_summary_daily__5`.`14`) AS `t_14`, sum(`callout_report_summary_daily__5`.`15`) AS `t_15`, sum(`callout_report_summary_daily__5`.`22`) AS `t_22`, sum(`callout_report_summary_daily__5`.`28`) AS `t_28`, sum(`callout_report_summary_daily__5`.`29`) AS `t_29`, sum(`callout_report_summary_daily__5`.`31`) AS `t_31`, sum(`callout_report_summary_daily__5`.`32`) AS `t_32`, sum(`callout_report_summary_daily__5`.`33`) AS `t_33`, sum(`callout_report_summary_daily__5`.`34`) AS `t_34`, sum(`callout_report_summary_daily__5`.`35`) AS `t_35`, sum(`callout_report_summary_daily__5`.`36`) AS `t_36`, sum(`callout_report_summary_daily__5`.`37`) AS `t_37`, sum(`callout_report_summary_daily__5`.`38`) AS `t_38`, sum(`callout_report_summary_daily__5`.`39`) AS `t_39`, sum(`callout_report_summary_daily__5`.`143`) AS `t_143` FROM `callout_report_summary_daily__5` WHERE ((`callout_report_summary_daily__5`.`date` >= '2022/07/01 00:00:00') AND (`callout_report_summary_daily__5`.`date` <= '2022/07/22 23:59:59') AND (0 <> 1)) GROUP BY `callout_report_summary_daily__5`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,1_user_194`
--
DROP TABLE IF EXISTS `view_login_report_,1_user_194`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,1_user_194`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,1_user_334`
--
DROP TABLE IF EXISTS `view_login_report_,1_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,1_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,1_user_336`
--
DROP TABLE IF EXISTS `view_login_report_,1_user_336`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,1_user_336`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,7_user_334`
--
DROP TABLE IF EXISTS `view_login_report_,7_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,7_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,11_user_161`
--
DROP TABLE IF EXISTS `view_login_report_,11_user_161`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,11_user_161`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,11_user_162`
--
DROP TABLE IF EXISTS `view_login_report_,11_user_162`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,11_user_162`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,11_user_295`
--
DROP TABLE IF EXISTS `view_login_report_,11_user_295`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,11_user_295`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,23,40,41,42_user_87`
--
DROP TABLE IF EXISTS `view_login_report_,23,40,41,42_user_87`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,23,40,41,42_user_87`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,23,40,41,42_user_309`
--
DROP TABLE IF EXISTS `view_login_report_,23,40,41,42_user_309`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,23,40,41,42_user_309`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,23,40,41,42_user_343`
--
DROP TABLE IF EXISTS `view_login_report_,23,40,41,42_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,23,40,41,42_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,23,40,41_user_334`
--
DROP TABLE IF EXISTS `view_login_report_,23,40,41_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,23,40,41_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,23_user_309`
--
DROP TABLE IF EXISTS `view_login_report_,23_user_309`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,23_user_309`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_79`
--
DROP TABLE IF EXISTS `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_300`
--
DROP TABLE IF EXISTS `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_300`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,28,29,30,31,32,33,34,35,36,4_user_300`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_,28,29,30,31,32,33,34,35,36,38,39,4_user_300`
--
DROP TABLE IF EXISTS `view_login_report_,28,29,30,31,32,33,34,35,36,38,39,4_user_300`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_,28,29,30,31,32,33,34,35,36,38,39,4_user_300`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1,_user_138`
--
DROP TABLE IF EXISTS `view_login_report_1,_user_138`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1,_user_138`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (4321,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1,_user_334`
--
DROP TABLE IF EXISTS `view_login_report_1,_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1,_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (4321,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_2`
--
DROP TABLE IF EXISTS `view_login_report_1_user_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_2`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_73`
--
DROP TABLE IF EXISTS `view_login_report_1_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_76`
--
DROP TABLE IF EXISTS `view_login_report_1_user_76`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_76`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_79`
--
DROP TABLE IF EXISTS `view_login_report_1_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_137`
--
DROP TABLE IF EXISTS `view_login_report_1_user_137`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_137`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_138`
--
DROP TABLE IF EXISTS `view_login_report_1_user_138`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_138`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_140`
--
DROP TABLE IF EXISTS `view_login_report_1_user_140`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_140`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_141`
--
DROP TABLE IF EXISTS `view_login_report_1_user_141`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_141`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_142`
--
DROP TABLE IF EXISTS `view_login_report_1_user_142`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_142`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_143`
--
DROP TABLE IF EXISTS `view_login_report_1_user_143`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_143`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_194`
--
DROP TABLE IF EXISTS `view_login_report_1_user_194`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_194`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_332`
--
DROP TABLE IF EXISTS `view_login_report_1_user_332`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_332`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_334`
--
DROP TABLE IF EXISTS `view_login_report_1_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_335`
--
DROP TABLE IF EXISTS `view_login_report_1_user_335`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_335`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_336`
--
DROP TABLE IF EXISTS `view_login_report_1_user_336`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_336`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_1_user_355`
--
DROP TABLE IF EXISTS `view_login_report_1_user_355`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_1_user_355`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '4321') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_73`
--
DROP TABLE IF EXISTS `view_login_report_2_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_79`
--
DROP TABLE IF EXISTS `view_login_report_2_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_84`
--
DROP TABLE IF EXISTS `view_login_report_2_user_84`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_84`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_86`
--
DROP TABLE IF EXISTS `view_login_report_2_user_86`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_86`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_87`
--
DROP TABLE IF EXISTS `view_login_report_2_user_87`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_87`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_280`
--
DROP TABLE IF EXISTS `view_login_report_2_user_280`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_280`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_299`
--
DROP TABLE IF EXISTS `view_login_report_2_user_299`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_299`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_323`
--
DROP TABLE IF EXISTS `view_login_report_2_user_323`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_323`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_331`
--
DROP TABLE IF EXISTS `view_login_report_2_user_331`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_331`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_338`
--
DROP TABLE IF EXISTS `view_login_report_2_user_338`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_338`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_2_user_341`
--
DROP TABLE IF EXISTS `view_login_report_2_user_341`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_2_user_341`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_300`
--
DROP TABLE IF EXISTS `view_login_report_4_user_300`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_300`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_301`
--
DROP TABLE IF EXISTS `view_login_report_4_user_301`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_301`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_304`
--
DROP TABLE IF EXISTS `view_login_report_4_user_304`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_304`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_305`
--
DROP TABLE IF EXISTS `view_login_report_4_user_305`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_305`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_307`
--
DROP TABLE IF EXISTS `view_login_report_4_user_307`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_307`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_4_user_329`
--
DROP TABLE IF EXISTS `view_login_report_4_user_329`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_4_user_329`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5566') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7,_user_334`
--
DROP TABLE IF EXISTS `view_login_report_7,_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7,_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (5568,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_2`
--
DROP TABLE IF EXISTS `view_login_report_7_user_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_2`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_73`
--
DROP TABLE IF EXISTS `view_login_report_7_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_76`
--
DROP TABLE IF EXISTS `view_login_report_7_user_76`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_76`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_79`
--
DROP TABLE IF EXISTS `view_login_report_7_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_111`
--
DROP TABLE IF EXISTS `view_login_report_7_user_111`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_111`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_120`
--
DROP TABLE IF EXISTS `view_login_report_7_user_120`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_120`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_122`
--
DROP TABLE IF EXISTS `view_login_report_7_user_122`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_122`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_124`
--
DROP TABLE IF EXISTS `view_login_report_7_user_124`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_124`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_152`
--
DROP TABLE IF EXISTS `view_login_report_7_user_152`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_152`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_163`
--
DROP TABLE IF EXISTS `view_login_report_7_user_163`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_163`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_334`
--
DROP TABLE IF EXISTS `view_login_report_7_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_7_user_355`
--
DROP TABLE IF EXISTS `view_login_report_7_user_355`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_7_user_355`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5568') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_8_user_73`
--
DROP TABLE IF EXISTS `view_login_report_8_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_8_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '1113') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_9_user_2`
--
DROP TABLE IF EXISTS `view_login_report_9_user_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_9_user_2`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (0 <> 1) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_10_user_79`
--
DROP TABLE IF EXISTS `view_login_report_10_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_10_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9928') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_10_user_164`
--
DROP TABLE IF EXISTS `view_login_report_10_user_164`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_10_user_164`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9928') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_10_user_290`
--
DROP TABLE IF EXISTS `view_login_report_10_user_290`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_10_user_290`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9928') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_10_user_299`
--
DROP TABLE IF EXISTS `view_login_report_10_user_299`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_10_user_299`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9928') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_10_user_342`
--
DROP TABLE IF EXISTS `view_login_report_10_user_342`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_10_user_342`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9928') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_73`
--
DROP TABLE IF EXISTS `view_login_report_11_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_126`
--
DROP TABLE IF EXISTS `view_login_report_11_user_126`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_126`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_131`
--
DROP TABLE IF EXISTS `view_login_report_11_user_131`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_131`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_136`
--
DROP TABLE IF EXISTS `view_login_report_11_user_136`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_136`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_161`
--
DROP TABLE IF EXISTS `view_login_report_11_user_161`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_161`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_162`
--
DROP TABLE IF EXISTS `view_login_report_11_user_162`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_162`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_294`
--
DROP TABLE IF EXISTS `view_login_report_11_user_294`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_294`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_295`
--
DROP TABLE IF EXISTS `view_login_report_11_user_295`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_295`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_337`
--
DROP TABLE IF EXISTS `view_login_report_11_user_337`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_337`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_346`
--
DROP TABLE IF EXISTS `view_login_report_11_user_346`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_346`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_11_user_347`
--
DROP TABLE IF EXISTS `view_login_report_11_user_347`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_11_user_347`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '9929') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_15_user_2`
--
DROP TABLE IF EXISTS `view_login_report_15_user_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_15_user_2`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '6788') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_15_user_59`
--
DROP TABLE IF EXISTS `view_login_report_15_user_59`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_15_user_59`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '6788') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_15_user_66`
--
DROP TABLE IF EXISTS `view_login_report_15_user_66`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_15_user_66`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '6788') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_15_user_73`
--
DROP TABLE IF EXISTS `view_login_report_15_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_15_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '6788') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_15_user_76`
--
DROP TABLE IF EXISTS `view_login_report_15_user_76`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_15_user_76`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '6788') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_17_user_355`
--
DROP TABLE IF EXISTS `view_login_report_17_user_355`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_17_user_355`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '1900') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23,40,41,42,2,_user_334`
--
DROP TABLE IF EXISTS `view_login_report_23,40,41,42,2,_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23,40,41,42,2,_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (20266,20286,20287,20288,2900,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23,40,41,42,43,_user_334`
--
DROP TABLE IF EXISTS `view_login_report_23,40,41,42,43,_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23,40,41,42,43,_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (20266,20286,20287,20288,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23,40,41,42,_user_334`
--
DROP TABLE IF EXISTS `view_login_report_23,40,41,42,_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23,40,41,42,_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (20266,20286,20287,20288,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23,40,41,42,_user_343`
--
DROP TABLE IF EXISTS `view_login_report_23,40,41,42,_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23,40,41,42,_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` in (20266,20286,20287,20288,0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_73`
--
DROP TABLE IF EXISTS `view_login_report_23_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20266') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_76`
--
DROP TABLE IF EXISTS `view_login_report_23_user_76`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_76`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20266') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_79`
--
DROP TABLE IF EXISTS `view_login_report_23_user_79`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_79`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2901') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_309`
--
DROP TABLE IF EXISTS `view_login_report_23_user_309`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_309`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_323`
--
DROP TABLE IF EXISTS `view_login_report_23_user_323`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_323`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20266') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_334`
--
DROP TABLE IF EXISTS `view_login_report_23_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_341`
--
DROP TABLE IF EXISTS `view_login_report_23_user_341`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_341`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20266') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_23_user_343`
--
DROP TABLE IF EXISTS `view_login_report_23_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_23_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_27_user_356`
--
DROP TABLE IF EXISTS `view_login_report_27_user_356`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_27_user_356`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '2904') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_300`
--
DROP TABLE IF EXISTS `view_login_report_28_user_300`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_300`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_307`
--
DROP TABLE IF EXISTS `view_login_report_28_user_307`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_307`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_313`
--
DROP TABLE IF EXISTS `view_login_report_28_user_313`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_313`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_314`
--
DROP TABLE IF EXISTS `view_login_report_28_user_314`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_314`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_317`
--
DROP TABLE IF EXISTS `view_login_report_28_user_317`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_317`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_318`
--
DROP TABLE IF EXISTS `view_login_report_28_user_318`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_318`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_319`
--
DROP TABLE IF EXISTS `view_login_report_28_user_319`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_319`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_320`
--
DROP TABLE IF EXISTS `view_login_report_28_user_320`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_320`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_326`
--
DROP TABLE IF EXISTS `view_login_report_28_user_326`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_326`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_328`
--
DROP TABLE IF EXISTS `view_login_report_28_user_328`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_328`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_330`
--
DROP TABLE IF EXISTS `view_login_report_28_user_330`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_330`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_334`
--
DROP TABLE IF EXISTS `view_login_report_28_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_28_user_370`
--
DROP TABLE IF EXISTS `view_login_report_28_user_370`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_28_user_370`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5500') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_29_user_313`
--
DROP TABLE IF EXISTS `view_login_report_29_user_313`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_29_user_313`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5501') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_29_user_326`
--
DROP TABLE IF EXISTS `view_login_report_29_user_326`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_29_user_326`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5501') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_33_user_313`
--
DROP TABLE IF EXISTS `view_login_report_33_user_313`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_33_user_313`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5505') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_33_user_320`
--
DROP TABLE IF EXISTS `view_login_report_33_user_320`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_33_user_320`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5505') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_34_user_320`
--
DROP TABLE IF EXISTS `view_login_report_34_user_320`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_34_user_320`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5506') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_35_user_317`
--
DROP TABLE IF EXISTS `view_login_report_35_user_317`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_35_user_317`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5507') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_36_user_313`
--
DROP TABLE IF EXISTS `view_login_report_36_user_313`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_36_user_313`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5508') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_36_user_314`
--
DROP TABLE IF EXISTS `view_login_report_36_user_314`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_36_user_314`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '5508') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_40_user_73`
--
DROP TABLE IF EXISTS `view_login_report_40_user_73`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_40_user_73`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20286') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_40_user_309`
--
DROP TABLE IF EXISTS `view_login_report_40_user_309`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_40_user_309`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_40_user_334`
--
DROP TABLE IF EXISTS `view_login_report_40_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_40_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_40_user_343`
--
DROP TABLE IF EXISTS `view_login_report_40_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_40_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_41_user_334`
--
DROP TABLE IF EXISTS `view_login_report_41_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_41_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 20286) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_41_user_343`
--
DROP TABLE IF EXISTS `view_login_report_41_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_41_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_42_user_76`
--
DROP TABLE IF EXISTS `view_login_report_42_user_76`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_42_user_76`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = '20288') ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_42_user_309`
--
DROP TABLE IF EXISTS `view_login_report_42_user_309`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_42_user_309`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_42_user_334`
--
DROP TABLE IF EXISTS `view_login_report_42_user_334`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_42_user_334`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `view_login_report_42_user_343`
--
DROP TABLE IF EXISTS `view_login_report_42_user_343`;

CREATE ALGORITHM=UNDEFINED DEFINER=`asterisk_user`@`10.65.0.57` SQL SECURITY DEFINER VIEW `view_login_report_42_user_343`  AS SELECT `user_log`.`login_time` AS `login_time`, `user_log`.`logout_time` AS `logout_time`, `user_log`.`agent` AS `agent`, `user_log`.`userfield` AS `userfield`, timestampdiff(MINUTE,`user_log`.`login_time`,`user_log`.`logout_time`) AS `total` FROM `user_log` WHERE (`user_log`.`userfield` = 0) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1113_log_email`
--
ALTER TABLE `1113_log_email`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `agent_campaign`
--
ALTER TABLE `agent_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`agent_id`);

--
-- Indexes for table `agent_daily_report`
--
ALTER TABLE `agent_daily_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`,`agent_id`,`queue_id`),
  ADD KEY `agent_id` (`agent_id`,`agent_name`,`queue_id`,`queue_name`);

--
-- Indexes for table `agent_group`
--
ALTER TABLE `agent_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_performance_daily`
--
ALTER TABLE `agent_performance_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agent_id` (`agent_id`,`date`);

--
-- Indexes for table `agent_performance_daily_backup`
--
ALTER TABLE `agent_performance_daily_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_status`
--
ALTER TABLE `agent_status`
  ADD PRIMARY KEY (`agentId`),
  ADD KEY `agentName` (`agentName`),
  ADD KEY `agentStatus` (`agentStatus`,`timestamp`,`callid`),
  ADD KEY `queue` (`queue`);

--
-- Indexes for table `API_Auto_dialer_Queues`
--
ALTER TABLE `API_Auto_dialer_Queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `API_Auto_dialer_Queue_Agent`
--
ALTER TABLE `API_Auto_dialer_Queue_Agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`agent_number`),
  ADD KEY `queue_code_2` (`queue_code`),
  ADD KEY `pbx_status` (`pbx_status`),
  ADD KEY `agent_flex_status` (`agent_flex_status`);

--
-- Indexes for table `API_call_config`
--
ALTER TABLE `API_call_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `API_log_call`
--
ALTER TABLE `API_log_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datecall` (`datecall`),
  ADD KEY `path` (`path`);

--
-- Indexes for table `API_log_request`
--
ALTER TABLE `API_log_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `API_request_config`
--
ALTER TABLE `API_request_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ast_config`
--
ALTER TABLE `ast_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filename_comment` (`filename`,`commented`);

--
-- Indexes for table `bcp_contact_backup`
--
ALTER TABLE `bcp_contact_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_report_END_result_agent_5`
--
ALTER TABLE `callout_report_END_result_agent_5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_report_END_result_agent_11`
--
ALTER TABLE `callout_report_END_result_agent_11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_report_END_result_campaign_5`
--
ALTER TABLE `callout_report_END_result_campaign_5`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `callout_report_END_result_campaign_11`
--
ALTER TABLE `callout_report_END_result_campaign_11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_report_summary_daily__5`
--
ALTER TABLE `callout_report_summary_daily__5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_report_summary_daily__11`
--
ALTER TABLE `callout_report_summary_daily__11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_log_status`
--
ALTER TABLE `call_log_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_note`
--
ALTER TABLE `call_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_note_backup`
--
ALTER TABLE `call_note_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`agent_number`,`agent_id`,`contact_id`,`result_id`,`reason_id`,`list_id`);

--
-- Indexes for table `call_out_list_call_filter`
--
ALTER TABLE `call_out_list_call_filter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_out_products`
--
ALTER TABLE `call_out_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_out_reason_list`
--
ALTER TABLE `call_out_reason_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_out_result_call`
--
ALTER TABLE `call_out_result_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_status`
--
ALTER TABLE `call_status`
  ADD PRIMARY KEY (`callId`),
  ADD KEY `callerId` (`callerId`),
  ADD KEY `status` (`status`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `queue` (`queue`),
  ADD KEY `position` (`position`,`originalPosition`,`holdtime`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_backup`
--
ALTER TABLE `campaign_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_contact_5`
--
ALTER TABLE `campaign_contact_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_contact_5_backup`
--
ALTER TABLE `campaign_contact_5_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_contact_5_backup_6_2022`
--
ALTER TABLE `campaign_contact_5_backup_6_2022`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_contact_5_bk_23_7`
--
ALTER TABLE `campaign_contact_5_bk_23_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_contact_8`
--
ALTER TABLE `campaign_contact_8`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_contact_11`
--
ALTER TABLE `campaign_contact_11`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_contact_17`
--
ALTER TABLE `campaign_contact_17`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`,`list_id`,`result_id`,`reason_id`,`assigned_by_id`,`contact_id`);

--
-- Indexes for table `campaign_group`
--
ALTER TABLE `campaign_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_group_backup`
--
ALTER TABLE `campaign_group_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdr`
--
ALTER TABLE `cdr`
  ADD PRIMARY KEY (`recid`),
  ADD KEY `calldate` (`calldate`),
  ADD KEY `dst` (`dst`),
  ADD KEY `accountcode` (`accountcode`),
  ADD KEY `src` (`src`),
  ADD KEY `disposition` (`disposition`),
  ADD KEY `uniqueid` (`uniqueid`),
  ADD KEY `userfield` (`userfield`),
  ADD KEY `userfield2` (`userfield2`),
  ADD KEY `realsrc` (`realsrc`),
  ADD KEY `realdst` (`realdst`);


--
-- Indexes for table `cdr_user_emailed`
--
ALTER TABLE `cdr_user_emailed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`recid`);

--
-- Indexes for table `config_field_type`
--
ALTER TABLE `config_field_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_input_type`
--
ALTER TABLE `config_input_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_license_bria`
--
ALTER TABLE `config_license_bria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_services`
--
ALTER TABLE `config_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `in_number` (`in_number`);

--
-- Indexes for table `config_service_dtmf`
--
ALTER TABLE `config_service_dtmf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_service_survey`
--
ALTER TABLE `config_service_survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conf_meetme`
--
ALTER TABLE `conf_meetme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `confno` (`confno`);

--
-- Indexes for table `conf_meetme_group`
--
ALTER TABLE `conf_meetme_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `db_log`
--
ALTER TABLE `db_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_recorded`
--
ALTER TABLE `file_recorded`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `interface`
--
ALTER TABLE `interface`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `ivr_tree`
--
ALTER TABLE `ivr_tree`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `log_event`
--
ALTER TABLE `log_event`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `mapping_fields`
--
ALTER TABLE `mapping_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`,`field`);

--
-- Indexes for table `mapping_fields_backup_10_7_2022`
--
ALTER TABLE `mapping_fields_backup_10_7_2022`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`,`field`);

--
-- Indexes for table `mapping_fields_callerid`
--
ALTER TABLE `mapping_fields_callerid`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`field`);

--
-- Indexes for table `mapping_fields_old`
--
ALTER TABLE `mapping_fields_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`,`field`);

--
-- Indexes for table `meetme`
--
ALTER TABLE `meetme`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `confno` (`confno`,`starttime`,`endtime`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `network_prefix`
--
ALTER TABLE `network_prefix`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prefix` (`prefix`);

--
-- Indexes for table `network_type`
--
ALTER TABLE `network_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_API_Auto_dialer_Queues`
--
ALTER TABLE `old_API_Auto_dialer_Queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`queue_code`);

--
-- Indexes for table `old_API_Auto_dialer_Queue_Agent`
--
ALTER TABLE `old_API_Auto_dialer_Queue_Agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`queue_code`,`agent_number`);

--
-- Indexes for table `old_API_Auto_dialer_Queue_Customers`
--
ALTER TABLE `old_API_Auto_dialer_Queue_Customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`queue_code`,`customer_id`);

--
-- Indexes for table `portal_login_history`
--
ALTER TABLE `portal_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prefix_group`
--
ALTER TABLE `prefix_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queues_users`
--
ALTER TABLE `queues_users`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `queue_abandon_monitor`
--
ALTER TABLE `queue_abandon_monitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `queue_join_log`
--
ALTER TABLE `queue_join_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_name` (`queue_name`,`callerid`,`uniqueid`,`status`),
  ADD KEY `calldate` (`calldate`);

--
-- Indexes for table `queue_join_monitor`
--
ALTER TABLE `queue_join_monitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `queue_log`
--
ALTER TABLE `queue_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `callid` (`callid`),
  ADD KEY `queuename` (`queuename`),
  ADD KEY `agent` (`agent`),
  ADD KEY `agent_number` (`agent_number`),
  ADD KEY `update_cdr` (`update_cdr`);

--
-- Indexes for table `queue_log_newsys`
--
ALTER TABLE `queue_log_newsys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cdr_uniqueid` (`cdr_uniqueid`);

--
-- Indexes for table `queue_member_table`
--
ALTER TABLE `queue_member_table`
  ADD PRIMARY KEY (`uniqueid`),
  ADD UNIQUE KEY `queue_interface` (`queue_name`,`interface`);

--
-- Indexes for table `queue_strategy`
--
ALTER TABLE `queue_strategy`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `queue_table`
--
ALTER TABLE `queue_table`
  ADD PRIMARY KEY (`ma`,`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `sipuser_ip_trigger`
--
ALTER TABLE `sipuser_ip_trigger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipaddr` (`ipaddr`,`service_id`,`name`);

--
-- Indexes for table `sip_active`
--
ALTER TABLE `sip_active`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sip_name` (`sip_name`);

--
-- Indexes for table `sip_user`
--
ALTER TABLE `sip_user`
  ADD PRIMARY KEY (`ma`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `sip_user_backup`
--
ALTER TABLE `sip_user_backup`
  ADD PRIMARY KEY (`ma`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `system_crontab`
--
ALTER TABLE `system_crontab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `users_queues`
--
ALTER TABLE `users_queues`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `user_city`
--
ALTER TABLE `user_city`
  ADD PRIMARY KEY (`ma`),
  ADD UNIQUE KEY `user_id` (`user_id`,`city_id`);

--
-- Indexes for table `user_function`
--
ALTER TABLE `user_function`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `login_time` (`login_time`),
  ADD KEY `logout_time` (`logout_time`),
  ADD KEY `agent` (`agent`);

--
-- Indexes for table `user_queue`
--
ALTER TABLE `user_queue`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_service`
--
ALTER TABLE `user_service`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `vip_list`
--
ALTER TABLE `vip_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1113_log_email`
--
ALTER TABLE `1113_log_email`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_campaign`
--
ALTER TABLE `agent_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_daily_report`
--
ALTER TABLE `agent_daily_report`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_group`
--
ALTER TABLE `agent_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_performance_daily`
--
ALTER TABLE `agent_performance_daily`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_performance_daily_backup`
--
ALTER TABLE `agent_performance_daily_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_Auto_dialer_Queues`
--
ALTER TABLE `API_Auto_dialer_Queues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_Auto_dialer_Queue_Agent`
--
ALTER TABLE `API_Auto_dialer_Queue_Agent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_call_config`
--
ALTER TABLE `API_call_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_log_call`
--
ALTER TABLE `API_log_call`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_log_request`
--
ALTER TABLE `API_log_request`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `API_request_config`
--
ALTER TABLE `API_request_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ast_config`
--
ALTER TABLE `ast_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bcp_contact_backup`
--
ALTER TABLE `bcp_contact_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_END_result_agent_5`
--
ALTER TABLE `callout_report_END_result_agent_5`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_END_result_agent_11`
--
ALTER TABLE `callout_report_END_result_agent_11`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_END_result_campaign_5`
--
ALTER TABLE `callout_report_END_result_campaign_5`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_END_result_campaign_11`
--
ALTER TABLE `callout_report_END_result_campaign_11`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_summary_daily__5`
--
ALTER TABLE `callout_report_summary_daily__5`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callout_report_summary_daily__11`
--
ALTER TABLE `callout_report_summary_daily__11`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_log_status`
--
ALTER TABLE `call_log_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_note`
--
ALTER TABLE `call_note`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_note_backup`
--
ALTER TABLE `call_note_backup`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_out_list_call_filter`
--
ALTER TABLE `call_out_list_call_filter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_out_products`
--
ALTER TABLE `call_out_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_out_reason_list`
--
ALTER TABLE `call_out_reason_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_out_result_call`
--
ALTER TABLE `call_out_result_call`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_backup`
--
ALTER TABLE `campaign_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_5`
--
ALTER TABLE `campaign_contact_5`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_5_backup`
--
ALTER TABLE `campaign_contact_5_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_5_backup_6_2022`
--
ALTER TABLE `campaign_contact_5_backup_6_2022`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_5_bk_23_7`
--
ALTER TABLE `campaign_contact_5_bk_23_7`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_8`
--
ALTER TABLE `campaign_contact_8`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_11`
--
ALTER TABLE `campaign_contact_11`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_contact_17`
--
ALTER TABLE `campaign_contact_17`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_group`
--
ALTER TABLE `campaign_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_group_backup`
--
ALTER TABLE `campaign_group_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdr`
--
ALTER TABLE `cdr`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_2015`
--
ALTER TABLE `cdr_2015`
  MODIFY `recid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_2016`
--
ALTER TABLE `cdr_2016`
  MODIFY `recid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_backup`
--
ALTER TABLE `cdr_backup`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_backup_28082021`
--
ALTER TABLE `cdr_backup_28082021`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_bk_24_10`
--
ALTER TABLE `cdr_bk_24_10`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_new`
--
ALTER TABLE `cdr_new`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdr_user_emailed`
--
ALTER TABLE `cdr_user_emailed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `check`
--
ALTER TABLE `check`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_field_type`
--
ALTER TABLE `config_field_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_input_type`
--
ALTER TABLE `config_input_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_license_bria`
--
ALTER TABLE `config_license_bria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_services`
--
ALTER TABLE `config_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_service_dtmf`
--
ALTER TABLE `config_service_dtmf`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_service_survey`
--
ALTER TABLE `config_service_survey`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conf_meetme`
--
ALTER TABLE `conf_meetme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conf_meetme_group`
--
ALTER TABLE `conf_meetme_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_log`
--
ALTER TABLE `db_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_recorded`
--
ALTER TABLE `file_recorded`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interface`
--
ALTER TABLE `interface`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ivr_tree`
--
ALTER TABLE `ivr_tree`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_event`
--
ALTER TABLE `log_event`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_fields`
--
ALTER TABLE `mapping_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_fields_backup_10_7_2022`
--
ALTER TABLE `mapping_fields_backup_10_7_2022`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_fields_callerid`
--
ALTER TABLE `mapping_fields_callerid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_fields_old`
--
ALTER TABLE `mapping_fields_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetme`
--
ALTER TABLE `meetme`
  MODIFY `bookid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `network_prefix`
--
ALTER TABLE `network_prefix`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `network_type`
--
ALTER TABLE `network_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_API_Auto_dialer_Queues`
--
ALTER TABLE `old_API_Auto_dialer_Queues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_API_Auto_dialer_Queue_Agent`
--
ALTER TABLE `old_API_Auto_dialer_Queue_Agent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_API_Auto_dialer_Queue_Customers`
--
ALTER TABLE `old_API_Auto_dialer_Queue_Customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portal_login_history`
--
ALTER TABLE `portal_login_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prefix_group`
--
ALTER TABLE `prefix_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queues_users`
--
ALTER TABLE `queues_users`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_abandon_monitor`
--
ALTER TABLE `queue_abandon_monitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_join_log`
--
ALTER TABLE `queue_join_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_join_monitor`
--
ALTER TABLE `queue_join_monitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_log`
--
ALTER TABLE `queue_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_log_newsys`
--
ALTER TABLE `queue_log_newsys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_member_table`
--
ALTER TABLE `queue_member_table`
  MODIFY `uniqueid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_table`
--
ALTER TABLE `queue_table`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sipuser_ip_trigger`
--
ALTER TABLE `sipuser_ip_trigger`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sip_active`
--
ALTER TABLE `sip_active`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sip_user`
--
ALTER TABLE `sip_user`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sip_user_backup`
--
ALTER TABLE `sip_user_backup`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_crontab`
--
ALTER TABLE `system_crontab`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `url`
--
ALTER TABLE `url`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_queues`
--
ALTER TABLE `users_queues`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_city`
--
ALTER TABLE `user_city`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_function`
--
ALTER TABLE `user_function`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_queue`
--
ALTER TABLE `user_queue`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_service`
--
ALTER TABLE `user_service`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vip_list`
--
ALTER TABLE `vip_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
