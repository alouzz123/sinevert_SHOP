-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 13 nov. 2021 à 13:40
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sinevert_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `sv_commentmeta`
--

DROP TABLE IF EXISTS `sv_commentmeta`;
CREATE TABLE IF NOT EXISTS `sv_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sv_comments`
--

DROP TABLE IF EXISTS `sv_comments`;
CREATE TABLE IF NOT EXISTS `sv_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_comments`
--

INSERT INTO `sv_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentateur WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-11-08 16:19:56', '2021-11-08 15:19:56', 'Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sv_links`
--

DROP TABLE IF EXISTS `sv_links`;
CREATE TABLE IF NOT EXISTS `sv_links` (
  `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sv_options`
--

DROP TABLE IF EXISTS `sv_options`;
CREATE TABLE IF NOT EXISTS `sv_options` (
  `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_options`
--

INSERT INTO `sv_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/sinevert_shop', 'yes'),
(2, 'home', 'http://localhost/sinevert_shop', 'yes'),
(3, 'blogname', 'SineVert Shop', 'yes'),
(4, 'blogdescription', 'Un site utilisant WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'alouzz123@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G\\hi', 'yes'),
(25, 'links_updated_date_format', 'd F Y G\\hi', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:95:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'fruitshop', 'yes'),
(41, 'stylesheet', 'fruitshop', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'Europe/Paris', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '7', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1651936795', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '49752', 'yes'),
(100, 'sv_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'fr_FR', 'yes'),
(103, 'widget_block', 'a:4:{i:3;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:12:\"blog-sidebar\";a:3:{i:1;s:7:\"block-3\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(211, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:1:{i:0;i:2;}}', 'yes'),
(105, 'cron', 'a:7:{i:1636813197;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1636816796;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1636816797;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1636816823;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1636816825;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1637075997;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(121, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:28:\"La demande HTTPS a échoué.\";}}', 'yes'),
(120, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1636385208;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(132, '_site_transient_timeout_browser_f8256d37159e3faf28ae61a6406601c3', '1636989624', 'no'),
(217, '_site_transient_timeout_theme_roots', '1636812336', 'no'),
(218, '_site_transient_theme_roots', 'a:4:{s:9:\"fruitshop\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no'),
(223, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1636810573;s:7:\"checked\";a:4:{s:9:\"fruitshop\";s:3:\"5.6\";s:14:\"twentynineteen\";s:3:\"2.1\";s:12:\"twentytwenty\";s:3:\"1.8\";s:15:\"twentytwentyone\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.2.1.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.8.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.4.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(224, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1636810575;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.2.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.2.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";s:6:\"tested\";s:5:\"5.8.2\";s:12:\"requires_php\";b:0;}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"hello-dolly\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"1.7.2\";s:7:\"updated\";s:19:\"2018-04-27 10:03:32\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.7.2/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:6:\"4.1.10\";s:9:\"hello.php\";s:5:\"1.7.2\";}}', 'no'),
(133, '_site_transient_browser_f8256d37159e3faf28ae61a6406601c3', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(134, '_site_transient_timeout_php_check_7772753a7ea0fe5c6dd1e8406c9ba6ba', '1636989625', 'no'),
(135, '_site_transient_php_check_7772753a7ea0fe5c6dd1e8406c9ba6ba', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(152, 'finished_updating_comment_type', '1', 'yes'),
(143, 'can_compress_scripts', '1', 'no'),
(153, 'current_theme', 'Fruitshop', 'yes'),
(157, 'theme_mods_twentynineteen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1636407830;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}', 'yes'),
(154, 'theme_mods_fruit shop', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1636385231;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(155, 'theme_switched', '', 'yes'),
(167, 'theme_mods_fruitshop', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:40;}', 'yes'),
(176, '_site_transient_timeout_browser_5eb8549d6d937575268f040b88fdf37a', '1637051628', 'no'),
(177, '_site_transient_browser_5eb8549d6d937575268f040b88fdf37a', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"95.0.4638.69\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(214, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(215, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(219, '_transient_health-check-site-status-result', '{\"good\":12,\"recommended\":7,\"critical\":0}', 'yes'),
(222, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.8.2.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.8.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.8.2\";s:7:\"version\";s:5:\"5.8.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.8.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.8.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.8.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.8.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.8.2-partial-1.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.8.2\";s:7:\"version\";s:5:\"5.8.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:5:\"5.8.1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.8.2.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.8.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.8.2\";s:7:\"version\";s:5:\"5.8.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1636810569;s:15:\"version_checked\";s:5:\"5.8.1\";s:12:\"translations\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `sv_postmeta`
--

DROP TABLE IF EXISTS `sv_postmeta`;
CREATE TABLE IF NOT EXISTS `sv_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_postmeta`
--

INSERT INTO `sv_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(15, 20, '_menu_item_type', 'post_type'),
(10, 9, '_edit_lock', '1636460675:1'),
(11, 11, '_edit_lock', '1636460736:1'),
(12, 14, '_edit_lock', '1636462019:1'),
(13, 16, '_edit_lock', '1636460851:1'),
(14, 18, '_edit_lock', '1636460913:1'),
(9, 7, '_edit_lock', '1636460746:1'),
(16, 20, '_menu_item_menu_item_parent', '0'),
(17, 20, '_menu_item_object_id', '7'),
(18, 20, '_menu_item_object', 'page'),
(19, 20, '_menu_item_target', ''),
(20, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(21, 20, '_menu_item_xfn', ''),
(22, 20, '_menu_item_url', ''),
(23, 20, '_menu_item_orphaned', '1636461905'),
(24, 21, '_menu_item_type', 'post_type'),
(25, 21, '_menu_item_menu_item_parent', '0'),
(26, 21, '_menu_item_object_id', '11'),
(27, 21, '_menu_item_object', 'page'),
(28, 21, '_menu_item_target', ''),
(29, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(30, 21, '_menu_item_xfn', ''),
(31, 21, '_menu_item_url', ''),
(32, 21, '_menu_item_orphaned', '1636461905'),
(33, 22, '_menu_item_type', 'post_type'),
(34, 22, '_menu_item_menu_item_parent', '0'),
(35, 22, '_menu_item_object_id', '9'),
(36, 22, '_menu_item_object', 'page'),
(37, 22, '_menu_item_target', ''),
(38, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(39, 22, '_menu_item_xfn', ''),
(40, 22, '_menu_item_url', ''),
(41, 22, '_menu_item_orphaned', '1636461905'),
(42, 23, '_menu_item_type', 'post_type'),
(43, 23, '_menu_item_menu_item_parent', '0'),
(44, 23, '_menu_item_object_id', '18'),
(45, 23, '_menu_item_object', 'page'),
(46, 23, '_menu_item_target', ''),
(47, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(48, 23, '_menu_item_xfn', ''),
(49, 23, '_menu_item_url', ''),
(50, 23, '_menu_item_orphaned', '1636461905'),
(51, 24, '_menu_item_type', 'post_type'),
(52, 24, '_menu_item_menu_item_parent', '0'),
(53, 24, '_menu_item_object_id', '16'),
(54, 24, '_menu_item_object', 'page'),
(55, 24, '_menu_item_target', ''),
(56, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(57, 24, '_menu_item_xfn', ''),
(58, 24, '_menu_item_url', ''),
(59, 24, '_menu_item_orphaned', '1636461905'),
(60, 25, '_menu_item_type', 'post_type'),
(61, 25, '_menu_item_menu_item_parent', '0'),
(62, 25, '_menu_item_object_id', '14'),
(63, 25, '_menu_item_object', 'page'),
(64, 25, '_menu_item_target', ''),
(65, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(66, 25, '_menu_item_xfn', ''),
(67, 25, '_menu_item_url', ''),
(68, 25, '_menu_item_orphaned', '1636461905'),
(69, 26, '_menu_item_type', 'post_type'),
(70, 26, '_menu_item_menu_item_parent', '0'),
(71, 26, '_menu_item_object_id', '18'),
(72, 26, '_menu_item_object', 'page'),
(73, 26, '_menu_item_target', ''),
(74, 26, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(75, 26, '_menu_item_xfn', ''),
(76, 26, '_menu_item_url', ''),
(77, 26, '_menu_item_orphaned', '1636461957'),
(78, 27, '_menu_item_type', 'post_type'),
(79, 27, '_menu_item_menu_item_parent', '0'),
(80, 27, '_menu_item_object_id', '16'),
(81, 27, '_menu_item_object', 'page'),
(82, 27, '_menu_item_target', ''),
(83, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(84, 27, '_menu_item_xfn', ''),
(85, 27, '_menu_item_url', ''),
(86, 27, '_menu_item_orphaned', '1636461957'),
(87, 28, '_menu_item_type', 'post_type'),
(88, 28, '_menu_item_menu_item_parent', '0'),
(89, 28, '_menu_item_object_id', '14'),
(90, 28, '_menu_item_object', 'page'),
(91, 28, '_menu_item_target', ''),
(92, 28, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(93, 28, '_menu_item_xfn', ''),
(94, 28, '_menu_item_url', ''),
(95, 28, '_menu_item_orphaned', '1636461957'),
(96, 29, '_menu_item_type', 'post_type'),
(97, 29, '_menu_item_menu_item_parent', '0'),
(98, 29, '_menu_item_object_id', '11'),
(99, 29, '_menu_item_object', 'page'),
(100, 29, '_menu_item_target', ''),
(101, 29, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(102, 29, '_menu_item_xfn', ''),
(103, 29, '_menu_item_url', ''),
(104, 29, '_menu_item_orphaned', '1636461957'),
(105, 30, '_menu_item_type', 'post_type'),
(106, 30, '_menu_item_menu_item_parent', '0'),
(107, 30, '_menu_item_object_id', '9'),
(108, 30, '_menu_item_object', 'page'),
(109, 30, '_menu_item_target', ''),
(110, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(111, 30, '_menu_item_xfn', ''),
(112, 30, '_menu_item_url', ''),
(113, 30, '_menu_item_orphaned', '1636461958'),
(114, 31, '_menu_item_type', 'post_type'),
(115, 31, '_menu_item_menu_item_parent', '0'),
(116, 31, '_menu_item_object_id', '7'),
(117, 31, '_menu_item_object', 'page'),
(118, 31, '_menu_item_target', ''),
(119, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(120, 31, '_menu_item_xfn', ''),
(121, 31, '_menu_item_url', ''),
(181, 38, '_menu_item_url', ''),
(123, 32, '_menu_item_type', 'post_type'),
(124, 32, '_menu_item_menu_item_parent', '0'),
(125, 32, '_menu_item_object_id', '11'),
(126, 32, '_menu_item_object', 'page'),
(127, 32, '_menu_item_target', ''),
(128, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(129, 32, '_menu_item_xfn', ''),
(130, 32, '_menu_item_url', ''),
(180, 38, '_menu_item_xfn', ''),
(132, 33, '_menu_item_type', 'post_type'),
(133, 33, '_menu_item_menu_item_parent', '0'),
(134, 33, '_menu_item_object_id', '9'),
(135, 33, '_menu_item_object', 'page'),
(136, 33, '_menu_item_target', ''),
(137, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(138, 33, '_menu_item_xfn', ''),
(139, 33, '_menu_item_url', ''),
(187, 44, '_wp_trash_meta_status', 'publish'),
(186, 42, '_wp_trash_meta_time', '1636462564'),
(185, 42, '_wp_trash_meta_status', 'publish'),
(184, 39, '_wp_trash_meta_time', '1636462553'),
(183, 39, '_wp_trash_meta_status', 'publish'),
(179, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(178, 38, '_menu_item_target', ''),
(177, 38, '_menu_item_object', 'page'),
(176, 38, '_menu_item_object_id', '14'),
(175, 38, '_menu_item_menu_item_parent', '0'),
(174, 38, '_menu_item_type', 'post_type'),
(173, 18, '_wp_desired_post_slug', 'profil-admin-1'),
(172, 18, '_wp_trash_meta_time', '1636462085'),
(171, 18, '_wp_trash_meta_status', 'publish'),
(170, 16, '_wp_desired_post_slug', 'profil-admin-2'),
(169, 16, '_wp_trash_meta_time', '1636462075'),
(168, 16, '_wp_trash_meta_status', 'publish'),
(188, 44, '_wp_trash_meta_time', '1636462577'),
(189, 46, '_edit_lock', '1636463197:1'),
(190, 46, '_wp_trash_meta_status', 'publish'),
(191, 46, '_wp_trash_meta_time', '1636463253'),
(192, 48, '_wp_trash_meta_status', 'publish'),
(193, 48, '_wp_trash_meta_time', '1636463335');

-- --------------------------------------------------------

--
-- Structure de la table `sv_posts`
--

DROP TABLE IF EXISTS `sv_posts`;
CREATE TABLE IF NOT EXISTS `sv_posts` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_posts`
--

INSERT INTO `sv_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-11-08 16:19:56', '2021-11-08 15:19:56', '<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->', 'Bonjour tout le monde !', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2021-11-08 16:19:56', '2021-11-08 15:19:56', '', 0, 'http://localhost/sinevert_shop/?p=1', 0, 'post', '', 1),
(46, 1, '2021-11-09 14:07:32', '2021-11-09 13:07:32', '{\n    \"custom_css[fruitshop]\": {\n        \"value\": \".title-page{\\n\\tdisplay:none\\n}\\n#menu-menu-1{\\n\\tmargin-left:50%;\\n}\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-09 13:07:32\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '05b7c8be-3f9a-4f01-8060-69e4118e155a', '', '', '2021-11-09 14:07:32', '2021-11-09 13:07:32', '', 0, 'http://localhost/sinevert_shop/?p=46', 0, 'customize_changeset', '', 0),
(47, 1, '2021-11-09 14:07:32', '2021-11-09 13:07:32', '.title-page{\n	display:none\n}\n#menu-menu-1{\n	margin-left:50%;\n}', 'fruitshop', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2021-11-09 14:07:32', '2021-11-09 13:07:32', '', 40, 'http://localhost/sinevert_shop/?p=47', 0, 'revision', '', 0),
(48, 1, '2021-11-09 14:08:55', '2021-11-09 13:08:55', '{\n    \"custom_css[fruitshop]\": {\n        \"value\": \".title-page{\\n\\tdisplay:none\\n}\\n#menu-menu-1{\\n\\t\\n}\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-09 13:08:55\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '89f79e55-5fc3-49fe-9af0-0551538a32ba', '', '', '2021-11-09 14:08:55', '2021-11-09 13:08:55', '', 0, 'http://localhost/sinevert_shop/2021/11/09/89f79e55-5fc3-49fe-9af0-0551538a32ba/', 0, 'customize_changeset', '', 0),
(49, 1, '2021-11-09 14:08:55', '2021-11-09 13:08:55', '.title-page{\n	display:none\n}\n#menu-menu-1{\n	\n}', 'fruitshop', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2021-11-09 14:08:55', '2021-11-09 13:08:55', '', 40, 'http://localhost/sinevert_shop/?p=49', 0, 'revision', '', 0),
(4, 1, '2021-11-08 16:20:25', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-11-08 16:20:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=4', 0, 'post', '', 0),
(7, 1, '2021-11-09 13:25:43', '2021-11-09 12:25:43', '', 'Accueil', '', 'publish', 'closed', 'closed', '', 'accueil', '', '', '2021-11-09 13:25:43', '2021-11-09 12:25:43', '', 0, 'http://localhost/sinevert_shop/?page_id=7', 0, 'page', '', 0),
(8, 1, '2021-11-09 13:25:43', '2021-11-09 12:25:43', '', 'Accueil', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-11-09 13:25:43', '2021-11-09 12:25:43', '', 7, 'http://localhost/sinevert_shop/?p=8', 0, 'revision', '', 0),
(9, 1, '2021-11-09 13:26:37', '2021-11-09 12:26:37', '', 'Boutique', '', 'publish', 'closed', 'closed', '', 'boutique', '', '', '2021-11-09 13:26:37', '2021-11-09 12:26:37', '', 0, 'http://localhost/sinevert_shop/?page_id=9', 0, 'page', '', 0),
(10, 1, '2021-11-09 13:26:37', '2021-11-09 12:26:37', '', 'Boutique', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2021-11-09 13:26:37', '2021-11-09 12:26:37', '', 9, 'http://localhost/sinevert_shop/?p=10', 0, 'revision', '', 0),
(11, 1, '2021-11-09 13:27:17', '2021-11-09 12:27:17', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2021-11-09 13:27:25', '2021-11-09 12:27:25', '', 0, 'http://localhost/sinevert_shop/?page_id=11', 0, 'page', '', 0),
(12, 1, '2021-11-09 13:27:17', '2021-11-09 12:27:17', '', 'blog', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2021-11-09 13:27:17', '2021-11-09 12:27:17', '', 11, 'http://localhost/sinevert_shop/?p=12', 0, 'revision', '', 0),
(13, 1, '2021-11-09 13:27:25', '2021-11-09 12:27:25', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2021-11-09 13:27:25', '2021-11-09 12:27:25', '', 11, 'http://localhost/sinevert_shop/?p=13', 0, 'revision', '', 0),
(14, 1, '2021-11-09 13:28:55', '2021-11-09 12:28:55', '', 'Profil', '', 'publish', 'closed', 'closed', '', 'profil-user', '', '', '2021-11-09 13:49:07', '2021-11-09 12:49:07', '', 0, 'http://localhost/sinevert_shop/?page_id=14', 0, 'page', '', 0),
(15, 1, '2021-11-09 13:28:55', '2021-11-09 12:28:55', '', 'Profil User', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2021-11-09 13:28:55', '2021-11-09 12:28:55', '', 14, 'http://localhost/sinevert_shop/?p=15', 0, 'revision', '', 0),
(16, 1, '2021-11-09 13:29:29', '2021-11-09 12:29:29', '', 'Profil Admin 2', '', 'trash', 'closed', 'closed', '', 'profil-admin-2__trashed', '', '', '2021-11-09 13:47:55', '2021-11-09 12:47:55', '', 0, 'http://localhost/sinevert_shop/?page_id=16', 0, 'page', '', 0),
(17, 1, '2021-11-09 13:29:29', '2021-11-09 12:29:29', '', 'Profil Admin 2', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2021-11-09 13:29:29', '2021-11-09 12:29:29', '', 16, 'http://localhost/sinevert_shop/?p=17', 0, 'revision', '', 0),
(18, 1, '2021-11-09 13:30:20', '2021-11-09 12:30:20', '', 'Profil admin 1', '', 'trash', 'closed', 'closed', '', 'profil-admin-1__trashed', '', '', '2021-11-09 13:48:05', '2021-11-09 12:48:05', '', 0, 'http://localhost/sinevert_shop/?page_id=18', 0, 'page', '', 0),
(19, 1, '2021-11-09 13:30:20', '2021-11-09 12:30:20', '', 'Profil admin 1', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2021-11-09 13:30:20', '2021-11-09 12:30:20', '', 18, 'http://localhost/sinevert_shop/?p=19', 0, 'revision', '', 0),
(20, 1, '2021-11-09 13:45:04', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=20', 1, 'nav_menu_item', '', 0),
(21, 1, '2021-11-09 13:45:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=21', 1, 'nav_menu_item', '', 0),
(22, 1, '2021-11-09 13:45:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2021-11-09 13:45:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=23', 1, 'nav_menu_item', '', 0),
(24, 1, '2021-11-09 13:45:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=24', 1, 'nav_menu_item', '', 0),
(25, 1, '2021-11-09 13:45:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=25', 1, 'nav_menu_item', '', 0),
(26, 1, '2021-11-09 13:45:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=26', 1, 'nav_menu_item', '', 0),
(27, 1, '2021-11-09 13:45:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=27', 1, 'nav_menu_item', '', 0),
(28, 1, '2021-11-09 13:45:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=28', 1, 'nav_menu_item', '', 0),
(29, 1, '2021-11-09 13:45:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=29', 1, 'nav_menu_item', '', 0),
(30, 1, '2021-11-09 13:45:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-11-09 13:45:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/sinevert_shop/?p=30', 1, 'nav_menu_item', '', 0),
(31, 1, '2021-11-09 13:50:36', '2021-11-09 12:46:34', ' ', '', '', 'publish', 'closed', 'closed', '', '31', '', '', '2021-11-09 13:50:37', '2021-11-09 12:50:37', '', 0, 'http://localhost/sinevert_shop/?p=31', 1, 'nav_menu_item', '', 0),
(32, 1, '2021-11-09 13:50:37', '2021-11-09 12:46:34', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2021-11-09 13:50:37', '2021-11-09 12:50:37', '', 0, 'http://localhost/sinevert_shop/?p=32', 2, 'nav_menu_item', '', 0),
(33, 1, '2021-11-09 13:50:37', '2021-11-09 12:46:34', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2021-11-09 13:50:37', '2021-11-09 12:50:37', '', 0, 'http://localhost/sinevert_shop/?p=33', 3, 'nav_menu_item', '', 0),
(39, 1, '2021-11-09 13:55:52', '2021-11-09 12:55:52', '{\n    \"custom_css[fruitshop]\": {\n        \"value\": \"title-page{\\n\\tdiplay:none\\n}\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-09 12:55:52\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd7cd0182-12d3-4d74-b95d-d7511fbf464a', '', '', '2021-11-09 13:55:52', '2021-11-09 12:55:52', '', 0, 'http://localhost/sinevert_shop/2021/11/09/d7cd0182-12d3-4d74-b95d-d7511fbf464a/', 0, 'customize_changeset', '', 0),
(37, 1, '2021-11-09 13:49:07', '2021-11-09 12:49:07', '', 'Profil', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2021-11-09 13:49:07', '2021-11-09 12:49:07', '', 14, 'http://localhost/sinevert_shop/?p=37', 0, 'revision', '', 0),
(38, 1, '2021-11-09 13:50:37', '2021-11-09 12:50:37', ' ', '', '', 'publish', 'closed', 'closed', '', '38', '', '', '2021-11-09 13:50:37', '2021-11-09 12:50:37', '', 0, 'http://localhost/sinevert_shop/?p=38', 4, 'nav_menu_item', '', 0),
(40, 1, '2021-11-09 13:55:53', '2021-11-09 12:55:53', '.title-page{\n	display:none\n}\n#menu-menu-1{\n	\n}', 'fruitshop', '', 'publish', 'closed', 'closed', '', 'fruitshop', '', '', '2021-11-09 14:08:55', '2021-11-09 13:08:55', '', 0, 'http://localhost/sinevert_shop/2021/11/09/fruitshop/', 0, 'custom_css', '', 0),
(41, 1, '2021-11-09 13:55:53', '2021-11-09 12:55:53', 'title-page{\n	diplay:none\n}', 'fruitshop', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2021-11-09 13:55:53', '2021-11-09 12:55:53', '', 40, 'http://localhost/sinevert_shop/?p=41', 0, 'revision', '', 0),
(42, 1, '2021-11-09 13:56:04', '2021-11-09 12:56:04', '{\n    \"custom_css[fruitshop]\": {\n        \"value\": \"title-page{\\n\\tdisplay:none\\n}\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-09 12:56:04\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '3eec71e3-1b64-49da-8272-1b12a48eb515', '', '', '2021-11-09 13:56:04', '2021-11-09 12:56:04', '', 0, 'http://localhost/sinevert_shop/2021/11/09/3eec71e3-1b64-49da-8272-1b12a48eb515/', 0, 'customize_changeset', '', 0),
(43, 1, '2021-11-09 13:56:04', '2021-11-09 12:56:04', 'title-page{\n	display:none\n}', 'fruitshop', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2021-11-09 13:56:04', '2021-11-09 12:56:04', '', 40, 'http://localhost/sinevert_shop/?p=43', 0, 'revision', '', 0),
(44, 1, '2021-11-09 13:56:16', '2021-11-09 12:56:16', '{\n    \"custom_css[fruitshop]\": {\n        \"value\": \".title-page{\\n\\tdisplay:none\\n}\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-11-09 12:56:16\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '24e6ce0a-65cf-4c36-87cb-e38b365f9b65', '', '', '2021-11-09 13:56:16', '2021-11-09 12:56:16', '', 0, 'http://localhost/sinevert_shop/2021/11/09/24e6ce0a-65cf-4c36-87cb-e38b365f9b65/', 0, 'customize_changeset', '', 0),
(45, 1, '2021-11-09 13:56:17', '2021-11-09 12:56:17', '.title-page{\n	display:none\n}', 'fruitshop', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2021-11-09 13:56:17', '2021-11-09 12:56:17', '', 40, 'http://localhost/sinevert_shop/?p=45', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sv_termmeta`
--

DROP TABLE IF EXISTS `sv_termmeta`;
CREATE TABLE IF NOT EXISTS `sv_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sv_terms`
--

DROP TABLE IF EXISTS `sv_terms`;
CREATE TABLE IF NOT EXISTS `sv_terms` (
  `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_terms`
--

INSERT INTO `sv_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Menu 1', 'menu-1', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sv_term_relationships`
--

DROP TABLE IF EXISTS `sv_term_relationships`;
CREATE TABLE IF NOT EXISTS `sv_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_term_relationships`
--

INSERT INTO `sv_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(31, 2, 0),
(32, 2, 0),
(33, 2, 0),
(38, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sv_term_taxonomy`
--

DROP TABLE IF EXISTS `sv_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `sv_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_term_taxonomy`
--

INSERT INTO `sv_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `sv_usermeta`
--

DROP TABLE IF EXISTS `sv_usermeta`;
CREATE TABLE IF NOT EXISTS `sv_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_usermeta`
--

INSERT INTO `sv_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'sinevert@2021'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'sv_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'sv_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"a73392a348860375037fb5eb0018ee562fab0eb3b1b37874f10f755b2011d90b\";a:4:{s:10:\"expiration\";i:1636557622;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\";s:5:\"login\";i:1636384822;}s:64:\"cc88319ec533b796adb2bf83cec63a71bea83a2429add6824b74dab055f011e1\";a:4:{s:10:\"expiration\";i:1636619625;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:131:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44\";s:5:\"login\";i:1636446825;}}'),
(17, 1, 'sv_dashboard_quick_press_last_post_id', '4'),
(18, 2, 'nickname', 'wp_rest_api'),
(19, 2, 'first_name', ''),
(20, 2, 'last_name', ''),
(21, 2, 'description', ''),
(22, 2, 'rich_editing', 'true'),
(23, 2, 'syntax_highlighting', 'true'),
(24, 2, 'comment_shortcuts', 'false'),
(25, 2, 'admin_color', 'fresh'),
(26, 2, 'use_ssl', '0'),
(27, 2, 'show_admin_bar_front', 'true'),
(28, 2, 'locale', ''),
(29, 2, 'sv_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(30, 2, 'sv_user_level', '10'),
(31, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(32, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),
(33, 1, 'nav_menu_recently_edited', '2');

-- --------------------------------------------------------

--
-- Structure de la table `sv_users`
--

DROP TABLE IF EXISTS `sv_users`;
CREATE TABLE IF NOT EXISTS `sv_users` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `sv_users`
--

INSERT INTO `sv_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'sinevert@2021', '$P$BmtdDrDOMb7O1wkbqv39UqJJLo1zaq.', 'sinevert2021', 'alouzz123@gmail.com', 'http://localhost/sinevert_shop', '2021-11-08 15:19:56', '', 0, 'sinevert@2021'),
(2, 'wp_rest_api', '$P$BozQNOegGY09jQGlBBow60ZuMytjJY1', 'wp_rest_api', 'do-not-remove@wordpress.c0m', '', '2021-11-08 15:26:50', '', 0, 'wp_rest_api');

-- --------------------------------------------------------

--
-- Structure de la table `sv_utilisateur`
--

DROP TABLE IF EXISTS `sv_utilisateur`;
CREATE TABLE IF NOT EXISTS `sv_utilisateur` (
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `mail` varchar(255) NOT NULL,
  `telephone` int NOT NULL,
  `photo_profil` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`mail`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
