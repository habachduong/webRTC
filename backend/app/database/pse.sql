-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2025 at 06:58 AM
-- Server version: 8.0.21
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `pse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `original_password` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `profile_image` varchar(400) NOT NULL,
  `popup_type` varchar(5) NOT NULL DEFAULT '0',
  `extension` varchar(15) NOT NULL,
  `asterisk_ip` varchar(20) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `context` varchar(50) NOT NULL,
  `prefix` varchar(30) NOT NULL,
  `crm_url` varchar(256) NOT NULL,
  `crm_username` varchar(50) NOT NULL,
  `crm_password` varchar(50) NOT NULL,
  `crm_user_id` varchar(100) NOT NULL,
  `ms_client_id` varchar(100) NOT NULL,
  `call_log_in_crm` varchar(5) NOT NULL,
  `crm_type` varchar(25) NOT NULL,
  `secret` varchar(60) NOT NULL,
  `loggedin` varchar(5) NOT NULL,
  `last_login_date` datetime NOT NULL,
  `last_logout_date` datetime NOT NULL,
  `api_session_id` varchar(130) NOT NULL,
  `api_session_url` varchar(130) NOT NULL,
  `deleted` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agent_campaign`
--

CREATE TABLE `agent_campaign` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `agent_name` int NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `campaign_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `agent_campaign`
--
DELIMITER $$
CREATE TRIGGER `agent_insert` AFTER INSERT ON `agent_campaign` FOR EACH ROW BEGIN 
UPDATE campaign SET 
total_agent=(SELECT COUNT(*) FROM agent_campaign WHERE campaign_id=NEW.campaign_id), 
agents=(select GROUP_CONCAT(agent_id) from agent_campaign where campaign_id=NEW.campaign_id) 
where id=NEW.campaign_id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `agent_update_after` AFTER UPDATE ON `agent_campaign` FOR EACH ROW BEGIN 
UPDATE campaign SET 
total_agent=(SELECT COUNT(*) FROM agent_campaign WHERE campaign_id=NEW.campaign_id), 
agents=(select GROUP_CONCAT(agent_id) from agent_campaign where campaign_id=NEW.campaign_id) 
where id=NEW.campaign_id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `agent_update_before` BEFORE UPDATE ON `agent_campaign` FOR EACH ROW BEGIN 
UPDATE campaign SET 
total_agent=(SELECT COUNT(*) FROM agent_campaign WHERE campaign_id=OLD.campaign_id), 
agents=(select GROUP_CONCAT(agent_id) from agent_campaign where campaign_id=OLD.campaign_id) 
where id=OLD.campaign_id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `del_agent` AFTER DELETE ON `agent_campaign` FOR EACH ROW BEGIN 
UPDATE contact_campaign SET assigned=0,assigned_by_id='',assigned_by='' Where campaign_id=OLD.campaign_id AND assigned_by_id=OLD.agent_id;
Update campaign SET total_agent =(SELECT count(*) FROM agent_campaign where campaign_id=OLD.campaign_id), agents=(select GROUP_CONCAT(agent_id) from agent_campaign where campaign_id=OLD.campaign_id) WHERE id=OLD.campaign_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_distinct`
--

