-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 16, 2020 at 03:16 PM
-- Server version: 5.7.30-33
-- PHP Version: 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `q2a`
--

-- --------------------------------------------------------

--
-- Table structure for table `qa_blobs`
--

CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cache`
--

CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categories`
--

CREATE TABLE `qa_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categorymetas`
--

CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_contentwords`
--

CREATE TABLE `qa_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cookies`
--

CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_categories`
--

CREATE TABLE `qa_eng_booking_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_categorymetas`
--

CREATE TABLE `qa_eng_booking_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_contentwords`
--

CREATE TABLE `qa_eng_booking_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_contentwords`
--

INSERT INTO `qa_eng_booking_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 4, 1, 'Q', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 4, 1, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_iplimits`
--

CREATE TABLE `qa_eng_booking_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_iplimits`
--

INSERT INTO `qa_eng_booking_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0x7f000001, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_options`
--

CREATE TABLE `qa_eng_booking_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_options`
--

INSERT INTO `qa_eng_booking_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_self_answer', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_q_list_size', '0'),
('avatar_q_page_q_size', '50'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '0'),
('cache_uapprovecount', '0'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_qs', 'WYSIWYG Editor'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('form_security_salt', '3fcn9ho4xmd8vmw22m75ddxl7ovci8p0'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_q_as', '10'),
('permit_anon_view_ips', '70'),
('permit_edit_q', '70'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_retag_cat', '70'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlatmod'),
('site_theme_mobile', 'SnowFlatmod'),
('site_title', 'Idosell Q&A'),
('site_url', 'http://q2a.idosell.com/'),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_pages`
--

CREATE TABLE `qa_eng_booking_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_postmetas`
--

CREATE TABLE `qa_eng_booking_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_posts`
--

CREATE TABLE `qa_eng_booking_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_posts`
--

INSERT INTO `qa_eng_booking_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 0x7f000001, NULL, NULL, 0, 0, 0, 0x7f000001, 1, 66522100000, 0, '', '2020-07-16 15:15:30', NULL, NULL, 'To jest angielsko booking', 'To jest angielski booking', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_posttags`
--

CREATE TABLE `qa_eng_booking_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_sharedevents`
--

CREATE TABLE `qa_eng_booking_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_sharedevents`
--

INSERT INTO `qa_eng_booking_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 2, '2020-07-16 15:15:30'),
('U', 2, 1, 1, NULL, 2, '2020-07-16 15:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_tagmetas`
--

CREATE TABLE `qa_eng_booking_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_tagwords`
--

CREATE TABLE `qa_eng_booking_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_titlewords`
--

CREATE TABLE `qa_eng_booking_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_titlewords`
--

INSERT INTO `qa_eng_booking_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_userevents`
--

CREATE TABLE `qa_eng_booking_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_userfavorites`
--

CREATE TABLE `qa_eng_booking_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_userlevels`
--

CREATE TABLE `qa_eng_booking_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_userlimits`
--

CREATE TABLE `qa_eng_booking_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_userlimits`
--

INSERT INTO `qa_eng_booking_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(2, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_usermetas`
--

CREATE TABLE `qa_eng_booking_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_usernotices`
--

CREATE TABLE `qa_eng_booking_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_userpoints`
--

CREATE TABLE `qa_eng_booking_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_userpoints`
--

INSERT INTO `qa_eng_booking_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(2, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_uservotes`
--

CREATE TABLE `qa_eng_booking_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_widgets`
--

CREATE TABLE `qa_eng_booking_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_booking_words`
--

CREATE TABLE `qa_eng_booking_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_booking_words`
--

INSERT INTO `qa_eng_booking_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'to', 2, 2, 0, 0),
(2, 'jest', 2, 2, 0, 0),
(3, 'angielsko', 2, 0, 0, 0),
(4, 'booking', 2, 2, 0, 0),
(5, 'angielski', 0, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_categories`
--

CREATE TABLE `qa_eng_shop_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_categorymetas`
--

CREATE TABLE `qa_eng_shop_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_contentwords`
--

CREATE TABLE `qa_eng_shop_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_contentwords`
--

INSERT INTO `qa_eng_shop_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 5, 1, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_iplimits`
--

CREATE TABLE `qa_eng_shop_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_iplimits`
--

INSERT INTO `qa_eng_shop_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0x7f000001, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_options`
--

CREATE TABLE `qa_eng_shop_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_options`
--

INSERT INTO `qa_eng_shop_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_self_answer', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_q_list_size', '0'),
('avatar_q_page_q_size', '50'),
('block_bad_usernames', 'niezalogowany'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '0'),
('cache_uapprovecount', '0'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '2'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_qs', 'WYSIWYG Editor'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('feedback_email', 'root@idosell.com'),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('form_security_salt', 'm942y32xgdqc7kd3rp62wuwd1jpngyd5'),
('from_email', 'no-reply@idosell.com'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_q_as', '10'),
('permit_anon_view_ips', '70'),
('permit_edit_q', '70'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_retag_cat', '70'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('register_notify_admin', ''),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '0'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlatmod'),
('site_theme_mobile', 'SnowFlatmod'),
('site_title', 'Idosell Pytania i odpowiedzi'),
('site_url', 'http://q2a.idosell.com/'),
('smtp_active', ''),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_qs', '1'),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_pages`
--

