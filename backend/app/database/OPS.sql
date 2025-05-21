-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2025 at 06:27 AM
-- Server version: 8.0.32
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `asterisk`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc`
--

CREATE TABLE `acc` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  `time_attr` float NOT NULL,
  `src_user` varchar(64) NOT NULL DEFAULT '',
  `src_domain` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) NOT NULL DEFAULT '',
  `dst_ouser` varchar(64) NOT NULL DEFAULT '',
  `dst_user` varchar(64) NOT NULL DEFAULT '',
  `dst_domain` varchar(128) NOT NULL DEFAULT '',
  `from_str` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `OPS_vars` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acc_cdrs`
--

CREATE TABLE `acc_cdrs` (
  `id` int UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `duration` float(10,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `active_watchers`
--

CREATE TABLE `active_watchers` (
  `id` int UNSIGNED NOT NULL,
  `presentity_uri` varchar(255) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `to_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `event_id` varchar(64) DEFAULT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `callid` varchar(255) NOT NULL,
  `local_cseq` int NOT NULL,
  `remote_cseq` int NOT NULL,
  `contact` varchar(255) NOT NULL,
  `record_route` text,
  `expires` int NOT NULL,
  `status` int NOT NULL DEFAULT '2',
  `reason` varchar(64) DEFAULT NULL,
  `version` int NOT NULL DEFAULT '0',
  `socket_info` varchar(64) NOT NULL,
  `local_contact` varchar(255) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `from_domain` varchar(64) NOT NULL,
  `updated` int NOT NULL,
  `updated_winfo` int NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `user_agent` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int UNSIGNED NOT NULL,
  `grp` int UNSIGNED NOT NULL DEFAULT '1',
  `ip_addr` varchar(50) NOT NULL,
  `mask` int NOT NULL DEFAULT '32',
  `port` smallint UNSIGNED NOT NULL DEFAULT '0',
  `tag` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `total_call_auto` int NOT NULL,
  `total_call_click2call` int NOT NULL,
  `total_call_manual` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `agent_report_lastcall`
-- (See below for the actual view)
--
CREATE TABLE `agent_report_lastcall` (
`agent_flex_status` varchar(80)
,`agent_number` int
,`agent_total_calls` int
,`id` int
,`lastcall_time` varchar(10)
,`pbx_status` int
,`queue_code` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version_config`
--

CREATE TABLE `alembic_version_config` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aliases`
--

CREATE TABLE `aliases` (
  `id` int UNSIGNED NOT NULL,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `received` varchar(255) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int NOT NULL DEFAULT '0',
  `cflags` int NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int NOT NULL DEFAULT '0',
  `server_id` int NOT NULL DEFAULT '0',
  `connection_id` int NOT NULL DEFAULT '0',
  `keepalive` int NOT NULL DEFAULT '0',
  `partition` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AMC_monitor`
--

CREATE TABLE `AMC_monitor` (
  `id` bigint NOT NULL,
  `date` datetime NOT NULL,
  `active_calls` int NOT NULL,
  `active_agents` int NOT NULL,
  `real_ratio` int NOT NULL,
  `call_failed` int NOT NULL,
  `call_hangup` int NOT NULL,
  `call_poped` int NOT NULL,
  `call_dailed` int NOT NULL,
  `call_ring` int NOT NULL,
  `call_busy` int NOT NULL,
  `call_connected` int NOT NULL,
  `call_no_answer` int NOT NULL,
  `call_connected_agent_no_answer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `API_Auto_dialer_Queue_Agent`
--

CREATE TABLE `API_Auto_dialer_Queue_Agent` (
  `id` int NOT NULL,
  `agent_number` int NOT NULL,
  `agent_flex_status` varchar(80) NOT NULL,
  `agent_total_calls` int NOT NULL,
  `pbx_status` int NOT NULL,
  `pbx_busy` int NOT NULL,
  `lastcall` datetime NOT NULL,
  `queue_code` varchar(20) NOT NULL,
  `last_flex` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `API_Auto_dialer_Queue_Customers`
--

CREATE TABLE `API_Auto_dialer_Queue_Customers` (
  `id` int NOT NULL,
  `queue_code` varchar(80) NOT NULL,
  `containerID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` varchar(80) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `agent_number` int NOT NULL,
  `agent_connected` varchar(10) NOT NULL,
  `LOOKING_AGENT` int NOT NULL,
  `status` varchar(80) NOT NULL,
  `date` datetime NOT NULL,
  `dialAt` datetime NOT NULL,
  `ringAt` datetime NOT NULL,
  `connectedAt` datetime NOT NULL,
  `hangupAt` datetime NOT NULL,
  `hangup_reason` varchar(100) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `originate_success` tinyint NOT NULL DEFAULT '-1',
  `reason` varchar(500) NOT NULL,
  `hangup_16_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `API_log_call`
--

CREATE TABLE `API_log_call` (
  `id` bigint NOT NULL,
  `datecall` datetime NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_send` text NOT NULL,
  `status_code` varchar(100) NOT NULL,
  `data_return` text NOT NULL,
  `containerID` varchar(12) NOT NULL,
  `retry_times` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `carrierfailureroute`
--

CREATE TABLE `carrierfailureroute` (
  `id` int UNSIGNED NOT NULL,
  `carrier` int UNSIGNED NOT NULL DEFAULT '0',
  `domain` int UNSIGNED NOT NULL DEFAULT '0',
  `scan_prefix` varchar(64) NOT NULL DEFAULT '',
  `host_name` varchar(255) NOT NULL DEFAULT '',
  `reply_code` varchar(3) NOT NULL DEFAULT '',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `mask` int UNSIGNED NOT NULL DEFAULT '0',
  `next_domain` int UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `carrierroute`
--

CREATE TABLE `carrierroute` (
  `id` int UNSIGNED NOT NULL,
  `carrier` int UNSIGNED NOT NULL DEFAULT '0',
  `domain` int UNSIGNED NOT NULL DEFAULT '0',
  `scan_prefix` varchar(64) NOT NULL DEFAULT '',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `mask` int UNSIGNED NOT NULL DEFAULT '0',
  `prob` float NOT NULL DEFAULT '0',
  `strip` int UNSIGNED NOT NULL DEFAULT '0',
  `rewrite_host` varchar(255) NOT NULL DEFAULT '',
  `rewrite_prefix` varchar(64) NOT NULL DEFAULT '',
  `rewrite_suffix` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `carrier_name`
--

CREATE TABLE `carrier_name` (
  `id` int UNSIGNED NOT NULL,
  `carrier` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdr`
--

CREATE TABLE `cdr` (
  `recid` int UNSIGNED NOT NULL COMMENT 'Record ID',
  `calldate` datetime DEFAULT NULL,
  `clid` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `src` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `realsrc` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `dst` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `realdst` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `dcontext` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `channel` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `dstchannel` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `lastapp` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `lastdata` varchar(80) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `uniqueid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `linkedid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userfield` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `agent` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `queue_event` text CHARACTER SET utf8mb3,
  `case_id` tinyint NOT NULL DEFAULT '0',
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` int NOT NULL,
  `peeraccount` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
  `answer` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sequence` int NOT NULL,
  `update_solr` int NOT NULL,
  `update_solr_bill` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `cdr_solr` (
  `recid` bigint NOT NULL,
  `calldate` datetime NOT NULL,
  `from` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `billsec` int NOT NULL,
  `dispostion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int NOT NULL,
  `uniqueid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_solr` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----
CREATE TABLE `config_field_type` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `config_input_type`
--

CREATE TABLE `config_input_type` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `size` int NOT NULL,
  `default` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `config_license_bria`
--

CREATE TABLE `config_license_bria` (
  `id` int NOT NULL,
  `license_key` varchar(100) NOT NULL,
  `number_license` int NOT NULL,
  `used` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
  `current_agent` int NOT NULL,
  `in_number` varchar(20) NOT NULL,
  `local_callerid` varchar(20) NOT NULL,
  `pstn_callerid` varchar(30) NOT NULL,
  `template` varchar(50) NOT NULL,
  `virtual_name` varchar(100) NOT NULL,
  `document_root` varchar(100) NOT NULL,
  `cdr_database` varchar(100) NOT NULL,
  `sync_date` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `ghichu` varchar(100) NOT NULL,
  `active` tinyint NOT NULL,
  `active_time_check` tinyint NOT NULL,
  `time_work` varchar(200) NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Triggers `config_services`
--
DELIMITER $$
CREATE TRIGGER `service_update` AFTER UPDATE ON `config_services` FOR EACH ROW BEGIN
UPDATE subscriber set service_name=NEW.name where service_id=NEW.id;
UPDATE subscriber_group set service_name=NEW.name where service_id=NEW.id;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cpl`
--

CREATE TABLE `cpl` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL DEFAULT '',
  `cpl_xml` text,
  `cpl_bin` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbaliases`
--

CREATE TABLE `dbaliases` (
  `id` int UNSIGNED NOT NULL,
  `alias_username` varchar(64) NOT NULL DEFAULT '',
  `alias_domain` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dialog`
--

CREATE TABLE `dialog` (
  `id` int UNSIGNED NOT NULL,
  `hash_entry` int UNSIGNED NOT NULL,
  `hash_id` int UNSIGNED NOT NULL,
  `callid` varchar(255) NOT NULL,
  `from_uri` varchar(255) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `to_uri` varchar(255) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `caller_cseq` varchar(20) NOT NULL,
  `callee_cseq` varchar(20) NOT NULL,
  `caller_route_set` varchar(512) DEFAULT NULL,
  `callee_route_set` varchar(512) DEFAULT NULL,
  `caller_contact` varchar(255) NOT NULL,
  `callee_contact` varchar(255) NOT NULL,
  `caller_sock` varchar(64) NOT NULL,
  `callee_sock` varchar(64) NOT NULL,
  `state` int UNSIGNED NOT NULL,
  `start_time` int UNSIGNED NOT NULL,
  `timeout` int UNSIGNED NOT NULL DEFAULT '0',
  `sflags` int UNSIGNED NOT NULL DEFAULT '0',
  `iflags` int UNSIGNED NOT NULL DEFAULT '0',
  `toroute_name` varchar(32) DEFAULT NULL,
  `req_uri` varchar(255) NOT NULL,
  `xdata` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `dialog`
--
DELIMITER $$
CREATE TRIGGER `dialog_del` AFTER DELETE ON `dialog` FOR EACH ROW BEGIN
UPDATE API_Auto_dialer_Queue_Agent SET pbx_busy=0 where agent_number IN(substr(OLD.from_uri,locate(":",OLD.from_uri)+1,locate("@",OLD.from_uri)-locate(":",OLD.from_uri)-1),substr(OLD.to_uri,locate(":",OLD.to_uri)+1,locate("@",OLD.to_uri)-locate(":",OLD.to_uri)-1));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dialog_insert` AFTER INSERT ON `dialog` FOR EACH ROW BEGIN
UPDATE API_Auto_dialer_Queue_Agent SET pbx_busy=1 where agent_number IN(substr(NEW.from_uri,locate(":",NEW.from_uri)+1,locate("@",NEW.from_uri)-locate(":",NEW.from_uri)-1),substr(NEW.to_uri,locate(":",NEW.to_uri)+1,locate("@",NEW.to_uri)-locate(":",NEW.to_uri)-1));

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dialog_vars`
--

CREATE TABLE `dialog_vars` (
  `id` int UNSIGNED NOT NULL,
  `hash_entry` int UNSIGNED NOT NULL,
  `hash_id` int UNSIGNED NOT NULL,
  `dialog_key` varchar(128) NOT NULL,
  `dialog_value` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dialplan`
--

CREATE TABLE `dialplan` (
  `id` int UNSIGNED NOT NULL,
  `dpid` int NOT NULL,
  `pr` int NOT NULL,
  `match_op` int NOT NULL,
  `match_exp` varchar(64) NOT NULL,
  `match_len` int NOT NULL,
  `subst_exp` varchar(64) NOT NULL,
  `repl_exp` varchar(256) NOT NULL,
  `attrs` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher`
--

CREATE TABLE `dispatcher` (
  `id` int UNSIGNED NOT NULL,
  `setid` int NOT NULL DEFAULT '0',
  `destination` varchar(192) NOT NULL DEFAULT '',
  `flags` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `attrs` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `id` int UNSIGNED NOT NULL,
  `domain` varchar(64) NOT NULL,
  `did` varchar(64) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domainpolicy`
--

CREATE TABLE `domainpolicy` (
  `id` int UNSIGNED NOT NULL,
  `rule` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `att` varchar(255) DEFAULT NULL,
  `val` varchar(128) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domain_attrs`
--

CREATE TABLE `domain_attrs` (
  `id` int UNSIGNED NOT NULL,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domain_name`
--

CREATE TABLE `domain_name` (
  `id` int UNSIGNED NOT NULL,
  `domain` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dr_gateways`
--

CREATE TABLE `dr_gateways` (
  `gwid` int UNSIGNED NOT NULL,
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(128) NOT NULL,
  `strip` int UNSIGNED NOT NULL DEFAULT '0',
  `pri_prefix` varchar(64) DEFAULT NULL,
  `attrs` varchar(255) DEFAULT NULL,
  `description` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dr_groups`
--

CREATE TABLE `dr_groups` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `domain` varchar(128) NOT NULL DEFAULT '',
  `groupid` int UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dr_gw_lists`
--

CREATE TABLE `dr_gw_lists` (
  `id` int UNSIGNED NOT NULL,
  `gwlist` varchar(255) NOT NULL,
  `description` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dr_rules`
--

CREATE TABLE `dr_rules` (
  `ruleid` int UNSIGNED NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `prefix` varchar(64) NOT NULL,
  `timerec` varchar(255) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `routeid` varchar(64) NOT NULL,
  `gwlist` varchar(255) NOT NULL,
  `description` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint NOT NULL,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `globalblocklist`
--

CREATE TABLE `globalblocklist` (
  `id` int UNSIGNED NOT NULL,
  `prefix` varchar(64) NOT NULL DEFAULT '',
  `allowlist` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grp`
--

CREATE TABLE `grp` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `grp` varchar(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `htable`
--

CREATE TABLE `htable` (
  `id` int UNSIGNED NOT NULL,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int NOT NULL DEFAULT '0',
  `value_type` int NOT NULL DEFAULT '0',
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iaxfriends`
--

CREATE TABLE `iaxfriends` (
  `id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imc_members`
--

CREATE TABLE `imc_members` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `room` varchar(64) NOT NULL,
  `flag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imc_rooms`
--

CREATE TABLE `imc_rooms` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `flag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lan1_report`
--

CREATE TABLE `lan1_report` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime DEFAULT NULL,
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realdst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(50) DEFAULT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `agent` varchar(20) DEFAULT NULL,
  `queue_event` text,
  `case_id` tinyint NOT NULL DEFAULT '0',
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` int NOT NULL,
  `peeraccount` varchar(50) NOT NULL,
  `answer` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sequence` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lan2_report`
--

CREATE TABLE `lan2_report` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime DEFAULT NULL,
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realdst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(50) DEFAULT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `agent` varchar(20) DEFAULT NULL,
  `queue_event` text,
  `case_id` tinyint NOT NULL DEFAULT '0',
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` int NOT NULL,
  `peeraccount` varchar(50) NOT NULL,
  `answer` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sequence` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lan3`
--

CREATE TABLE `lan3` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime DEFAULT NULL,
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realdst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(50) DEFAULT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `agent` varchar(20) DEFAULT NULL,
  `queue_event` text,
  `case_id` tinyint NOT NULL DEFAULT '0',
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` int NOT NULL,
  `peeraccount` varchar(50) NOT NULL,
  `answer` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sequence` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lan4`
--

CREATE TABLE `lan4` (
  `recid` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Record ID',
  `calldate` datetime DEFAULT NULL,
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `realsrc` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `realdst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(50) DEFAULT NULL,
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `linkedid` varchar(32) NOT NULL,
  `userfield` varchar(20) NOT NULL,
  `agent` varchar(20) DEFAULT NULL,
  `queue_event` text,
  `case_id` tinyint NOT NULL DEFAULT '0',
  `hangup_by_trunk` tinyint NOT NULL DEFAULT '0',
  `fwcall` int NOT NULL,
  `peeraccount` varchar(50) NOT NULL,
  `answer` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sequence` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lcr_gw`
--

CREATE TABLE `lcr_gw` (
  `id` int UNSIGNED NOT NULL,
  `lcr_id` smallint UNSIGNED NOT NULL,
  `gw_name` varchar(128) DEFAULT NULL,
  `ip_addr` varchar(50) DEFAULT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `port` smallint UNSIGNED DEFAULT NULL,
  `params` varchar(64) DEFAULT NULL,
  `uri_scheme` tinyint UNSIGNED DEFAULT NULL,
  `transport` tinyint UNSIGNED DEFAULT NULL,
  `strip` tinyint UNSIGNED DEFAULT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `defunct` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lcr_rule`
--

CREATE TABLE `lcr_rule` (
  `id` int UNSIGNED NOT NULL,
  `lcr_id` smallint UNSIGNED NOT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `from_uri` varchar(64) DEFAULT NULL,
  `request_uri` varchar(64) DEFAULT NULL,
  `mt_tvalue` varchar(128) DEFAULT NULL,
  `stopper` int UNSIGNED NOT NULL DEFAULT '0',
  `enabled` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lcr_rule_target`
--

CREATE TABLE `lcr_rule_target` (
  `id` int UNSIGNED NOT NULL,
  `lcr_id` smallint UNSIGNED NOT NULL,
  `rule_id` int UNSIGNED NOT NULL,
  `gw_id` int UNSIGNED NOT NULL,
  `priority` tinyint UNSIGNED NOT NULL,
  `weight` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int UNSIGNED NOT NULL,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(512) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int NOT NULL DEFAULT '0',
  `cflags` int NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int NOT NULL DEFAULT '0',
  `server_id` int NOT NULL DEFAULT '0',
  `connection_id` int NOT NULL DEFAULT '0',
  `keepalive` int NOT NULL DEFAULT '0',
  `partition` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `location`
--
DELIMITER $$
CREATE TRIGGER `UPDATE_location` AFTER UPDATE ON `location` FOR EACH ROW BEGIN
UPDATE subscriber set contact=NEW.contact WHERE username=NEW.username;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `location_del` BEFORE DELETE ON `location` FOR EACH ROW BEGIN
UPDATE API_Auto_dialer_Queue_Agent SET pbx_status=0 where agent_number=OLD.username;
UPDATE subscriber set contact='' WHERE username=OLD.username;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `location_insert` AFTER INSERT ON `location` FOR EACH ROW BEGIN
UPDATE API_Auto_dialer_Queue_Agent SET pbx_status=1 where agent_number=NEW.username;
UPDATE subscriber set contact=NEW.contact WHERE username=NEW.username; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `location_attrs`
--

CREATE TABLE `location_attrs` (
  `id` int UNSIGNED NOT NULL,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `aname` varchar(64) NOT NULL DEFAULT '',
  `atype` int NOT NULL DEFAULT '0',
  `avalue` varchar(512) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meetme`
--

CREATE TABLE `meetme` (
  `bookid` int NOT NULL,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int DEFAULT NULL,
  `members` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `missed_calls`
--

CREATE TABLE `missed_calls` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  `time_attr` float NOT NULL,
  `src_user` varchar(64) NOT NULL DEFAULT '',
  `src_domain` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) NOT NULL DEFAULT '',
  `dst_ouser` varchar(64) NOT NULL DEFAULT '',
  `dst_user` varchar(64) NOT NULL DEFAULT '',
  `dst_domain` varchar(128) NOT NULL DEFAULT '',
  `from_str` varchar(200) NOT NULL,
  `OPS_vars` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mohqcalls`
--

CREATE TABLE `mohqcalls` (
  `id` int UNSIGNED NOT NULL,
  `mohq_id` int UNSIGNED NOT NULL,
  `call_id` varchar(100) NOT NULL,
  `call_status` int UNSIGNED NOT NULL,
  `call_from` varchar(100) NOT NULL,
  `call_contact` varchar(100) DEFAULT NULL,
  `call_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mohqueues`
--

CREATE TABLE `mohqueues` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `mohdir` varchar(100) DEFAULT NULL,
  `mohfile` varchar(100) NOT NULL,
  `debug` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtree`
--

CREATE TABLE `mtree` (
  `id` int UNSIGNED NOT NULL,
  `tprefix` varchar(32) NOT NULL DEFAULT '',
  `tvalue` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtrees`
--

CREATE TABLE `mtrees` (
  `id` int UNSIGNED NOT NULL,
  `tname` varchar(128) NOT NULL DEFAULT '',
  `tprefix` varchar(32) NOT NULL DEFAULT '',
  `tvalue` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musiconhold`
--

CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3','playlist') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `musiconhold_entry`
--

CREATE TABLE `musiconhold_entry` (
  `name` varchar(80) NOT NULL,
  `position` int NOT NULL,
  `entry` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `pdt`
--

CREATE TABLE `pdt` (
  `id` int UNSIGNED NOT NULL,
  `sdomain` varchar(255) NOT NULL,
  `prefix` varchar(32) NOT NULL,
  `domain` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pl_pipes`
--

CREATE TABLE `pl_pipes` (
  `id` int UNSIGNED NOT NULL,
  `pipeid` varchar(64) NOT NULL DEFAULT '',
  `algorithm` varchar(32) NOT NULL DEFAULT '',
  `plimit` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `presentity`
--

CREATE TABLE `presentity` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `etag` varchar(128) NOT NULL,
  `expires` int NOT NULL,
  `received_time` int NOT NULL,
  `body` blob NOT NULL,
  `sender` varchar(255) NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `ruid` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pstn_callerid`
--

CREATE TABLE `pstn_callerid` (
  `id` int NOT NULL,
  `callerid` varchar(30) NOT NULL,
  `trunk` varchar(100) NOT NULL,
  `active` int NOT NULL,
  `call_count` int NOT NULL,
  `lastcall` datetime NOT NULL,
  `route_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pstn_trunk`
-- (See below for the actual view)
--
CREATE TABLE `pstn_trunk` (
`count_callerid` bigint
,`id` decimal(32,0)
,`prefix` varchar(2)
,`trunk` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `ps_aors`
--

CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int DEFAULT '1',
  `minimum_expiration` int DEFAULT NULL,
  `remove_existing` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'yes',
  `qualify_frequency` int DEFAULT '30',
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `remove_unavailable` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_asterisk_publications`
--

CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_auths`
--

CREATE TABLE `ps_auths` (
  `id` int NOT NULL COMMENT '\r\n',
  `auth_type` enum('md5','userpass','google_oauth') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'userpass',
  `nonce_lifetime` int DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `oauth_clientid` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `md5_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `ps_auths`
--
DELIMITER $$
CREATE TRIGGER `ps_auth_md5` BEFORE INSERT ON `ps_auths` FOR EACH ROW BEGIN
SET NEW.md5_pass=MD5(NEW.`password`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ps_auth_md5_update` BEFORE UPDATE ON `ps_auths` FOR EACH ROW BEGIN
SET NEW.md5_pass=MD5(NEW.`password`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_contacts`
--

CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(511) DEFAULT NULL,
  `expiration_time` bigint DEFAULT NULL,
  `qualify_frequency` int DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(255) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_domain_aliases`
--

CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_endpoints`
--

CREATE TABLE `ps_endpoints` (
  `id` varchar(30) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default',
  `disallow` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'all',
  `allow` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'ulaw,alaw,g722,g729',
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int DEFAULT NULL,
  `cos_video` int DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int DEFAULT NULL,
  `rtp_timeout` int DEFAULT NULL,
  `rtp_timeout_hold` int DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0.0.0.0/0',
  `permit` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0.0.0.0/0',
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int DEFAULT NULL,
  `max_video_streams` int DEFAULT NULL,
  `webrtc` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'yes',
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `codec_prefs_incoming_offer` varchar(128) DEFAULT NULL,
  `codec_prefs_outgoing_offer` varchar(128) DEFAULT NULL,
  `codec_prefs_incoming_answer` varchar(128) DEFAULT NULL,
  `codec_prefs_outgoing_answer` varchar(128) DEFAULT NULL,
  `stir_shaken` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_history_info` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `allow_unauthenticated_options` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `t38_bind_udptl_to_media_address` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_endpoint_id_ips`
--

CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_globals`
--

CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int DEFAULT NULL,
  `unidentified_request_period` int DEFAULT NULL,
  `unidentified_request_prune_interval` int DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int DEFAULT NULL,
  `mwi_tps_queue_low` int DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  `use_callerid_contact` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_contact_status_on_update_registration` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `taskprocessor_overload_trigger` enum('none','global','pjsip_only') DEFAULT NULL,
  `norefersub` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_inbound_publications`
--

CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_outbound_publishes`
--

CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_registrations`
--

CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int DEFAULT NULL,
  `max_retries` int DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int DEFAULT NULL,
  `forbidden_retry_interval` int DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `support_outbound` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `contact_header_params` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_resource_list`
--

CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_subscription_persistence`
--

CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int DEFAULT NULL,
  `cseq` int DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_systems`
--

CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int DEFAULT NULL,
  `timer_b` int DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int DEFAULT NULL,
  `threadpool_auto_increment` int DEFAULT NULL,
  `threadpool_idle_timeout` int DEFAULT NULL,
  `threadpool_max_size` int DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `disable_rport` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ps_transports`
--

CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss','flow') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pua`
--

CREATE TABLE `pua` (
  `id` int UNSIGNED NOT NULL,
  `pres_uri` varchar(255) NOT NULL,
  `pres_id` varchar(255) NOT NULL,
  `event` int NOT NULL,
  `expires` int NOT NULL,
  `desired_expires` int NOT NULL,
  `flag` int NOT NULL,
  `etag` varchar(128) NOT NULL,
  `tuple_id` varchar(64) DEFAULT NULL,
  `watcher_uri` varchar(255) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `cseq` int NOT NULL,
  `record_route` text,
  `contact` varchar(255) NOT NULL,
  `remote_contact` varchar(255) NOT NULL,
  `version` int NOT NULL,
  `extra_headers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purplemap`
--

CREATE TABLE `purplemap` (
  `id` int UNSIGNED NOT NULL,
  `sip_user` varchar(255) NOT NULL,
  `ext_user` varchar(255) NOT NULL,
  `ext_prot` varchar(16) NOT NULL,
  `ext_pass` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int DEFAULT NULL,
  `announce_round_seconds` int DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int DEFAULT NULL,
  `wrapuptime` int DEFAULT NULL,
  `penaltymemberslimit` int DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int DEFAULT NULL,
  `servicelevel` int DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_members`
--

CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int DEFAULT NULL,
  `paused` int DEFAULT NULL,
  `uniqueid` int NOT NULL,
  `wrapuptime` int DEFAULT NULL,
  `ringinuse` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_rules`
--

CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_grp`
--

CREATE TABLE `re_grp` (
  `id` int UNSIGNED NOT NULL,
  `reg_exp` varchar(128) NOT NULL DEFAULT '',
  `group_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rls_presentity`
--

CREATE TABLE `rls_presentity` (
  `id` int UNSIGNED NOT NULL,
  `rlsubs_did` varchar(255) NOT NULL,
  `resource_uri` varchar(255) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `presence_state` blob NOT NULL,
  `expires` int NOT NULL,
  `updated` int NOT NULL,
  `auth_state` int NOT NULL,
  `reason` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rls_watchers`
--

CREATE TABLE `rls_watchers` (
  `id` int UNSIGNED NOT NULL,
  `presentity_uri` varchar(255) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `to_domain` varchar(64) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `event_id` varchar(64) DEFAULT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `callid` varchar(255) NOT NULL,
  `local_cseq` int NOT NULL,
  `remote_cseq` int NOT NULL,
  `contact` varchar(255) NOT NULL,
  `record_route` text,
  `expires` int NOT NULL,
  `status` int NOT NULL DEFAULT '2',
  `reason` varchar(64) NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  `socket_info` varchar(64) NOT NULL,
  `local_contact` varchar(255) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `from_domain` varchar(64) NOT NULL,
  `updated` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rtpengine`
--

CREATE TABLE `rtpengine` (
  `id` int UNSIGNED NOT NULL,
  `setid` int UNSIGNED NOT NULL DEFAULT '0',
  `url` varchar(64) NOT NULL,
  `weight` int UNSIGNED NOT NULL DEFAULT '1',
  `disabled` int NOT NULL DEFAULT '0',
  `stamp` datetime NOT NULL DEFAULT '1900-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rtpproxy`
--

CREATE TABLE `rtpproxy` (
  `id` int UNSIGNED NOT NULL,
  `setid` varchar(32) NOT NULL DEFAULT '0',
  `url` varchar(64) NOT NULL DEFAULT '',
  `flags` int NOT NULL DEFAULT '0',
  `weight` int NOT NULL DEFAULT '1',
  `description` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sca_subscriptions`
--

CREATE TABLE `sca_subscriptions` (
  `id` int UNSIGNED NOT NULL,
  `subscriber` varchar(255) NOT NULL,
  `aor` varchar(255) NOT NULL,
  `event` int NOT NULL DEFAULT '0',
  `expires` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `app_idx` int NOT NULL DEFAULT '0',
  `call_id` varchar(255) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `record_route` text,
  `notify_cseq` int NOT NULL,
  `subscribe_cseq` int NOT NULL,
  `server_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `secfilter`
--

CREATE TABLE `secfilter` (
  `id` int UNSIGNED NOT NULL,
  `action` smallint NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  `data` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `silo`
--

CREATE TABLE `silo` (
  `id` int UNSIGNED NOT NULL,
  `src_addr` varchar(255) NOT NULL DEFAULT '',
  `dst_addr` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `inc_time` int NOT NULL DEFAULT '0',
  `exp_time` int NOT NULL DEFAULT '0',
  `snd_time` int NOT NULL DEFAULT '0',
  `ctype` varchar(32) NOT NULL DEFAULT 'text/plain',
  `body` blob,
  `extra_hdrs` text,
  `callid` varchar(128) NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sippeers`
--

CREATE TABLE `sippeers` (
  `id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `regseconds` int DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int DEFAULT NULL,
  `session-minse` int DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int DEFAULT NULL,
  `rtpholdtimeout` int DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int DEFAULT NULL,
  `timerb` int DEFAULT NULL,
  `qualifyfreq` int DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int DEFAULT NULL,
  `call-limit` int DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sip_trace`
--

CREATE TABLE `sip_trace` (
  `id` int UNSIGNED NOT NULL,
  `time_stamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `time_us` int UNSIGNED NOT NULL DEFAULT '0',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `traced_user` varchar(255) NOT NULL DEFAULT '',
  `msg` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `fromip` varchar(64) NOT NULL DEFAULT '',
  `toip` varchar(64) NOT NULL DEFAULT '',
  `fromtag` varchar(128) NOT NULL DEFAULT '',
  `totag` varchar(128) NOT NULL DEFAULT '',
  `direction` varchar(4) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sip_user`
--

CREATE TABLE `sip_user` (
  `ma` int NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL,
  `active_forward` tinyint NOT NULL DEFAULT '0',
  `secret` varchar(80) DEFAULT NULL,
  `accountcode` varchar(20) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `ipaddr` varchar(45) NOT NULL,
  `computername` varchar(100) NOT NULL,
  `username` varchar(80) NOT NULL DEFAULT '',
  `useragent` varchar(50) NOT NULL DEFAULT '',
  `service_id` int NOT NULL DEFAULT '0',
  `service_name` varchar(100) NOT NULL,
  `license_id` int NOT NULL,
  `license_key` varchar(50) NOT NULL,
  `date_update` datetime NOT NULL,
  `passlogin_portal` varchar(50) NOT NULL,
  `agent_group_id` int NOT NULL,
  `agent_group_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_leader` tinyint NOT NULL,
  `header` varchar(100) NOT NULL,
  `webrtc` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Triggers `sip_user`
--
DELIMITER $$
CREATE TRIGGER `del_pjsip` BEFORE DELETE ON `sip_user` FOR EACH ROW BEGIN
DELETE FROM ps_aors where id=OLD.name;
DELETE FROM ps_auths where id=OLD.name;
DELETE FROM ps_endpoints where id=OLD.name;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pjsip_add` AFTER INSERT ON `sip_user` FOR EACH ROW BEGIN
INSERT IGNORE INTO ps_aors SET id=NEW.name;
INSERT IGNORE INTO ps_auths SET id=NEW.name,username=NEW.name, password=NEW.secret;
INSERT IGNORE INTO ps_endpoints SET id=NEW.name, aors=NEW.name, auth=NEW.name,webrtc=NEW.webrtc;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_pjsip` AFTER UPDATE ON `sip_user` FOR EACH ROW BEGIN
UPDATE ps_aors SET id=NEW.name where id=OLD.name;
UPDATE ps_auths SET id=NEW.name,username=NEW.name, password=NEW.secret where id=OLD.name;
UPDATE ps_endpoints SET id=NEW.name, aors=NEW.name, auth=NEW.name,webrtc=NEW.webrtc where id=OLD.name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `speed_dial`
--

CREATE TABLE `speed_dial` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `sd_username` varchar(64) NOT NULL DEFAULT '',
  `sd_domain` varchar(64) NOT NULL DEFAULT '',
  `new_uri` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(64) NOT NULL DEFAULT '',
  `lname` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `callerName` varchar(200) NOT NULL,
  `ID_nhansu` varchar(50) NOT NULL,
  `domain` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `ha1` varchar(128) NOT NULL DEFAULT '',
  `ha1b` varchar(128) NOT NULL DEFAULT '',
  `group_id` int NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `service_id` int NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `md5_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `subscriber`
--
DELIMITER $$
CREATE TRIGGER `sub_del` AFTER DELETE ON `subscriber` FOR EACH ROW BEGIN
DELETE FROM API_Auto_dialer_Queue_Agent where  agent_number=OLD.username;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sub_insert` BEFORE INSERT ON `subscriber` FOR EACH ROW BEGIN
INSERT IGNORE INTO API_Auto_dialer_Queue_Agent SET agent_number=NEW.username;
SET NEW.md5_pass=MD5(NEW.`password`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sub_update_before` BEFORE UPDATE ON `subscriber` FOR EACH ROW BEGIN
SET NEW.md5_pass=MD5(NEW.`password`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_group`
--

CREATE TABLE `subscriber_group` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `ghichu` varchar(200) NOT NULL,
  `service_id` int NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `total` int NOT NULL,
  `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `subscriber_group`
--
DELIMITER $$
CREATE TRIGGER `subscriber_group_update` AFTER UPDATE ON `subscriber_group` FOR EACH ROW BEGIN
UPDATE subscriber set group_name=NEW.name where group_id=NEW.id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `temp_log`
--

CREATE TABLE `temp_log` (
  `id` int NOT NULL,
  `cdrId` varchar(30) NOT NULL,
  `status_desc` varchar(100) NOT NULL,
  `hangupAt` datetime NOT NULL,
  `hangup_code` int NOT NULL,
  `to` varchar(30) NOT NULL,
  `customerId` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tem_cdr`
--

CREATE TABLE `tem_cdr` (
  `date` date NOT NULL,
  `callerid` bigint NOT NULL,
  `billsec` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topos_d`
--

CREATE TABLE `topos_d` (
  `id` int UNSIGNED NOT NULL,
  `rectime` datetime NOT NULL,
  `x_context` varchar(64) NOT NULL DEFAULT '',
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_rr` mediumtext,
  `b_rr` mediumtext,
  `s_rr` mediumtext,
  `iflags` int UNSIGNED NOT NULL DEFAULT '0',
  `a_uri` varchar(255) NOT NULL DEFAULT '',
  `b_uri` varchar(255) NOT NULL DEFAULT '',
  `r_uri` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topos_t`
--

CREATE TABLE `topos_t` (
  `id` int UNSIGNED NOT NULL,
  `rectime` datetime NOT NULL,
  `x_context` varchar(64) NOT NULL DEFAULT '',
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `direction` int NOT NULL DEFAULT '0',
  `x_via` mediumtext,
  `x_vbranch` varchar(255) NOT NULL DEFAULT '',
  `x_rr` mediumtext,
  `y_rr` mediumtext,
  `s_rr` mediumtext,
  `x_uri` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `x_tag` varchar(255) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trusted`
--

CREATE TABLE `trusted` (
  `id` int UNSIGNED NOT NULL,
  `src_ip` varchar(50) NOT NULL,
  `proto` varchar(4) NOT NULL,
  `from_pattern` varchar(64) DEFAULT NULL,
  `ruri_pattern` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uacreg`
--

CREATE TABLE `uacreg` (
  `id` int UNSIGNED NOT NULL,
  `l_uuid` varchar(64) NOT NULL DEFAULT '',
  `l_username` varchar(64) NOT NULL DEFAULT '',
  `l_domain` varchar(64) NOT NULL DEFAULT '',
  `r_username` varchar(64) NOT NULL DEFAULT '',
  `r_domain` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) NOT NULL DEFAULT '',
  `auth_username` varchar(64) NOT NULL DEFAULT '',
  `auth_password` varchar(64) NOT NULL DEFAULT '',
  `auth_ha1` varchar(128) NOT NULL DEFAULT '',
  `auth_proxy` varchar(255) NOT NULL DEFAULT '',
  `expires` int NOT NULL DEFAULT '0',
  `flags` int NOT NULL DEFAULT '0',
  `reg_delay` int NOT NULL DEFAULT '0',
  `contact_addr` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_credentials`
--

CREATE TABLE `uid_credentials` (
  `id` int UNSIGNED NOT NULL,
  `auth_username` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL DEFAULT '_default',
  `realm` varchar(64) NOT NULL,
  `password` varchar(28) NOT NULL DEFAULT '',
  `flags` int NOT NULL DEFAULT '0',
  `ha1` varchar(32) NOT NULL,
  `ha1b` varchar(32) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_domain`
--

CREATE TABLE `uid_domain` (
  `id` int UNSIGNED NOT NULL,
  `did` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_domain_attrs`
--

CREATE TABLE `uid_domain_attrs` (
  `id` int UNSIGNED NOT NULL,
  `did` varchar(64) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `value` varchar(128) DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_global_attrs`
--

CREATE TABLE `uid_global_attrs` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `value` varchar(128) DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_uri`
--

CREATE TABLE `uid_uri` (
  `id` int UNSIGNED NOT NULL,
  `uid` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `scheme` varchar(8) NOT NULL DEFAULT 'sip'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_uri_attrs`
--

CREATE TABLE `uid_uri_attrs` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `scheme` varchar(8) NOT NULL DEFAULT 'sip'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uid_user_attrs`
--

CREATE TABLE `uid_user_attrs` (
  `id` int UNSIGNED NOT NULL,
  `uid` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uri`
--

CREATE TABLE `uri` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `uri_user` varchar(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `group_id` int NOT NULL,
  `group_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `services` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `profile_image` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'image/avtar.png',
  `extension` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `loggedin` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `last_login_date` datetime NOT NULL,
  `last_logout_date` datetime NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `header` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userblocklist`
--

CREATE TABLE `userblocklist` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `prefix` varchar(64) NOT NULL DEFAULT '',
  `allowlist` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Triggers `user_group`
--
DELIMITER $$
CREATE TRIGGER `user_group_update` AFTER UPDATE ON `user_group` FOR EACH ROW update `user` set group_name=NEW.`name`, services=NEW.`services` where group_id=NEW.id
$$
DELIMITER ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Triggers `user_role`
--
DELIMITER $$
CREATE TRIGGER `user_role_update` AFTER UPDATE ON `user_role` FOR EACH ROW UPDATE `user` SET `role_name`=NEW.name, `path`=NEW.path where `role_id`=NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usr_preferences`
--

CREATE TABLE `usr_preferences` (
  `id` int UNSIGNED NOT NULL,
  `uuid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '0',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `type` int NOT NULL DEFAULT '0',
  `value` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(32) NOT NULL,
  `table_version` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voicemail`
--

CREATE TABLE `voicemail` (
  `uniqueid` int NOT NULL,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watchers`
--

CREATE TABLE `watchers` (
  `id` int UNSIGNED NOT NULL,
  `presentity_uri` varchar(255) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `status` int NOT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `inserted_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xcap`
--

CREATE TABLE `xcap` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `doc` mediumblob NOT NULL,
  `doc_type` int NOT NULL,
  `etag` varchar(128) NOT NULL,
  `source` int NOT NULL,
  `doc_uri` varchar(255) NOT NULL,
  `port` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `agent_report_lastcall`
--
DROP TABLE IF EXISTS `agent_report_lastcall`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agent_report_lastcall`  AS SELECT `API_Auto_dialer_Queue_Agent`.`id` AS `id`, `API_Auto_dialer_Queue_Agent`.`agent_number` AS `agent_number`, `API_Auto_dialer_Queue_Agent`.`agent_flex_status` AS `agent_flex_status`, `API_Auto_dialer_Queue_Agent`.`pbx_status` AS `pbx_status`, `API_Auto_dialer_Queue_Agent`.`agent_total_calls` AS `agent_total_calls`, `API_Auto_dialer_Queue_Agent`.`queue_code` AS `queue_code`, if((`API_Auto_dialer_Queue_Agent`.`lastcall` <> '0000-00-00 00:00:00'),timediff(`API_Auto_dialer_Queue_Agent`.`lastcall`,now()),0) AS `lastcall_time` FROM `API_Auto_dialer_Queue_Agent` ;

-- --------------------------------------------------------

--
-- Structure for view `pstn_trunk`
--
DROP TABLE IF EXISTS `pstn_trunk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pstn_trunk`  AS SELECT `pstn_callerid`.`trunk` AS `trunk`, count(0) AS `count_callerid`, sum(`pstn_callerid`.`active`) AS `id`, substr(`pstn_callerid`.`callerid`,1,2) AS `prefix` FROM `pstn_callerid` GROUP BY `pstn_callerid`.`trunk`, substr(`pstn_callerid`.`callerid`,1,2) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc`
--
ALTER TABLE `acc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callid_idx` (`callid`);

--
-- Indexes for table `acc_cdrs`
--
ALTER TABLE `acc_cdrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_time_idx` (`start_time`);

--
-- Indexes for table `active_watchers`
--
ALTER TABLE `active_watchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `active_watchers_idx` (`callid`,`to_tag`,`from_tag`),
  ADD KEY `active_watchers_expires` (`expires`),
  ADD KEY `active_watchers_pres` (`presentity_uri`,`event`),
  ADD KEY `updated_idx` (`updated`),
  ADD KEY `updated_winfo_idx` (`updated_winfo`,`presentity_uri`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `alembic_version_config`
--
ALTER TABLE `alembic_version_config`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `aliases`
--
ALTER TABLE `aliases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruid_idx` (`ruid`),
  ADD KEY `account_contact_idx` (`username`,`domain`,`contact`),
  ADD KEY `expires_idx` (`expires`);

--
-- Indexes for table `AMC_monitor`
--
ALTER TABLE `AMC_monitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `API_Auto_dialer_Queues`
--
ALTER TABLE `API_Auto_dialer_Queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`queue_code`);

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
-- Indexes for table `API_Auto_dialer_Queue_Customers`
--
ALTER TABLE `API_Auto_dialer_Queue_Customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `queue_code` (`queue_code`,`customer_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD KEY `uniqueid` (`uniqueid`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `agent_connected` (`agent_connected`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `API_log_call`
--
ALTER TABLE `API_log_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `API_log_request`
--
ALTER TABLE `API_log_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carrierfailureroute`
--
ALTER TABLE `carrierfailureroute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carrierroute`
--
ALTER TABLE `carrierroute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carrier_name`
--
ALTER TABLE `carrier_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdr`
--
ALTER TABLE `cdr`
  ADD PRIMARY KEY (`recid`),
  ADD KEY `calldate` (`calldate`),
  ADD KEY `src` (`src`),
  ADD KEY `dst` (`dst`),
  ADD KEY `update_solr` (`update_solr`),
  ADD KEY `update_solr_bill` (`update_solr_bill`),
  ADD KEY `agent` (`agent`);

--
-- Indexes for table `cdr_07_24`
--
ALTER TABLE `cdr_07_24`
  ADD PRIMARY KEY (`recid`),
  ADD UNIQUE KEY `uniqueid_2` (`uniqueid`),
  ADD KEY `calldate` (`calldate`),
  ADD KEY `dst` (`dst`),
  ADD KEY `accountcode` (`accountcode`),
  ADD KEY `src` (`src`),
  ADD KEY `disposition` (`disposition`),
  ADD KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `check`
--
ALTER TABLE `check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_call`
--
ALTER TABLE `check_call`
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
-- Indexes for table `config_license_bria`
--
ALTER TABLE `config_license_bria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_services`
--
ALTER TABLE `config_services`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `cpl`
--
ALTER TABLE `cpl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_idx` (`username`,`domain`);

--
-- Indexes for table `dbaliases`
--
ALTER TABLE `dbaliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias_user_idx` (`alias_username`),
  ADD KEY `alias_idx` (`alias_username`,`alias_domain`),
  ADD KEY `target_idx` (`username`,`domain`);

--
-- Indexes for table `dialog`
--
ALTER TABLE `dialog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash_idx` (`hash_entry`,`hash_id`);

--
-- Indexes for table `dialog_vars`
--
ALTER TABLE `dialog_vars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash_idx` (`hash_entry`,`hash_id`);

--
-- Indexes for table `dialplan`
--
ALTER TABLE `dialplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain_idx` (`domain`);

--
-- Indexes for table `domainpolicy`
--
ALTER TABLE `domainpolicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rav_idx` (`rule`,`att`,`val`),
  ADD KEY `rule_idx` (`rule`);

--
-- Indexes for table `domain_attrs`
--
ALTER TABLE `domain_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_attrs_idx` (`did`,`name`);

--
-- Indexes for table `domain_name`
--
ALTER TABLE `domain_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dr_gateways`
--
ALTER TABLE `dr_gateways`
  ADD PRIMARY KEY (`gwid`);

--
-- Indexes for table `dr_groups`
--
ALTER TABLE `dr_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dr_gw_lists`
--
ALTER TABLE `dr_gw_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dr_rules`
--
ALTER TABLE `dr_rules`
  ADD PRIMARY KEY (`ruleid`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `context` (`context`,`exten`,`priority`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `globalblocklist`
--
ALTER TABLE `globalblocklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalblocklist_idx` (`prefix`);

--
-- Indexes for table `grp`
--
ALTER TABLE `grp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_group_idx` (`username`,`domain`,`grp`);

--
-- Indexes for table `htable`
--
ALTER TABLE `htable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iaxfriends`
--
ALTER TABLE `iaxfriends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `iaxfriends_name` (`name`),
  ADD KEY `iaxfriends_name_host` (`name`,`host`),
  ADD KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  ADD KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  ADD KEY `iaxfriends_host_port` (`host`,`port`);

--
-- Indexes for table `imc_members`
--
ALTER TABLE `imc_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_room_idx` (`username`,`domain`,`room`);

--
-- Indexes for table `imc_rooms`
--
ALTER TABLE `imc_rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_domain_idx` (`name`,`domain`);

--
-- Indexes for table `lcr_gw`
--
ALTER TABLE `lcr_gw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lcr_id_idx` (`lcr_id`);

--
-- Indexes for table `lcr_rule`
--
ALTER TABLE `lcr_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lcr_id_prefix_from_uri_idx` (`lcr_id`,`prefix`,`from_uri`);

--
-- Indexes for table `lcr_rule_target`
--
ALTER TABLE `lcr_rule_target`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rule_id_gw_id_idx` (`rule_id`,`gw_id`),
  ADD KEY `lcr_id_idx` (`lcr_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruid_idx` (`ruid`),
  ADD KEY `account_contact_idx` (`username`,`domain`,`contact`),
  ADD KEY `expires_idx` (`expires`),
  ADD KEY `connection_idx` (`server_id`,`connection_id`);

--
-- Indexes for table `location_attrs`
--
ALTER TABLE `location_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_record_idx` (`username`,`domain`,`ruid`),
  ADD KEY `last_modified_idx` (`last_modified`);

--
-- Indexes for table `meetme`
--
ALTER TABLE `meetme`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`);

--
-- Indexes for table `missed_calls`
--
ALTER TABLE `missed_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callid_idx` (`callid`);

--
-- Indexes for table `mohqcalls`
--
ALTER TABLE `mohqcalls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mohqcalls_idx` (`call_id`);

--
-- Indexes for table `mohqueues`
--
ALTER TABLE `mohqueues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mohqueue_uri_idx` (`uri`),
  ADD UNIQUE KEY `mohqueue_name_idx` (`name`);

--
-- Indexes for table `mtree`
--
ALTER TABLE `mtree`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tprefix_idx` (`tprefix`);

--
-- Indexes for table `mtrees`
--
ALTER TABLE `mtrees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tname_tprefix_tvalue_idx` (`tname`,`tprefix`,`tvalue`);

--
-- Indexes for table `musiconhold`
--
ALTER TABLE `musiconhold`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `musiconhold_entry`
--
ALTER TABLE `musiconhold_entry`
  ADD PRIMARY KEY (`name`,`position`);

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
-- Indexes for table `pdt`
--
ALTER TABLE `pdt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sdomain_prefix_idx` (`sdomain`,`prefix`);

--
-- Indexes for table `pl_pipes`
--
ALTER TABLE `pl_pipes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `presentity`
--
ALTER TABLE `presentity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presentity_idx` (`username`,`domain`,`event`,`etag`),
  ADD UNIQUE KEY `ruid_idx` (`ruid`),
  ADD KEY `presentity_expires` (`expires`),
  ADD KEY `account_idx` (`username`,`domain`,`event`);

--
-- Indexes for table `pstn_callerid`
--
ALTER TABLE `pstn_callerid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callerid` (`callerid`),
  ADD KEY `trunk` (`trunk`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `ps_aors`
--
ALTER TABLE `ps_aors`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_aors_id` (`id`),
  ADD KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`);

--
-- Indexes for table `ps_asterisk_publications`
--
ALTER TABLE `ps_asterisk_publications`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_asterisk_publications_id` (`id`);

--
-- Indexes for table `ps_auths`
--
ALTER TABLE `ps_auths`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_auths_id` (`id`);

--
-- Indexes for table `ps_contacts`
--
ALTER TABLE `ps_contacts`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  ADD KEY `ps_contacts_id` (`id`),
  ADD KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`);

--
-- Indexes for table `ps_domain_aliases`
--
ALTER TABLE `ps_domain_aliases`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_domain_aliases_id` (`id`);

--
-- Indexes for table `ps_endpoints`
--
ALTER TABLE `ps_endpoints`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_endpoints_id` (`id`);

--
-- Indexes for table `ps_endpoint_id_ips`
--
ALTER TABLE `ps_endpoint_id_ips`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_endpoint_id_ips_id` (`id`);

--
-- Indexes for table `ps_globals`
--
ALTER TABLE `ps_globals`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_globals_id` (`id`);

--
-- Indexes for table `ps_inbound_publications`
--
ALTER TABLE `ps_inbound_publications`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_inbound_publications_id` (`id`);

--
-- Indexes for table `ps_outbound_publishes`
--
ALTER TABLE `ps_outbound_publishes`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_outbound_publishes_id` (`id`);

--
-- Indexes for table `ps_registrations`
--
ALTER TABLE `ps_registrations`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_registrations_id` (`id`);

--
-- Indexes for table `ps_resource_list`
--
ALTER TABLE `ps_resource_list`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_resource_list_id` (`id`);

--
-- Indexes for table `ps_subscription_persistence`
--
ALTER TABLE `ps_subscription_persistence`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_subscription_persistence_id` (`id`);

--
-- Indexes for table `ps_systems`
--
ALTER TABLE `ps_systems`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_systems_id` (`id`);

--
-- Indexes for table `ps_transports`
--
ALTER TABLE `ps_transports`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_transports_id` (`id`);

--
-- Indexes for table `pua`
--
ALTER TABLE `pua`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pua_idx` (`etag`,`tuple_id`,`call_id`,`from_tag`),
  ADD KEY `expires_idx` (`expires`),
  ADD KEY `dialog1_idx` (`pres_id`,`pres_uri`),
  ADD KEY `dialog2_idx` (`call_id`,`from_tag`),
  ADD KEY `record_idx` (`pres_id`);

--
-- Indexes for table `purplemap`
--
ALTER TABLE `purplemap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `queue_members`
--
ALTER TABLE `queue_members`
  ADD PRIMARY KEY (`queue_name`,`interface`),
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `re_grp`
--
ALTER TABLE `re_grp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_idx` (`group_id`);

--
-- Indexes for table `rls_presentity`
--
ALTER TABLE `rls_presentity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rls_presentity_idx` (`rlsubs_did`,`resource_uri`),
  ADD KEY `rlsubs_idx` (`rlsubs_did`),
  ADD KEY `updated_idx` (`updated`),
  ADD KEY `expires_idx` (`expires`);

--
-- Indexes for table `rls_watchers`
--
ALTER TABLE `rls_watchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rls_watcher_idx` (`callid`,`to_tag`,`from_tag`),
  ADD KEY `rls_watchers_update` (`watcher_username`,`watcher_domain`,`event`),
  ADD KEY `rls_watchers_expires` (`expires`),
  ADD KEY `updated_idx` (`updated`);

--
-- Indexes for table `rtpengine`
--
ALTER TABLE `rtpengine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rtpengine_nodes` (`setid`,`url`);

--
-- Indexes for table `rtpproxy`
--
ALTER TABLE `rtpproxy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sca_subscriptions`
--
ALTER TABLE `sca_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sca_subscriptions_idx` (`subscriber`,`call_id`,`from_tag`,`to_tag`),
  ADD KEY `sca_expires_idx` (`server_id`,`expires`),
  ADD KEY `sca_subscribers_idx` (`subscriber`,`event`);

--
-- Indexes for table `secfilter`
--
ALTER TABLE `secfilter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `secfilter_idx` (`action`,`type`,`data`);

--
-- Indexes for table `silo`
--
ALTER TABLE `silo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_idx` (`username`,`domain`);

--
-- Indexes for table `sippeers`
--
ALTER TABLE `sippeers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `sippeers_name` (`name`),
  ADD KEY `sippeers_name_host` (`name`,`host`),
  ADD KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  ADD KEY `sippeers_host_port` (`host`,`port`);

--
-- Indexes for table `sip_trace`
--
ALTER TABLE `sip_trace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traced_user_idx` (`traced_user`),
  ADD KEY `date_idx` (`time_stamp`),
  ADD KEY `fromip_idx` (`fromip`),
  ADD KEY `callid_idx` (`callid`);

--
-- Indexes for table `sip_user`
--
ALTER TABLE `sip_user`
  ADD PRIMARY KEY (`ma`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `speed_dial`
--
ALTER TABLE `speed_dial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `speed_dial_idx` (`username`,`domain`,`sd_domain`,`sd_username`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_idx` (`username`,`domain`),
  ADD KEY `username_idx` (`username`);

--
-- Indexes for table `subscriber_group`
--
ALTER TABLE `subscriber_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_log`
--
ALTER TABLE `temp_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topos_d`
--
ALTER TABLE `topos_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rectime_idx` (`rectime`),
  ADD KEY `a_callid_idx` (`a_callid`),
  ADD KEY `a_uuid_idx` (`a_uuid`),
  ADD KEY `b_uuid_idx` (`b_uuid`);

--
-- Indexes for table `topos_t`
--
ALTER TABLE `topos_t`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rectime_idx` (`rectime`),
  ADD KEY `a_callid_idx` (`a_callid`),
  ADD KEY `x_vbranch_idx` (`x_vbranch`),
  ADD KEY `a_uuid_idx` (`a_uuid`);

--
-- Indexes for table `trusted`
--
ALTER TABLE `trusted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peer_idx` (`src_ip`);

--
-- Indexes for table `uacreg`
--
ALTER TABLE `uacreg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `l_uuid_idx` (`l_uuid`);

--
-- Indexes for table `uid_credentials`
--
ALTER TABLE `uid_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cred_idx` (`auth_username`,`did`),
  ADD KEY `uid` (`uid`),
  ADD KEY `did_idx` (`did`),
  ADD KEY `realm_idx` (`realm`);

--
-- Indexes for table `uid_domain`
--
ALTER TABLE `uid_domain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain_idx` (`domain`),
  ADD KEY `did_idx` (`did`);

--
-- Indexes for table `uid_domain_attrs`
--
ALTER TABLE `uid_domain_attrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain_attr_idx` (`did`,`name`,`value`),
  ADD KEY `domain_did` (`did`,`flags`);

--
-- Indexes for table `uid_global_attrs`
--
ALTER TABLE `uid_global_attrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `global_attrs_idx` (`name`,`value`);

--
-- Indexes for table `uid_uri`
--
ALTER TABLE `uid_uri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uri_idx1` (`username`,`did`,`scheme`),
  ADD KEY `uri_uid` (`uid`);

--
-- Indexes for table `uid_uri_attrs`
--
ALTER TABLE `uid_uri_attrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uriattrs_idx` (`username`,`did`,`name`,`value`,`scheme`);

--
-- Indexes for table `uid_user_attrs`
--
ALTER TABLE `uid_user_attrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userattrs_idx` (`uid`,`name`,`value`);

--
-- Indexes for table `uri`
--
ALTER TABLE `uri`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_idx` (`username`,`domain`,`uri_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `userblocklist`
--
ALTER TABLE `userblocklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userblocklist_idx` (`username`,`domain`,`prefix`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usr_preferences`
--
ALTER TABLE `usr_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ua_idx` (`uuid`,`attribute`),
  ADD KEY `uda_idx` (`username`,`domain`,`attribute`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_name_idx` (`table_name`);

--
-- Indexes for table `vip_list`
--
ALTER TABLE `vip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voicemail`
--
ALTER TABLE `voicemail`
  ADD PRIMARY KEY (`uniqueid`),
  ADD KEY `voicemail_mailbox` (`mailbox`),
  ADD KEY `voicemail_context` (`context`),
  ADD KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  ADD KEY `voicemail_imapuser` (`imapuser`);

--
-- Indexes for table `watchers`
--
ALTER TABLE `watchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `watcher_idx` (`presentity_uri`,`watcher_username`,`watcher_domain`,`event`);

--
-- Indexes for table `xcap`
--
ALTER TABLE `xcap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doc_uri_idx` (`doc_uri`),
  ADD KEY `account_doc_type_idx` (`username`,`domain`,`doc_type`),
  ADD KEY `account_doc_type_uri_idx` (`username`,`domain`,`doc_type`,`doc_uri`),
  ADD KEY `account_doc_uri_idx` (`username`,`domain`,`doc_uri`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc`
--
ALTER TABLE `acc`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_cdrs`
--
ALTER TABLE `acc_cdrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `active_watchers`
--
ALTER TABLE `active_watchers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `aliases`
--
ALTER TABLE `aliases`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AMC_monitor`
--
ALTER TABLE `AMC_monitor`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `API_Auto_dialer_Queue_Customers`
--
ALTER TABLE `API_Auto_dialer_Queue_Customers`
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
-- AUTO_INCREMENT for table `carrierfailureroute`
--
ALTER TABLE `carrierfailureroute`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrierroute`
--
ALTER TABLE `carrierroute`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrier_name`
--
ALTER TABLE `carrier_name`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdr`
--
ALTER TABLE `cdr`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `cdr_07_24`
--
ALTER TABLE `cdr_07_24`
  MODIFY `recid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `check`
--
ALTER TABLE `check`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `check_call`
--
ALTER TABLE `check_call`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `cpl`
--
ALTER TABLE `cpl`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbaliases`
--
ALTER TABLE `dbaliases`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dialog`
--
ALTER TABLE `dialog`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dialog_vars`
--
ALTER TABLE `dialog_vars`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dialplan`
--
ALTER TABLE `dialplan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatcher`
--
ALTER TABLE `dispatcher`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domain`
--
ALTER TABLE `domain`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domainpolicy`
--
ALTER TABLE `domainpolicy`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domain_attrs`
--
ALTER TABLE `domain_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domain_name`
--
ALTER TABLE `domain_name`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dr_gateways`
--
ALTER TABLE `dr_gateways`
  MODIFY `gwid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dr_groups`
--
ALTER TABLE `dr_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dr_gw_lists`
--
ALTER TABLE `dr_gw_lists`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dr_rules`
--
ALTER TABLE `dr_rules`
  MODIFY `ruleid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalblocklist`
--
ALTER TABLE `globalblocklist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grp`
--
ALTER TABLE `grp`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `htable`
--
ALTER TABLE `htable`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iaxfriends`
--
ALTER TABLE `iaxfriends`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imc_members`
--
ALTER TABLE `imc_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imc_rooms`
--
ALTER TABLE `imc_rooms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lcr_gw`
--
ALTER TABLE `lcr_gw`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lcr_rule`
--
ALTER TABLE `lcr_rule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lcr_rule_target`
--
ALTER TABLE `lcr_rule_target`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_attrs`
--
ALTER TABLE `location_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetme`
--
ALTER TABLE `meetme`
  MODIFY `bookid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `missed_calls`
--
ALTER TABLE `missed_calls`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mohqcalls`
--
ALTER TABLE `mohqcalls`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mohqueues`
--
ALTER TABLE `mohqueues`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtree`
--
ALTER TABLE `mtree`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mtrees`
--
ALTER TABLE `mtrees`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `pdt`
--
ALTER TABLE `pdt`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pl_pipes`
--
ALTER TABLE `pl_pipes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `presentity`
--
ALTER TABLE `presentity`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pstn_callerid`
--
ALTER TABLE `pstn_callerid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ps_auths`
--
ALTER TABLE `ps_auths`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '\r\n';

--
-- AUTO_INCREMENT for table `pua`
--
ALTER TABLE `pua`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purplemap`
--
ALTER TABLE `purplemap`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_members`
--
ALTER TABLE `queue_members`
  MODIFY `uniqueid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_grp`
--
ALTER TABLE `re_grp`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rls_presentity`
--
ALTER TABLE `rls_presentity`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rls_watchers`
--
ALTER TABLE `rls_watchers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rtpengine`
--
ALTER TABLE `rtpengine`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rtpproxy`
--
ALTER TABLE `rtpproxy`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sca_subscriptions`
--
ALTER TABLE `sca_subscriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secfilter`
--
ALTER TABLE `secfilter`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `silo`
--
ALTER TABLE `silo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sippeers`
--
ALTER TABLE `sippeers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sip_trace`
--
ALTER TABLE `sip_trace`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sip_user`
--
ALTER TABLE `sip_user`
  MODIFY `ma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speed_dial`
--
ALTER TABLE `speed_dial`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber_group`
--
ALTER TABLE `subscriber_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_log`
--
ALTER TABLE `temp_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topos_d`
--
ALTER TABLE `topos_d`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topos_t`
--
ALTER TABLE `topos_t`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trusted`
--
ALTER TABLE `trusted`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uacreg`
--
ALTER TABLE `uacreg`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_credentials`
--
ALTER TABLE `uid_credentials`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_domain`
--
ALTER TABLE `uid_domain`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_domain_attrs`
--
ALTER TABLE `uid_domain_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_global_attrs`
--
ALTER TABLE `uid_global_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_uri`
--
ALTER TABLE `uid_uri`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_uri_attrs`
--
ALTER TABLE `uid_uri_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uid_user_attrs`
--
ALTER TABLE `uid_user_attrs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uri`
--
ALTER TABLE `uri`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userblocklist`
--
ALTER TABLE `userblocklist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usr_preferences`
--
ALTER TABLE `usr_preferences`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vip_list`
--
ALTER TABLE `vip_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voicemail`
--
ALTER TABLE `voicemail`
  MODIFY `uniqueid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watchers`
--
ALTER TABLE `watchers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xcap`
--
ALTER TABLE `xcap`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `musiconhold_entry`
--
ALTER TABLE `musiconhold_entry`
  ADD CONSTRAINT `fk_musiconhold_entry_name_musiconhold` FOREIGN KEY (`name`) REFERENCES `musiconhold` (`name`);
COMMIT;