CREATE TABLE `agent_distinct` (
  `partynumber` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agent_group`
--

CREATE TABLE `agent_group` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ky_hieu` varchar(20) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Stand-in structure for view `call_daily_sum_by_result_id`
-- (See below for the actual view)
--
CREATE TABLE `call_daily_sum_by_result_id` (
`assigned_by` varchar(30)
,`assigned_by_id` int
,`call_date` date
,`call_result_id` int
,`call_result_name` varchar(100)
,`calls` bigint
,`campaign_id` int
,`campaign_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `call_log`
--

CREATE TABLE `call_log` (
  `id` bigint NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `contact_id` int NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `call_log`
--
DELIMITER $$
CREATE TRIGGER `add_call_log` AFTER INSERT ON `call_log` FOR EACH ROW UPDATE contact_campaign SET last_call_date=now() where id=NeW.contact_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` int NOT NULL,
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
  `sanpham_id` int NOT NULL,
  `sanpham_name` varchar(299) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_old`
--

CREATE TABLE `campaign_old` (
  `id` int NOT NULL,
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
  `contacts` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cdr_update` AFTER UPDATE ON `cdr` FOR EACH ROW BEGIN
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `table_name` varchar(40) NOT NULL,
  `sophieu_length` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_campaign_group`
--

CREATE TABLE `config_campaign_group` (
  `id` int NOT NULL,
  `ten_nhom` varchar(200) NOT NULL,
  `ky_hieu` varchar(30) NOT NULL,
  `success_rate` int NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for table `config_qa`
--

CREATE TABLE `config_qa` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `noidung` text NOT NULL,
  `noidung_short` varchar(100) NOT NULL,
  `thangdiem` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_qa_group`
--

CREATE TABLE `config_qa_group` (
  `id` int NOT NULL,
  `ten_nhom` varchar(200) NOT NULL,
  `ky_hieu` varchar(30) NOT NULL,
  `max_mark` int NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_qa_group_old`
--

CREATE TABLE `config_qa_group_old` (
  `id` int NOT NULL,
  `ten_nhom` varchar(200) NOT NULL,
  `ky_hieu` varchar(30) NOT NULL,
  `max_mark` int NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_qa_old`
--

CREATE TABLE `config_qa_old` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `noidung` text NOT NULL,
  `noidung_short` varchar(100) NOT NULL,
  `thangdiem` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_result`
--

CREATE TABLE `config_result` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order` tinyint NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `trigger_finish` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_result_group`
--

CREATE TABLE `config_result_group` (
  `id` int NOT NULL,
  `ten_nhom` varchar(100) NOT NULL,
  `ky_hieu` varchar(20) NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config_sanpham`
--

CREATE TABLE `config_sanpham` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kyhieu` varchar(40) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign`
--

CREATE TABLE `contact_campaign` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_backup`
--

CREATE TABLE `contact_campaign_backup` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_backup_06_2022`
--

CREATE TABLE `contact_campaign_backup_06_2022` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_pse`
--

CREATE TABLE `contact_campaign_pse` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `contact_campaign_pse`
--
DELIMITER $$
CREATE TRIGGER `assiged_update` AFTER UPDATE ON `contact_campaign_pse` FOR EACH ROW BEGIN 
if(NEW.trigger_on=1) THEN
UPDATE campaign SET total_assiged=(select count(*) from contact_campaign where campaign_id=NEW.campaign_id AND assigned=1),total_not_assiged=(select count(*) from contact_campaign where campaign_id=NEW.campaign_id AND assigned=0), total_contact=total_assiged+total_not_assiged where id=NEW.campaign_id;
end IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `contact_del` AFTER DELETE ON `contact_campaign_pse` FOR EACH ROW BEGIN 
UPDATE campaign SET total_assiged=(select count(*) from contact_campaign where campaign_id=OLD.campaign_id AND assigned=1),total_not_assiged=(select count(*) from contact_campaign where campaign_id=OLD.campaign_id AND assigned=0), total_contact=(SELECT COUNT(*) from contact_campaign where campaign_id=old.campaign_id)  where id=OLD.campaign_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_temp_60`
--

CREATE TABLE `contact_campaign_temp_60` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_temp_61`
--

CREATE TABLE `contact_campaign_temp_61` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_temp_62`
--

CREATE TABLE `contact_campaign_temp_62` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_temp_71`
--

CREATE TABLE `contact_campaign_temp_71` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_campaign_temp_95`
--

CREATE TABLE `contact_campaign_temp_95` (
  `id` int NOT NULL DEFAULT '0',
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `hoten_chuyenvien` varchar(50) NOT NULL,
  `ID_sale` varchar(50) NOT NULL,
  `ID_chuyen_vien` varchar(50) NOT NULL,
  `ma_CN` varchar(50) NOT NULL,
  `ten_CN` varchar(100) NOT NULL,
  `vung` varchar(50) NOT NULL,
  `ID_khach` varchar(50) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `tel_khach` varchar(50) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(50) NOT NULL,
  `data_3` varchar(50) NOT NULL,
  `data_4` varchar(50) NOT NULL,
  `assigned` tinyint NOT NULL DEFAULT '0',
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `assigned_by_number` int NOT NULL,
  `date_import` date NOT NULL,
  `assigned_group` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `marked` int NOT NULL,
  `call_result_id` int NOT NULL,
  `call_result_name` varchar(100) NOT NULL,
  `call_result_date` datetime NOT NULL,
  `last_call_date` datetime NOT NULL,
  `mark_count_by_NV_ID` int NOT NULL,
  `trigger_on` int NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `id` int NOT NULL,
  `makhach` varchar(10) NOT NULL,
  `tenkhach` varchar(100) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `sanpham` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_fields`
--

CREATE TABLE `mapping_fields` (
  `id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `ol_field` varchar(50) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `input_type` varchar(50) NOT NULL,
  `form_width` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `require` tinyint NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `user_action` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `synced` tinyint NOT NULL,
  `standard_tel` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mark_campaign`
--

CREATE TABLE `mark_campaign` (
  `id` int NOT NULL,
  `ID_chuyen_vien` varchar(20) NOT NULL,
  `hoten_chuyenvien` varchar(100) NOT NULL,
  `vung` varchar(30) NOT NULL,
  `ma_CN` varchar(30) NOT NULL,
  `ID_sale` varchar(30) NOT NULL,
  `contact_id` int NOT NULL,
  `ID_khach` varchar(30) NOT NULL,
  `hoten_khach` varchar(50) NOT NULL,
  `assigned_by` varchar(30) NOT NULL,
  `assigned_by_id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `product` varchar(100) NOT NULL,
  `segment` varchar(50) NOT NULL,
  `qa_id` int NOT NULL,
  `mark` int NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `mark_summ_by_id`
-- (See below for the actual view)
--
CREATE TABLE `mark_summ_by_id` (
`contact_id` int
,`date` datetime
,`ghichu` text
,`hoten_chuyenvien` varchar(100)
,`id` int
,`ID_chuyen_vien` varchar(20)
,`ID_sale` varchar(30)
,`ma_CN` varchar(30)
,`mark` int
,`qa_id` int
,`sum_mark` decimal(32,0)
,`user_action` varchar(30)
,`vung` varchar(30)
);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_cdr_call_by_phone`
-- (See below for the actual view)
--
CREATE TABLE `report_cdr_call_by_phone` (
`call_date` datetime
,`disposition` varchar(45)
,`dst` varchar(80)
,`duration` int
,`src` varchar(80)
,`uniqueid` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_detail_call_log`
-- (See below for the actual view)
--
CREATE TABLE `report_detail_call_log` (
`assigned` tinyint
,`assigned_by` varchar(30)
,`assigned_by_id` int
,`call_date` datetime
,`call_result_date` datetime
,`call_result_id` int
,`call_result_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(100)
,`data_1` varchar(100)
,`data_2` varchar(50)
,`data_3` varchar(50)
,`data_4` varchar(50)
,`date` datetime
,`disposition` varchar(45)
,`duration` int
,`ghichu` varchar(200)
,`hoten_chuyenvien` varchar(50)
,`hoten_khach` varchar(50)
,`id` int
,`ID_chuyen_vien` varchar(50)
,`ID_khach` varchar(50)
,`ID_sale` varchar(50)
,`ma_CN` varchar(50)
,`mark_count_by_NV_ID` int
,`marked` int
,`tel_khach` varchar(50)
,`ten_CN` varchar(100)
,`trigger_on` int
,`uniqueid` varchar(32)
,`user_action` varchar(30)
,`vung` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_detail_mark_by_contact`
-- (See below for the actual view)
--
CREATE TABLE `report_detail_mark_by_contact` (
`assigned_by` varchar(30)
,`assigned_by_id` int
,`campaign_id` int
,`campaign_name` varchar(200)
,`contact_id` int
,`date` varchar(10)
,`ghichus` mediumtext
,`hoten_chuyenvien` varchar(100)
,`hoten_khach` varchar(50)
,`ID_chuyen_vien` varchar(20)
,`ID_khach` varchar(30)
,`ID_sale` varchar(30)
,`ma_CN` varchar(30)
,`marks` mediumtext
,`product` varchar(100)
,`qa_ids` mediumtext
,`segment` varchar(50)
,`vung` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sum_contact_processed_by_agent`
-- (See below for the actual view)
--
CREATE TABLE `report_sum_contact_processed_by_agent` (
`agent_id` int
,`agent_name` varchar(30)
,`call_result_id` int
,`call_result_name` varchar(100)
,`campaign_id` int
,`campaign_name` varchar(100)
,`total` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sum_sucsess_avg_mark`
-- (See below for the actual view)
--
CREATE TABLE `report_sum_sucsess_avg_mark` (
`assigned_by_id` int
,`campaign_id` int
,`campaign_name` varchar(200)
,`hoten_chuyenvien` varchar(100)
,`ID_chuyen_vien` varchar(20)
,`ID_sale` varchar(30)
,`ma_CN` varchar(30)
,`tong_cau_hoi` bigint
,`tong_diem` decimal(32,0)
,`total_call` bigint
,`vung` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `role_name` varchar(30) NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `department` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(20) NOT NULL,
  `designation` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `profile_image` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'image/avtar.png',
  `extension` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `channel` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `secret` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `loggedin` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `last_login_date` datetime NOT NULL,
  `last_logout_date` datetime NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `ky_hieu` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `call_daily_sum_by_result_id`
--
DROP TABLE IF EXISTS `call_daily_sum_by_result_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `call_daily_sum_by_result_id`  AS SELECT count(0) AS `calls`, `contact_campaign`.`campaign_id` AS `campaign_id`, `contact_campaign`.`campaign_name` AS `campaign_name`, `contact_campaign`.`assigned_by` AS `assigned_by`, `contact_campaign`.`assigned_by_id` AS `assigned_by_id`, `contact_campaign`.`call_result_id` AS `call_result_id`, `contact_campaign`.`call_result_name` AS `call_result_name`, cast(`contact_campaign`.`call_result_date` as date) AS `call_date` FROM `contact_campaign` WHERE ((`contact_campaign`.`assigned` = 1) AND (`contact_campaign`.`call_result_id` <> 0)) GROUP BY `contact_campaign`.`call_result_id`, cast(`contact_campaign`.`call_result_date` as date), `contact_campaign`.`assigned_by_id`, `contact_campaign`.`campaign_id` ;

-- --------------------------------------------------------

--
-- Structure for view `mark_summ_by_id`
--
DROP TABLE IF EXISTS `mark_summ_by_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sroot`@`localhost` SQL SECURITY DEFINER VIEW `mark_summ_by_id`  AS SELECT `mark_campaign`.`id` AS `id`, `mark_campaign`.`ID_chuyen_vien` AS `ID_chuyen_vien`, `mark_campaign`.`hoten_chuyenvien` AS `hoten_chuyenvien`, `mark_campaign`.`vung` AS `vung`, `mark_campaign`.`ma_CN` AS `ma_CN`, `mark_campaign`.`ID_sale` AS `ID_sale`, `mark_campaign`.`contact_id` AS `contact_id`, `mark_campaign`.`qa_id` AS `qa_id`, `mark_campaign`.`mark` AS `mark`, `mark_campaign`.`ghichu` AS `ghichu`, `mark_campaign`.`date` AS `date`, `mark_campaign`.`user_action` AS `user_action`, sum(`mark_campaign`.`mark`) AS `sum_mark` FROM `mark_campaign` GROUP BY `mark_campaign`.`contact_id` ;

-- --------------------------------------------------------

--
-- Structure for view `report_cdr_call_by_phone`
--
DROP TABLE IF EXISTS `report_cdr_call_by_phone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sroot`@`localhost` SQL SECURITY DEFINER VIEW `report_cdr_call_by_phone`  AS SELECT `cdr`.`uniqueid` AS `uniqueid`, `cdr`.`calldate` AS `call_date`, `cdr`.`src` AS `src`, `cdr`.`dst` AS `dst`, `cdr`.`duration` AS `duration`, `cdr`.`disposition` AS `disposition` FROM `cdr` WHERE ((`cdr`.`accountcode` = '') AND (`cdr`.`src` <> 's') AND (`cdr`.`dst` <> 's') AND (`cdr`.`src` <> '') AND (`cdr`.`dst` <> '') AND (`cdr`.`duration` > 0)) ;

-- --------------------------------------------------------

--
-- Structure for view `report_detail_call_log`
--
DROP TABLE IF EXISTS `report_detail_call_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sroot`@`localhost` SQL SECURITY DEFINER VIEW `report_detail_call_log`  AS SELECT `a`.`uniqueid` AS `uniqueid`, `a`.`date` AS `call_date`, `c`.`duration` AS `duration`, `c`.`disposition` AS `disposition`, `b`.`id` AS `id`, `b`.`campaign_id` AS `campaign_id`, `b`.`campaign_name` AS `campaign_name`, `b`.`hoten_chuyenvien` AS `hoten_chuyenvien`, `b`.`ID_sale` AS `ID_sale`, `b`.`ID_chuyen_vien` AS `ID_chuyen_vien`, `b`.`ma_CN` AS `ma_CN`, `b`.`ten_CN` AS `ten_CN`, `b`.`vung` AS `vung`, `b`.`ID_khach` AS `ID_khach`, `b`.`hoten_khach` AS `hoten_khach`, `b`.`tel_khach` AS `tel_khach`, `b`.`data_1` AS `data_1`, `b`.`data_2` AS `data_2`, `b`.`data_3` AS `data_3`, `b`.`data_4` AS `data_4`, `b`.`assigned` AS `assigned`, `b`.`assigned_by` AS `assigned_by`, `b`.`assigned_by_id` AS `assigned_by_id`, `b`.`date` AS `date`, `b`.`user_action` AS `user_action`, `b`.`ghichu` AS `ghichu`, `b`.`marked` AS `marked`, `b`.`call_result_id` AS `call_result_id`, `b`.`call_result_name` AS `call_result_name`, `b`.`call_result_date` AS `call_result_date`, `b`.`mark_count_by_NV_ID` AS `mark_count_by_NV_ID`, `b`.`trigger_on` AS `trigger_on` FROM ((`call_log` `a` join `contact_campaign` `b` on((`a`.`contact_id` = `b`.`id`))) left join `cdr` `c` on((`a`.`uniqueid` = convert(`c`.`uniqueid` using utf8)))) GROUP BY `a`.`uniqueid` ;

-- --------------------------------------------------------

--
-- Structure for view `report_detail_mark_by_contact`
--
DROP TABLE IF EXISTS `report_detail_mark_by_contact`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_detail_mark_by_contact`  AS SELECT date_format(`mark_campaign`.`date`,'%Y-%m-%d') AS `date`, `mark_campaign`.`ID_chuyen_vien` AS `ID_chuyen_vien`, `mark_campaign`.`assigned_by_id` AS `assigned_by_id`, `mark_campaign`.`hoten_chuyenvien` AS `hoten_chuyenvien`, `mark_campaign`.`vung` AS `vung`, `mark_campaign`.`ma_CN` AS `ma_CN`, `mark_campaign`.`ID_sale` AS `ID_sale`, `mark_campaign`.`contact_id` AS `contact_id`, `mark_campaign`.`ID_khach` AS `ID_khach`, `mark_campaign`.`hoten_khach` AS `hoten_khach`, `mark_campaign`.`assigned_by` AS `assigned_by`, `mark_campaign`.`campaign_id` AS `campaign_id`, `mark_campaign`.`campaign_name` AS `campaign_name`, `mark_campaign`.`product` AS `product`, `mark_campaign`.`segment` AS `segment`, group_concat(distinct `mark_campaign`.`qa_id` order by `mark_campaign`.`qa_id` ASC separator '||') AS `qa_ids`, group_concat(`mark_campaign`.`mark` order by `mark_campaign`.`qa_id` ASC separator '||') AS `marks`, group_concat(`mark_campaign`.`ghichu` order by `mark_campaign`.`qa_id` ASC separator '||') AS `ghichus` FROM `mark_campaign` GROUP BY `mark_campaign`.`campaign_id`, `mark_campaign`.`contact_id` ;

-- --------------------------------------------------------

--
-- Structure for view `report_sum_contact_processed_by_agent`
--
DROP TABLE IF EXISTS `report_sum_contact_processed_by_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sum_contact_processed_by_agent`  AS SELECT `contact_campaign`.`campaign_id` AS `campaign_id`, `contact_campaign`.`campaign_name` AS `campaign_name`, `contact_campaign`.`assigned_by` AS `agent_name`, `contact_campaign`.`assigned_by_id` AS `agent_id`, `contact_campaign`.`call_result_id` AS `call_result_id`, `contact_campaign`.`call_result_name` AS `call_result_name`, count(`contact_campaign`.`id`) AS `total` FROM `contact_campaign` GROUP BY `contact_campaign`.`assigned_by_id`, `contact_campaign`.`campaign_id`, `contact_campaign`.`call_result_id` ORDER BY `contact_campaign`.`campaign_id` ASC, `contact_campaign`.`assigned_by_id` ASC, `contact_campaign`.`call_result_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `report_sum_sucsess_avg_mark`
--
DROP TABLE IF EXISTS `report_sum_sucsess_avg_mark`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sum_sucsess_avg_mark`  AS SELECT `mark_campaign`.`campaign_id` AS `campaign_id`, `mark_campaign`.`assigned_by_id` AS `assigned_by_id`, `mark_campaign`.`campaign_name` AS `campaign_name`, `mark_campaign`.`vung` AS `vung`, `mark_campaign`.`ma_CN` AS `ma_CN`, `mark_campaign`.`ID_chuyen_vien` AS `ID_chuyen_vien`, `mark_campaign`.`hoten_chuyenvien` AS `hoten_chuyenvien`, `mark_campaign`.`ID_sale` AS `ID_sale`, sum(`mark_campaign`.`mark`) AS `tong_diem`, count(`mark_campaign`.`qa_id`) AS `tong_cau_hoi`, count(distinct `mark_campaign`.`ID_khach`) AS `total_call` FROM `mark_campaign` GROUP BY `mark_campaign`.`campaign_id`, `mark_campaign`.`ID_chuyen_vien` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `agent_campaign`
--
ALTER TABLE `agent_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`agent_id`);

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
-- Indexes for table `call_log`
--
ALTER TABLE `call_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_old`
--
ALTER TABLE `campaign_old`
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
  ADD KEY `realdst` (`realdst`),
  ADD KEY `channel` (`channel`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_campaign_group`
--
ALTER TABLE `config_campaign_group`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `config_qa`
--
ALTER TABLE `config_qa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_qa_group`
--
ALTER TABLE `config_qa_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_qa_group_old`
--
ALTER TABLE `config_qa_group_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_qa_old`
--
ALTER TABLE `config_qa_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_result`
--
ALTER TABLE `config_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_result_group`
--
ALTER TABLE `config_result_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_sanpham`
--
ALTER TABLE `config_sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_campaign`
--
ALTER TABLE `contact_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`ID_chuyen_vien`,`tel_khach`),
  ADD KEY `assigned_by_id` (`assigned_by_id`),
  ADD KEY `ID_sale` (`ID_sale`),
  ADD KEY `ma_CN` (`ma_CN`),
  ADD KEY `ID_khach` (`ID_khach`),
  ADD KEY `vung` (`vung`),
  ADD KEY `assigned` (`assigned`),
  ADD KEY `marked` (`marked`),
  ADD KEY `call_result_id` (`call_result_id`),
  ADD KEY `assigned_by_number` (`assigned_by_number`),
  ADD KEY `mark_count_by_NV_ID` (`mark_count_by_NV_ID`);

--
-- Indexes for table `contact_campaign_backup`
--
ALTER TABLE `contact_campaign_backup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`ID_chuyen_vien`,`tel_khach`),
  ADD KEY `assigned_by_id` (`assigned_by_id`);

--
-- Indexes for table `contact_campaign_backup_06_2022`
--
ALTER TABLE `contact_campaign_backup_06_2022`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`ID_chuyen_vien`,`tel_khach`),
  ADD KEY `assigned_by_id` (`assigned_by_id`);

--
-- Indexes for table `contact_campaign_pse`
--
ALTER TABLE `contact_campaign_pse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`,`ID_chuyen_vien`,`tel_khach`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `makhach` (`makhach`);

--
-- Indexes for table `mapping_fields`
--
ALTER TABLE `mapping_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_campaign`
--
ALTER TABLE `mark_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_id` (`contact_id`,`qa_id`),
  ADD KEY `assigned_by` (`assigned_by`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `assigned_by_id` (`assigned_by_id`),
  ADD KEY `qa_id` (`qa_id`),
  ADD KEY `ID_chuyen_vien` (`ID_chuyen_vien`),
  ADD KEY `vung` (`vung`),
  ADD KEY `ma_CN` (`ma_CN`),
  ADD KEY `ID_sale` (`ID_sale`),
  ADD KEY `ID_khach` (`ID_khach`);

--
-- Indexes for table `portal_login_history`
--
ALTER TABLE `portal_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_campaign`
--
ALTER TABLE `agent_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `call_log`
--
ALTER TABLE `call_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_old`
--
ALTER TABLE `campaign_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdr`
--
ALTER TABLE `cdr`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_campaign_group`
--
ALTER TABLE `config_campaign_group`
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
-- AUTO_INCREMENT for table `config_qa`
--
ALTER TABLE `config_qa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_qa_group`
--
ALTER TABLE `config_qa_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_qa_group_old`
--
ALTER TABLE `config_qa_group_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_qa_old`
--
ALTER TABLE `config_qa_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_result`
--
ALTER TABLE `config_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_result_group`
--
ALTER TABLE `config_result_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_sanpham`
--
ALTER TABLE `config_sanpham`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_campaign`
--
ALTER TABLE `contact_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_campaign_backup`
--
ALTER TABLE `contact_campaign_backup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_campaign_backup_06_2022`
--
ALTER TABLE `contact_campaign_backup_06_2022`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_campaign_pse`
--
ALTER TABLE `contact_campaign_pse`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_fields`
--
ALTER TABLE `mapping_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_campaign`
--
ALTER TABLE `mark_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portal_login_history`
--
ALTER TABLE `portal_login_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;