CREATE TABLE `qa_eng_shop_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_postmetas`
--

CREATE TABLE `qa_eng_shop_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_posts`
--

CREATE TABLE `qa_eng_shop_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_posts`
--

INSERT INTO `qa_eng_shop_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 0x7f000001, NULL, NULL, 0, 0, 0, 0x7f000001, 1, 66522100000, 0, '', '2020-07-16 15:13:46', NULL, NULL, 'To jest angielski shop', 'To jest angielski sohp', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_posttags`
--

CREATE TABLE `qa_eng_shop_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_sharedevents`
--

CREATE TABLE `qa_eng_shop_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_sharedevents`
--

INSERT INTO `qa_eng_shop_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 2, '2020-07-16 15:13:46'),
('U', 2, 1, 1, NULL, 2, '2020-07-16 15:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_tagmetas`
--

CREATE TABLE `qa_eng_shop_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_tagwords`
--

CREATE TABLE `qa_eng_shop_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_titlewords`
--

CREATE TABLE `qa_eng_shop_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_titlewords`
--

INSERT INTO `qa_eng_shop_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_userevents`
--

CREATE TABLE `qa_eng_shop_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_userfavorites`
--

CREATE TABLE `qa_eng_shop_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_userlevels`
--

CREATE TABLE `qa_eng_shop_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_userlimits`
--

CREATE TABLE `qa_eng_shop_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_userlimits`
--

INSERT INTO `qa_eng_shop_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(2, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_usermetas`
--

CREATE TABLE `qa_eng_shop_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_usernotices`
--

CREATE TABLE `qa_eng_shop_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_userpoints`
--

CREATE TABLE `qa_eng_shop_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_userpoints`
--

INSERT INTO `qa_eng_shop_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_uservotes`
--

CREATE TABLE `qa_eng_shop_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_widgets`
--

CREATE TABLE `qa_eng_shop_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_eng_shop_words`
--

CREATE TABLE `qa_eng_shop_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_eng_shop_words`
--

INSERT INTO `qa_eng_shop_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'to', 2, 2, 0, 0),
(2, 'jest', 2, 2, 0, 0),
(3, 'angielski', 2, 2, 0, 0),
(4, 'shop', 2, 0, 0, 0),
(5, 'sohp', 0, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_iplimits`
--

CREATE TABLE `qa_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_messages`
--

CREATE TABLE `qa_messages` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) UNSIGNED DEFAULT NULL,
  `touserid` int(10) UNSIGNED DEFAULT NULL,
  `fromhidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_options`
--

CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('allow_change_usernames', '1'),
('allow_login_email_only', ''),
('allow_private_messages', '1'),
('allow_user_walls', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_blobid', ''),
('avatar_default_height', ''),
('avatar_default_show', ''),
('avatar_default_width', ''),
('avatar_message_list_size', '20'),
('avatar_profile_size', '200'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_store_size', '400'),
('avatar_users_size', '30'),
('block_bad_usernames', 'niezalogowany'),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_queuedcount', ''),
('cache_tagcount', ''),
('cache_uapprovecount', '1'),
('cache_userpointscount', '2'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('confirm_user_required', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('custom_register', ''),
('custom_welcome', ''),
('db_version', '67'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('form_security_salt', 'xbfmajake8zdamyrdk6b92fmupl7tgg6'),
('from_email', 'no-reply@idosell.com'),
('home_description', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('minify_html', '1'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notice_visitor', ''),
('notice_welcome', ''),
('page_size_home', '20'),
('page_size_pms', '10'),
('page_size_wall', '10'),
('permit_delete_hidden', '40'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_view_voters_flaggers', '20'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('register_notify_admin', ''),
('register_terms', 'Wyrażam zgodę na Idosell Pytania i odpowiedzi Zasady i Warunki oraz Politykę Prywatności'),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_register', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '0'),
('show_message_history', '1'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_register_terms', '0'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlatmod'),
('site_theme_mobile', 'SnowFlatmod'),
('site_title', 'Idosell Pytania i odpowiedzi'),
('site_url', 'http://q2a.idosell.com/'),
('smtp_active', ''),
('suspend_register_users', ''),
('tags_or_categories', 'tc');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pages`
--

CREATE TABLE `qa_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_categories`
--

CREATE TABLE `qa_pol_booking_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_categorymetas`
--

CREATE TABLE `qa_pol_booking_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_contentwords`
--

CREATE TABLE `qa_pol_booking_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_contentwords`
--

INSERT INTO `qa_pol_booking_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 4, 1, 'Q', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 4, 1, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_iplimits`
--

CREATE TABLE `qa_pol_booking_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_iplimits`
--

INSERT INTO `qa_pol_booking_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0x7f000001, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_options`
--

CREATE TABLE `qa_pol_booking_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_options`
--

INSERT INTO `qa_pol_booking_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_self_answer', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_q_list_size', '0'),
('avatar_q_page_q_size', '50'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '0'),
('cache_uapprovecount', '1'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_qs', 'WYSIWYG Editor'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('form_security_salt', 'l2pxa26shldx6uwvzupgpynesvz3m1n2'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_q_as', '10'),
('permit_anon_view_ips', '70'),
('permit_delete_hidden', '40'),
('permit_edit_q', '70'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_retag_cat', '70'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlatmod'),
('site_theme_mobile', 'SnowFlatmod'),
('site_title', 'Idosell Pytania i odpowiedzi'),
('site_url', 'http://q2a.idosell.com/'),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_pages`
--

CREATE TABLE `qa_pol_booking_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_postmetas`
--

CREATE TABLE `qa_pol_booking_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_posts`
--

CREATE TABLE `qa_pol_booking_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_posts`
--

INSERT INTO `qa_pol_booking_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 0x7f000001, NULL, NULL, 0, 0, 0, 0x7f000001, 1, 66522100000, 0, '', '2020-07-16 15:16:09', NULL, NULL, 'To jest polski booking', 'To jest polski booking', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_posttags`
--

CREATE TABLE `qa_pol_booking_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_sharedevents`
--

CREATE TABLE `qa_pol_booking_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_sharedevents`
--

INSERT INTO `qa_pol_booking_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 2, '2020-07-16 15:16:09'),
('U', 2, 1, 1, NULL, 2, '2020-07-16 15:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_tagmetas`
--

CREATE TABLE `qa_pol_booking_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_tagwords`
--

CREATE TABLE `qa_pol_booking_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_titlewords`
--

CREATE TABLE `qa_pol_booking_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_titlewords`
--

INSERT INTO `qa_pol_booking_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_userevents`
--

CREATE TABLE `qa_pol_booking_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_userfavorites`
--

CREATE TABLE `qa_pol_booking_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_userlevels`
--

CREATE TABLE `qa_pol_booking_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_userlimits`
--

CREATE TABLE `qa_pol_booking_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_userlimits`
--

INSERT INTO `qa_pol_booking_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(2, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_usermetas`
--

CREATE TABLE `qa_pol_booking_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_usernotices`
--

CREATE TABLE `qa_pol_booking_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_userpoints`
--

CREATE TABLE `qa_pol_booking_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_userpoints`
--

INSERT INTO `qa_pol_booking_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(2, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_uservotes`
--

CREATE TABLE `qa_pol_booking_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_widgets`
--

CREATE TABLE `qa_pol_booking_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_booking_words`
--

CREATE TABLE `qa_pol_booking_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_booking_words`
--

INSERT INTO `qa_pol_booking_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'to', 2, 2, 0, 0),
(2, 'jest', 2, 2, 0, 0),
(3, 'polski', 2, 2, 0, 0),
(4, 'booking', 2, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_categories`
--

CREATE TABLE `qa_pol_shop_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_categorymetas`
--

CREATE TABLE `qa_pol_shop_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_contentwords`
--

CREATE TABLE `qa_pol_shop_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_contentwords`
--

INSERT INTO `qa_pol_shop_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 4, 1, 'Q', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 1, 'Q', 1),
(1, 4, 1, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_iplimits`
--

CREATE TABLE `qa_pol_shop_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_iplimits`
--

INSERT INTO `qa_pol_shop_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0x7f000001, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_options`
--

CREATE TABLE `qa_pol_shop_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_options`
--

INSERT INTO `qa_pol_shop_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_self_answer', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_q_list_size', '0'),
('avatar_q_page_q_size', '50'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '0'),
('cache_uapprovecount', '0'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_qs', 'WYSIWYG Editor'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('form_security_salt', '2hpwm4eclksxlkthplz0l4xl6smdwqia'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_is_home', ''),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_q_as', '10'),
('permit_anon_view_ips', '70'),
('permit_edit_q', '70'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_retag_cat', '70'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlatmod'),
('site_theme_mobile', 'SnowFlatmod'),
('site_title', 'Idosell Q&A'),
('site_url', 'http://q2a.idosell.com/'),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_pages`
--

CREATE TABLE `qa_pol_shop_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_postmetas`
--

CREATE TABLE `qa_pol_shop_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_posts`
--

CREATE TABLE `qa_pol_shop_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_posts`
--

INSERT INTO `qa_pol_shop_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 0x7f000001, NULL, NULL, 0, 0, 0, 0x7f000001, 1, 66522100000, 0, '', '2020-07-16 15:14:23', NULL, NULL, 'To jest polski shop', 'To jest polski shop', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_posttags`
--

CREATE TABLE `qa_pol_shop_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_sharedevents`
--

CREATE TABLE `qa_pol_shop_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_sharedevents`
--

INSERT INTO `qa_pol_shop_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 2, '2020-07-16 15:14:23'),
('U', 2, 1, 1, NULL, 2, '2020-07-16 15:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_tagmetas`
--

CREATE TABLE `qa_pol_shop_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_tagwords`
--

CREATE TABLE `qa_pol_shop_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_titlewords`
--

CREATE TABLE `qa_pol_shop_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_titlewords`
--

INSERT INTO `qa_pol_shop_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_userevents`
--

CREATE TABLE `qa_pol_shop_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_userfavorites`
--

CREATE TABLE `qa_pol_shop_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_userlevels`
--

CREATE TABLE `qa_pol_shop_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_userlimits`
--

CREATE TABLE `qa_pol_shop_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_userlimits`
--

INSERT INTO `qa_pol_shop_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(2, 'Q', 443029, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_usermetas`
--

CREATE TABLE `qa_pol_shop_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_usernotices`
--

CREATE TABLE `qa_pol_shop_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_userpoints`
--

CREATE TABLE `qa_pol_shop_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_userpoints`
--

INSERT INTO `qa_pol_shop_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(2, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_uservotes`
--

CREATE TABLE `qa_pol_shop_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_widgets`
--

CREATE TABLE `qa_pol_shop_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_pol_shop_words`
--

CREATE TABLE `qa_pol_shop_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pol_shop_words`
--

INSERT INTO `qa_pol_shop_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'to', 2, 2, 0, 0),
(2, 'jest', 2, 2, 0, 0),
(3, 'polski', 2, 2, 0, 0),
(4, 'shop', 2, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_postmetas`
--

CREATE TABLE `qa_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_posts`
--

CREATE TABLE `qa_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_posttags`
--

CREATE TABLE `qa_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_sharedevents`
--

CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagmetas`
--

CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagwords`
--

CREATE TABLE `qa_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_titlewords`
--

CREATE TABLE `qa_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userevents`
--

CREATE TABLE `qa_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfavorites`
--

CREATE TABLE `qa_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfields`
--

CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, 150),
(2, 'location', NULL, 2, 0, 150),
(3, 'website', NULL, 3, 2, 150),
(4, 'about', NULL, 4, 1, 150);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlevels`
--

CREATE TABLE `qa_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlimits`
--

CREATE TABLE `qa_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlogins`
--

CREATE TABLE `qa_userlogins` (
  `userid` int(10) UNSIGNED NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userlogins`
--

INSERT INTO `qa_userlogins` (`userid`, `source`, `identifier`, `identifiermd5`) VALUES
(2, 'IAI', 0x6e6f6e65777374656c6c6572406e6f2e706c73, 0x12a819163f669124c241d948bc87186e);

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermeta`
--

CREATE TABLE `qa_usermeta` (
  `user_id` int(11) DEFAULT NULL,
  `selected_language` varchar(3) DEFAULT NULL,
  `selected_service` varchar(7) DEFAULT NULL,
  `selected_interface_language` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qa_usermeta`
--

INSERT INTO `qa_usermeta` (`user_id`, `selected_language`, `selected_service`, `selected_interface_language`) VALUES
(2, 'pol', 'booking', 'eng');

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermetas`
--

CREATE TABLE `qa_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usernotices`
--

CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userpoints`
--

CREATE TABLE `qa_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userprofile`
--

CREATE TABLE `qa_userprofile` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userprofile`
--

INSERT INTO `qa_userprofile` (`userid`, `title`, `content`) VALUES
(2, 'name', 'mprymus');

-- --------------------------------------------------------

--
-- Table structure for table `qa_users`
--

CREATE TABLE `qa_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) UNSIGNED DEFAULT NULL,
  `avatarwidth` smallint(5) UNSIGNED DEFAULT NULL,
  `avatarheight` smallint(5) UNSIGNED DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `passhash` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `passhash`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`) VALUES
(1, '2020-07-16 14:51:26', 0x7f000001, 'root@idosell.com', 'root', NULL, NULL, NULL, NULL, NULL, '$2y$10$GtySICAATJJgP5SHf1Gkkeb//dX7hB3AaihRUdi/x7Zx/JSVPbHia', 120, '2020-07-16 14:51:26', 0x7f000001, NULL, NULL, '', 'epp5plg1', NULL, 0, 0),
(2, '2020-07-16 14:56:45', 0x7f000001, 'nonewsteller@no.pls', 'mprymus', NULL, NULL, NULL, NULL, NULL, NULL, 120, '2020-07-16 15:09:54', 0x7f000001, '2020-07-16 15:16:09', 0x7f000001, 'rnykn6wf', 'hz2agd1u', 'IAI', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_uservotes`
--

CREATE TABLE `qa_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgets`
--

CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_words`
--

CREATE TABLE `qa_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qa_blobs`
--
ALTER TABLE `qa_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `qa_cache`
--
ALTER TABLE `qa_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `qa_categories`
--
ALTER TABLE `qa_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_cookies`
--
ALTER TABLE `qa_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `qa_eng_booking_categories`
--
ALTER TABLE `qa_eng_booking_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_eng_booking_categorymetas`
--
ALTER TABLE `qa_eng_booking_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_eng_booking_contentwords`
--
ALTER TABLE `qa_eng_booking_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_booking_iplimits`
--
ALTER TABLE `qa_eng_booking_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_eng_booking_options`
--
ALTER TABLE `qa_eng_booking_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_eng_booking_pages`
--
ALTER TABLE `qa_eng_booking_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_eng_booking_postmetas`
--
ALTER TABLE `qa_eng_booking_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_eng_booking_posts`
--
ALTER TABLE `qa_eng_booking_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_eng_booking_posttags`
--
ALTER TABLE `qa_eng_booking_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_eng_booking_sharedevents`
--
ALTER TABLE `qa_eng_booking_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_eng_booking_tagmetas`
--
ALTER TABLE `qa_eng_booking_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_eng_booking_tagwords`
--
ALTER TABLE `qa_eng_booking_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_booking_titlewords`
--
ALTER TABLE `qa_eng_booking_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_booking_userevents`
--
ALTER TABLE `qa_eng_booking_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_eng_booking_userfavorites`
--
ALTER TABLE `qa_eng_booking_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_eng_booking_userlevels`
--
ALTER TABLE `qa_eng_booking_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_eng_booking_userlimits`
--
ALTER TABLE `qa_eng_booking_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_eng_booking_usermetas`
--
ALTER TABLE `qa_eng_booking_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_eng_booking_usernotices`
--
ALTER TABLE `qa_eng_booking_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_eng_booking_userpoints`
--
ALTER TABLE `qa_eng_booking_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_eng_booking_uservotes`
--
ALTER TABLE `qa_eng_booking_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_eng_booking_widgets`
--
ALTER TABLE `qa_eng_booking_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_eng_booking_words`
--
ALTER TABLE `qa_eng_booking_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `qa_eng_shop_categories`
--
ALTER TABLE `qa_eng_shop_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_eng_shop_categorymetas`
--
ALTER TABLE `qa_eng_shop_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_eng_shop_contentwords`
--
ALTER TABLE `qa_eng_shop_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_shop_iplimits`
--
ALTER TABLE `qa_eng_shop_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_eng_shop_options`
--
ALTER TABLE `qa_eng_shop_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_eng_shop_pages`
--
ALTER TABLE `qa_eng_shop_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_eng_shop_postmetas`
--
ALTER TABLE `qa_eng_shop_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_eng_shop_posts`
--
ALTER TABLE `qa_eng_shop_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_eng_shop_posttags`
--
ALTER TABLE `qa_eng_shop_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_eng_shop_sharedevents`
--
ALTER TABLE `qa_eng_shop_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_eng_shop_tagmetas`
--
ALTER TABLE `qa_eng_shop_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_eng_shop_tagwords`
--
ALTER TABLE `qa_eng_shop_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_shop_titlewords`
--
ALTER TABLE `qa_eng_shop_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_eng_shop_userevents`
--
ALTER TABLE `qa_eng_shop_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_eng_shop_userfavorites`
--
ALTER TABLE `qa_eng_shop_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_eng_shop_userlevels`
--
ALTER TABLE `qa_eng_shop_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_eng_shop_userlimits`
--
ALTER TABLE `qa_eng_shop_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_eng_shop_usermetas`
--
ALTER TABLE `qa_eng_shop_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_eng_shop_usernotices`
--
ALTER TABLE `qa_eng_shop_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_eng_shop_userpoints`
--
ALTER TABLE `qa_eng_shop_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_eng_shop_uservotes`
--
ALTER TABLE `qa_eng_shop_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_eng_shop_widgets`
--
ALTER TABLE `qa_eng_shop_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_eng_shop_words`
--
ALTER TABLE `qa_eng_shop_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `qa_iplimits`
--
ALTER TABLE `qa_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  ADD KEY `touserid` (`touserid`,`type`,`created`),
  ADD KEY `fromhidden` (`fromhidden`),
  ADD KEY `tohidden` (`tohidden`),
  ADD KEY `qa_eng_shop_messages_ibfk_1` (`fromuserid`);

--
-- Indexes for table `qa_options`
--
ALTER TABLE `qa_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_pages`
--
ALTER TABLE `qa_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_pol_booking_categories`
--
ALTER TABLE `qa_pol_booking_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_pol_booking_categorymetas`
--
ALTER TABLE `qa_pol_booking_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_pol_booking_contentwords`
--
ALTER TABLE `qa_pol_booking_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_booking_iplimits`
--
ALTER TABLE `qa_pol_booking_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_pol_booking_options`
--
ALTER TABLE `qa_pol_booking_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_pol_booking_pages`
--
ALTER TABLE `qa_pol_booking_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_pol_booking_postmetas`
--
ALTER TABLE `qa_pol_booking_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_pol_booking_posts`
--
ALTER TABLE `qa_pol_booking_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_pol_booking_posttags`
--
ALTER TABLE `qa_pol_booking_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_pol_booking_sharedevents`
--
ALTER TABLE `qa_pol_booking_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_pol_booking_tagmetas`
--
ALTER TABLE `qa_pol_booking_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_pol_booking_tagwords`
--
ALTER TABLE `qa_pol_booking_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_booking_titlewords`
--
ALTER TABLE `qa_pol_booking_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_booking_userevents`
--
ALTER TABLE `qa_pol_booking_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_pol_booking_userfavorites`
--
ALTER TABLE `qa_pol_booking_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_pol_booking_userlevels`
--
ALTER TABLE `qa_pol_booking_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_pol_booking_userlimits`
--
ALTER TABLE `qa_pol_booking_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_pol_booking_usermetas`
--
ALTER TABLE `qa_pol_booking_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_pol_booking_usernotices`
--
ALTER TABLE `qa_pol_booking_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_pol_booking_userpoints`
--
ALTER TABLE `qa_pol_booking_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_pol_booking_uservotes`
--
ALTER TABLE `qa_pol_booking_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_pol_booking_widgets`
--
ALTER TABLE `qa_pol_booking_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_pol_booking_words`
--
ALTER TABLE `qa_pol_booking_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `qa_pol_shop_categories`
--
ALTER TABLE `qa_pol_shop_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_pol_shop_categorymetas`
--
ALTER TABLE `qa_pol_shop_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_pol_shop_contentwords`
--
ALTER TABLE `qa_pol_shop_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_shop_iplimits`
--
ALTER TABLE `qa_pol_shop_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_pol_shop_options`
--
ALTER TABLE `qa_pol_shop_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_pol_shop_pages`
--
ALTER TABLE `qa_pol_shop_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_pol_shop_postmetas`
--
ALTER TABLE `qa_pol_shop_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_pol_shop_posts`
--
ALTER TABLE `qa_pol_shop_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_pol_shop_posttags`
--
ALTER TABLE `qa_pol_shop_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_pol_shop_sharedevents`
--
ALTER TABLE `qa_pol_shop_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_pol_shop_tagmetas`
--
ALTER TABLE `qa_pol_shop_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_pol_shop_tagwords`
--
ALTER TABLE `qa_pol_shop_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_shop_titlewords`
--
ALTER TABLE `qa_pol_shop_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_pol_shop_userevents`
--
ALTER TABLE `qa_pol_shop_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_pol_shop_userfavorites`
--
ALTER TABLE `qa_pol_shop_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_pol_shop_userlevels`
--
ALTER TABLE `qa_pol_shop_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_pol_shop_userlimits`
--
ALTER TABLE `qa_pol_shop_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_pol_shop_usermetas`
--
ALTER TABLE `qa_pol_shop_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_pol_shop_usernotices`
--
ALTER TABLE `qa_pol_shop_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_pol_shop_userpoints`
--
ALTER TABLE `qa_pol_shop_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_pol_shop_uservotes`
--
ALTER TABLE `qa_pol_shop_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_pol_shop_widgets`
--
ALTER TABLE `qa_pol_shop_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_pol_shop_words`
--
ALTER TABLE `qa_pol_shop_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_sharedevents`
--
ALTER TABLE `qa_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_tagmetas`
--
ALTER TABLE `qa_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD KEY `source` (`source`,`identifiermd5`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `qa_usermeta`
--
ALTER TABLE `qa_usermeta`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_userpoints`
--
ALTER TABLE `qa_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD UNIQUE KEY `userid` (`userid`,`title`);

--
-- Indexes for table `qa_users`
--
ALTER TABLE `qa_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `email` (`email`),
  ADD KEY `handle` (`handle`),
  ADD KEY `level` (`level`),
  ADD KEY `created` (`created`,`level`,`flags`);

--
-- Indexes for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_words`
--
ALTER TABLE `qa_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qa_categories`
--
ALTER TABLE `qa_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_booking_categories`
--
ALTER TABLE `qa_eng_booking_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_booking_pages`
--
ALTER TABLE `qa_eng_booking_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_booking_posts`
--
ALTER TABLE `qa_eng_booking_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_eng_booking_usernotices`
--
ALTER TABLE `qa_eng_booking_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_booking_widgets`
--
ALTER TABLE `qa_eng_booking_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_booking_words`
--
ALTER TABLE `qa_eng_booking_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qa_eng_shop_categories`
--
ALTER TABLE `qa_eng_shop_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_shop_pages`
--
ALTER TABLE `qa_eng_shop_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_shop_posts`
--
ALTER TABLE `qa_eng_shop_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_eng_shop_usernotices`
--
ALTER TABLE `qa_eng_shop_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_shop_widgets`
--
ALTER TABLE `qa_eng_shop_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_eng_shop_words`
--
ALTER TABLE `qa_eng_shop_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qa_messages`
--
ALTER TABLE `qa_messages`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pages`
--
ALTER TABLE `qa_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_booking_categories`
--
ALTER TABLE `qa_pol_booking_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_booking_pages`
--
ALTER TABLE `qa_pol_booking_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_booking_posts`
--
ALTER TABLE `qa_pol_booking_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_pol_booking_usernotices`
--
ALTER TABLE `qa_pol_booking_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_booking_widgets`
--
ALTER TABLE `qa_pol_booking_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_booking_words`
--
ALTER TABLE `qa_pol_booking_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_pol_shop_categories`
--
ALTER TABLE `qa_pol_shop_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_shop_pages`
--
ALTER TABLE `qa_pol_shop_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_shop_posts`
--
ALTER TABLE `qa_pol_shop_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_pol_shop_usernotices`
--
ALTER TABLE `qa_pol_shop_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_shop_widgets`
--
ALTER TABLE `qa_pol_shop_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pol_shop_words`
--
ALTER TABLE `qa_pol_shop_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_posts`
--
ALTER TABLE `qa_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  MODIFY `fieldid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_users`
--
ALTER TABLE `qa_users`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_words`
--
ALTER TABLE `qa_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_eng_booking_categorymetas`
--
ALTER TABLE `qa_eng_booking_categorymetas`
  ADD CONSTRAINT `qa_eng_booking_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_eng_booking_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_contentwords`
--
ALTER TABLE `qa_eng_booking_contentwords`
  ADD CONSTRAINT `qa_eng_booking_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_booking_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_booking_words` (`wordid`);

--
-- Constraints for table `qa_eng_booking_postmetas`
--
ALTER TABLE `qa_eng_booking_postmetas`
  ADD CONSTRAINT `qa_eng_booking_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_posts`
--
ALTER TABLE `qa_eng_booking_posts`
  ADD CONSTRAINT `qa_eng_booking_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_eng_booking_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_eng_booking_posts` (`postid`),
  ADD CONSTRAINT `qa_eng_booking_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_eng_booking_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_eng_booking_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_eng_booking_posts` (`postid`);

--
-- Constraints for table `qa_eng_booking_posttags`
--
ALTER TABLE `qa_eng_booking_posttags`
  ADD CONSTRAINT `qa_eng_booking_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_booking_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_booking_words` (`wordid`);

--
-- Constraints for table `qa_eng_booking_tagwords`
--
ALTER TABLE `qa_eng_booking_tagwords`
  ADD CONSTRAINT `qa_eng_booking_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_booking_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_booking_words` (`wordid`);

--
-- Constraints for table `qa_eng_booking_titlewords`
--
ALTER TABLE `qa_eng_booking_titlewords`
  ADD CONSTRAINT `qa_eng_booking_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_booking_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_booking_words` (`wordid`);

--
-- Constraints for table `qa_eng_booking_userevents`
--
ALTER TABLE `qa_eng_booking_userevents`
  ADD CONSTRAINT `qa_eng_booking_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_userfavorites`
--
ALTER TABLE `qa_eng_booking_userfavorites`
  ADD CONSTRAINT `qa_eng_booking_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_userlevels`
--
ALTER TABLE `qa_eng_booking_userlevels`
  ADD CONSTRAINT `qa_eng_booking_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_userlimits`
--
ALTER TABLE `qa_eng_booking_userlimits`
  ADD CONSTRAINT `qa_eng_booking_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_usermetas`
--
ALTER TABLE `qa_eng_booking_usermetas`
  ADD CONSTRAINT `qa_eng_booking_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_usernotices`
--
ALTER TABLE `qa_eng_booking_usernotices`
  ADD CONSTRAINT `qa_eng_booking_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_booking_uservotes`
--
ALTER TABLE `qa_eng_booking_uservotes`
  ADD CONSTRAINT `qa_eng_booking_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_booking_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_categorymetas`
--
ALTER TABLE `qa_eng_shop_categorymetas`
  ADD CONSTRAINT `qa_eng_shop_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_eng_shop_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_contentwords`
--
ALTER TABLE `qa_eng_shop_contentwords`
  ADD CONSTRAINT `qa_eng_shop_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_shop_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_shop_words` (`wordid`);

--
-- Constraints for table `qa_eng_shop_postmetas`
--
ALTER TABLE `qa_eng_shop_postmetas`
  ADD CONSTRAINT `qa_eng_shop_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_posts`
--
ALTER TABLE `qa_eng_shop_posts`
  ADD CONSTRAINT `qa_eng_shop_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_eng_shop_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_eng_shop_posts` (`postid`),
  ADD CONSTRAINT `qa_eng_shop_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_eng_shop_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_eng_shop_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_eng_shop_posts` (`postid`);

--
-- Constraints for table `qa_eng_shop_posttags`
--
ALTER TABLE `qa_eng_shop_posttags`
  ADD CONSTRAINT `qa_eng_shop_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_shop_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_shop_words` (`wordid`);

--
-- Constraints for table `qa_eng_shop_tagwords`
--
ALTER TABLE `qa_eng_shop_tagwords`
  ADD CONSTRAINT `qa_eng_shop_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_shop_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_shop_words` (`wordid`);

--
-- Constraints for table `qa_eng_shop_titlewords`
--
ALTER TABLE `qa_eng_shop_titlewords`
  ADD CONSTRAINT `qa_eng_shop_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_shop_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_eng_shop_words` (`wordid`);

--
-- Constraints for table `qa_eng_shop_userevents`
--
ALTER TABLE `qa_eng_shop_userevents`
  ADD CONSTRAINT `qa_eng_shop_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_userfavorites`
--
ALTER TABLE `qa_eng_shop_userfavorites`
  ADD CONSTRAINT `qa_eng_shop_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_userlevels`
--
ALTER TABLE `qa_eng_shop_userlevels`
  ADD CONSTRAINT `qa_eng_shop_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_userlimits`
--
ALTER TABLE `qa_eng_shop_userlimits`
  ADD CONSTRAINT `qa_eng_shop_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_usermetas`
--
ALTER TABLE `qa_eng_shop_usermetas`
  ADD CONSTRAINT `qa_eng_shop_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_usernotices`
--
ALTER TABLE `qa_eng_shop_usernotices`
  ADD CONSTRAINT `qa_eng_shop_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_eng_shop_uservotes`
--
ALTER TABLE `qa_eng_shop_uservotes`
  ADD CONSTRAINT `qa_eng_shop_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_eng_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_eng_shop_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD CONSTRAINT `qa_eng_shop_messages_ibfk_1` FOREIGN KEY (`fromuserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_eng_shop_messages_ibfk_2` FOREIGN KEY (`touserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL;

--
-- Constraints for table `qa_pol_booking_categorymetas`
--
ALTER TABLE `qa_pol_booking_categorymetas`
  ADD CONSTRAINT `qa_pol_booking_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_pol_booking_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_contentwords`
--
ALTER TABLE `qa_pol_booking_contentwords`
  ADD CONSTRAINT `qa_pol_booking_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_booking_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_booking_words` (`wordid`);

--
-- Constraints for table `qa_pol_booking_postmetas`
--
ALTER TABLE `qa_pol_booking_postmetas`
  ADD CONSTRAINT `qa_pol_booking_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_posts`
--
ALTER TABLE `qa_pol_booking_posts`
  ADD CONSTRAINT `qa_pol_booking_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_pol_booking_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_pol_booking_posts` (`postid`),
  ADD CONSTRAINT `qa_pol_booking_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_pol_booking_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_pol_booking_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_pol_booking_posts` (`postid`);

--
-- Constraints for table `qa_pol_booking_posttags`
--
ALTER TABLE `qa_pol_booking_posttags`
  ADD CONSTRAINT `qa_pol_booking_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_booking_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_booking_words` (`wordid`);

--
-- Constraints for table `qa_pol_booking_tagwords`
--
ALTER TABLE `qa_pol_booking_tagwords`
  ADD CONSTRAINT `qa_pol_booking_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_booking_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_booking_words` (`wordid`);

--
-- Constraints for table `qa_pol_booking_titlewords`
--
ALTER TABLE `qa_pol_booking_titlewords`
  ADD CONSTRAINT `qa_pol_booking_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_booking_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_booking_words` (`wordid`);

--
-- Constraints for table `qa_pol_booking_userevents`
--
ALTER TABLE `qa_pol_booking_userevents`
  ADD CONSTRAINT `qa_pol_booking_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_userfavorites`
--
ALTER TABLE `qa_pol_booking_userfavorites`
  ADD CONSTRAINT `qa_pol_booking_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_userlevels`
--
ALTER TABLE `qa_pol_booking_userlevels`
  ADD CONSTRAINT `qa_pol_booking_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_userlimits`
--
ALTER TABLE `qa_pol_booking_userlimits`
  ADD CONSTRAINT `qa_pol_booking_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_usermetas`
--
ALTER TABLE `qa_pol_booking_usermetas`
  ADD CONSTRAINT `qa_pol_booking_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_usernotices`
--
ALTER TABLE `qa_pol_booking_usernotices`
  ADD CONSTRAINT `qa_pol_booking_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_booking_uservotes`
--
ALTER TABLE `qa_pol_booking_uservotes`
  ADD CONSTRAINT `qa_pol_booking_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_booking_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_booking_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_categorymetas`
--
ALTER TABLE `qa_pol_shop_categorymetas`
  ADD CONSTRAINT `qa_pol_shop_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_pol_shop_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_contentwords`
--
ALTER TABLE `qa_pol_shop_contentwords`
  ADD CONSTRAINT `qa_pol_shop_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_shop_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_shop_words` (`wordid`);

--
-- Constraints for table `qa_pol_shop_postmetas`
--
ALTER TABLE `qa_pol_shop_postmetas`
  ADD CONSTRAINT `qa_pol_shop_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_posts`
--
ALTER TABLE `qa_pol_shop_posts`
  ADD CONSTRAINT `qa_pol_shop_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_pol_shop_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_pol_shop_posts` (`postid`),
  ADD CONSTRAINT `qa_pol_shop_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_pol_shop_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_pol_shop_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_pol_shop_posts` (`postid`);

--
-- Constraints for table `qa_pol_shop_posttags`
--
ALTER TABLE `qa_pol_shop_posttags`
  ADD CONSTRAINT `qa_pol_shop_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_shop_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_shop_words` (`wordid`);

--
-- Constraints for table `qa_pol_shop_tagwords`
--
ALTER TABLE `qa_pol_shop_tagwords`
  ADD CONSTRAINT `qa_pol_shop_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_shop_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_shop_words` (`wordid`);

--
-- Constraints for table `qa_pol_shop_titlewords`
--
ALTER TABLE `qa_pol_shop_titlewords`
  ADD CONSTRAINT `qa_pol_shop_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_shop_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_pol_shop_words` (`wordid`);

--
-- Constraints for table `qa_pol_shop_userevents`
--
ALTER TABLE `qa_pol_shop_userevents`
  ADD CONSTRAINT `qa_pol_shop_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_userfavorites`
--
ALTER TABLE `qa_pol_shop_userfavorites`
  ADD CONSTRAINT `qa_pol_shop_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_userlevels`
--
ALTER TABLE `qa_pol_shop_userlevels`
  ADD CONSTRAINT `qa_pol_shop_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_userlimits`
--
ALTER TABLE `qa_pol_shop_userlimits`
  ADD CONSTRAINT `qa_pol_shop_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_usermetas`
--
ALTER TABLE `qa_pol_shop_usermetas`
  ADD CONSTRAINT `qa_pol_shop_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_usernotices`
--
ALTER TABLE `qa_pol_shop_usernotices`
  ADD CONSTRAINT `qa_pol_shop_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_pol_shop_uservotes`
--
ALTER TABLE `qa_pol_shop_uservotes`
  ADD CONSTRAINT `qa_pol_shop_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_pol_shop_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_pol_shop_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`);

--
-- Constraints for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
