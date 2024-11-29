/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : absensi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-11-29 21:12:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `absence`
-- ----------------------------
DROP TABLE IF EXISTS `absence`;
CREATE TABLE `absence` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `radius_m` varchar(255) NOT NULL,
  `time_in` varchar(255) NOT NULL,
  `time_out` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES ('1', 'Primary', '1', '55.731997,94.401315', '82.035758,-115.025435', '495', '07:00:08', '09:00:54', '2024-11-24 13:49:24', '2024-11-25 22:28:33');
INSERT INTO `absence` VALUES ('2', 'Matematika', '2', '55.731997,94.401315', '82.035758,-115.025432', '250', '07:30', '08:00', '2024-11-25 22:34:05', '2024-11-25 22:34:05');
INSERT INTO `absence` VALUES ('3', 'Biologi', '2', '-7.957206987206575', '112.61816098440514', '250', '13:34', '14:00', '2024-11-25 22:35:20', '2024-11-26 08:39:00');
INSERT INTO `absence` VALUES ('6', 'Fisika', '1', '-6.172400197511298', '106.76945912133789', '250', '12:01', '13:01', '2024-11-27 04:24:43', '2024-11-27 04:33:29');

-- ----------------------------
-- Table structure for `attendances`
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL,
  `latlon_in` varchar(255) NOT NULL,
  `latlon_out` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_user_id_foreign` (`user_id`),
  CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES ('1', '11', '2', '2024-11-01', '19:15:08', '12:43:55', '-18.976838,147.221327', '-25.979462,76.114773', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('2', '12', '2', '2024-11-01', '13:23:33', '08:19:54', '55.731997,94.401312', '82.035758,-115.025432', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('3', '13', '2', '2024-11-01', '19:53:51', '12:02:51', '38.873729,-72.72991', '-60.609859,-12.662576', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('4', '14', '1', '2024-11-01', '21:24:54', '01:45:34', '39.913451,149.026703', '63.509067,-17.447645', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('5', '15', '1', '2024-11-01', '21:44:46', '01:53:55', '28.902243,-87.110202', '48.969029,-118.720563', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('6', '11', '2', '2024-11-02', '13:38:46', '10:20:02', '-56.188478,-99.590273', '-27.42429,36.556998', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('7', '12', '2', '2024-11-02', '09:58:41', '19:48:06', '-80.30218,95.547481', '-12.624282,-131.684737', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('8', '13', '2', '2024-11-02', '23:37:26', '04:10:41', '8.812605,-99.450314', '89.928335,31.440474', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('9', '14', '1', '2024-11-02', '19:15:45', '10:27:45', '-84.77674,68.171075', '51.044231,33.805646', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('10', '15', '1', '2024-11-02', '21:35:09', '12:22:30', '64.865323,156.512125', '73.822907,-14.07056', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('11', '11', '2', '2024-11-04', '21:43:51', '23:49:15', '45.133275,-18.431318', '51.611772,-168.181606', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('12', '13', '2', '2024-11-04', '06:35:03', '05:10:27', '14.582268,-30.366556', '-50.269788,118.165899', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('13', '14', '1', '2024-11-04', '19:13:25', '02:56:26', '61.795382,28.203671', '-20.955008,-75.231313', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('14', '15', '1', '2024-11-04', '11:00:33', '15:31:00', '-24.937477,-8.603186', '-56.160742,158.011342', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('15', '11', '2', '2024-11-05', '19:33:15', '07:24:37', '42.561852,138.679119', '-32.618448,58.644111', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('16', '14', '1', '2024-11-05', '09:48:28', '17:00:16', '-50.803509,-91.232159', '-64.70847,-177.91501', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('17', '15', '1', '2024-11-05', '19:40:21', '04:35:40', '50.14743,-65.608009', '47.397592,-40.909489', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('18', '11', '2', '2024-11-06', '10:04:32', '11:16:15', '25.80706,-49.386507', '-59.220184,49.224845', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('19', '12', '2', '2024-11-06', '20:06:33', '00:00:13', '-28.418955,154.958394', '-61.943092,-52.301873', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `attendances` VALUES ('20', '13', '2', '2024-11-06', '21:41:54', '12:36:14', '74.860255,45.855411', '36.642242,146.55609', '2024-11-23 05:40:52', '2024-11-23 05:40:52');

-- ----------------------------
-- Table structure for `cache`
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('0cf01f171aa83b9bea2de0aa87deec5d', 'i:1;', '1732365262');
INSERT INTO `cache` VALUES ('0cf01f171aa83b9bea2de0aa87deec5d:timer', 'i:1732365262;', '1732365262');
INSERT INTO `cache` VALUES ('3fefef0d24f5a78558468ff0c583be79', 'i:1;', '1732373085');
INSERT INTO `cache` VALUES ('3fefef0d24f5a78558468ff0c583be79:timer', 'i:1732373085;', '1732373085');
INSERT INTO `cache` VALUES ('86970c70cc5649299dc89459bf238b31', 'i:1;', '1732368638');
INSERT INTO `cache` VALUES ('86970c70cc5649299dc89459bf238b31:timer', 'i:1732368638;', '1732368638');
INSERT INTO `cache` VALUES ('89f2e8460316bf43dcce797245b1ebee', 'i:1;', '1732365559');
INSERT INTO `cache` VALUES ('89f2e8460316bf43dcce797245b1ebee:timer', 'i:1732365559;', '1732365559');
INSERT INTO `cache` VALUES ('93a3e3d705467b4403dd1d0f9b22a3ce', 'i:1;', '1732373122');
INSERT INTO `cache` VALUES ('93a3e3d705467b4403dd1d0f9b22a3ce:timer', 'i:1732373122;', '1732373122');
INSERT INTO `cache` VALUES ('9cf57a4c244a2b0ddd14afe553fd1068', 'i:1;', '1732365291');
INSERT INTO `cache` VALUES ('9cf57a4c244a2b0ddd14afe553fd1068:timer', 'i:1732365291;', '1732365291');
INSERT INTO `cache` VALUES ('a3e6bf171da753709c5cbe51624f3af4', 'i:1;', '1732373106');
INSERT INTO `cache` VALUES ('a3e6bf171da753709c5cbe51624f3af4:timer', 'i:1732373106;', '1732373106');
INSERT INTO `cache` VALUES ('ca6b1752146cde4921028418f092a5a1', 'i:1;', '1732373163');
INSERT INTO `cache` VALUES ('ca6b1752146cde4921028418f092a5a1:timer', 'i:1732373163;', '1732373163');
INSERT INTO `cache` VALUES ('camila.jakubowski@example.net|127.0.0.1', 'i:1;', '1732365263');
INSERT INTO `cache` VALUES ('camila.jakubowski@example.net|127.0.0.1:timer', 'i:1732365263;', '1732365263');
INSERT INTO `cache` VALUES ('f7467ac9a803bfd7a4b9e0c0d1e5d8e9', 'i:1;', '1732373180');
INSERT INTO `cache` VALUES ('f7467ac9a803bfd7a4b9e0c0d1e5d8e9:timer', 'i:1732373180;', '1732373180');
INSERT INTO `cache` VALUES ('tressie45@example.com|127.0.0.1', 'i:1;', '1732365291');
INSERT INTO `cache` VALUES ('tressie45@example.com|127.0.0.1:timer', 'i:1732365291;', '1732365291');

-- ----------------------------
-- Table structure for `cache_locks`
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Guru', '2024-11-26 22:14:13', '2024-11-26 15:48:50');
INSERT INTO `category` VALUES ('2', 'Siswa Berprestasi', '2024-11-26 15:50:26', '2024-11-27 12:38:02');
INSERT INTO `category` VALUES ('5', 'pegawai', '2024-11-29 12:56:06', '2024-11-29 12:56:06');

-- ----------------------------
-- Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `radius_km` varchar(255) NOT NULL,
  `time_in` varchar(255) NOT NULL,
  `time_out` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', 'PT. Thinksvy', 'chevy@gmail.com', 'Jl. Depok Kota Depok', '-7.747033', '110.355398', '0.5', '08:00', '17:00', '2024-11-23 05:40:52', '2024-11-23 05:40:52');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `job_batches`
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '0001_01_01_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '0001_01_01_000001_create_cache_table', '1');
INSERT INTO `migrations` VALUES ('3', '0001_01_01_000002_create_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2024_04_22_071653_add_two_factor_columns_to_users_table', '1');
INSERT INTO `migrations` VALUES ('5', '2024_04_22_071741_add_phone_role_at_users', '1');
INSERT INTO `migrations` VALUES ('6', '2024_04_29_070422_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('7', '2024_05_19_025334_create_companies_table', '1');
INSERT INTO `migrations` VALUES ('8', '2024_05_19_041712_create_attendances_table', '1');
INSERT INTO `migrations` VALUES ('9', '2024_05_19_055509_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('10', '2024_05_19_071815_create_notes_table', '1');
INSERT INTO `migrations` VALUES ('11', '2024_05_19_113337_add_fcm_token_add_users', '1');
INSERT INTO `migrations` VALUES ('12', '2024_11_24_053840_create_absence_table', '2');
INSERT INTO `migrations` VALUES ('13', '2024_11_26_150012_create_category_table', '3');
INSERT INTO `migrations` VALUES ('14', '2024_11_26_150523_create_category_table', '4');

-- ----------------------------
-- Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_foreign` (`user_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notes
-- ----------------------------

-- ----------------------------
-- Table structure for `password_reset_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `date_permission` date NOT NULL,
  `reason` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '10', '2005-01-03', 'Exercitationem dolor voluptate molestiae saepe. Suscipit sed inventore non voluptatem quo fugit nulla. Ab incidunt nostrum doloribus.', 'https://via.placeholder.com/640x480.png/001111?text=et', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('2', '10', '2017-03-01', 'Aperiam deserunt rerum non dignissimos reiciendis. Quae expedita voluptas voluptas nostrum. Unde voluptas doloribus ratione qui expedita atque. Accusamus nihil enim et quas neque.', 'https://via.placeholder.com/640x480.png/00aacc?text=et', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('3', '10', '2009-08-07', 'Saepe velit natus sed eos unde rerum reiciendis. At beatae asperiores quo aut. Reprehenderit officia eos minus sapiente quos. Assumenda magnam minima explicabo ducimus unde consectetur.', 'https://via.placeholder.com/640x480.png/0066aa?text=deserunt', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('4', '10', '2019-03-21', 'Est enim molestiae ex quos tempore delectus. Reprehenderit alias ad beatae ipsa id nobis aut voluptas. Et non quasi velit quam. Culpa reprehenderit vel nulla consequatur odit dolore et.', 'https://via.placeholder.com/640x480.png/00ff55?text=magnam', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('5', '10', '2022-06-28', 'Explicabo et dolores qui totam illum. Consequatur sequi dolores quod ipsum. Ex et ipsum unde. Commodi deserunt doloribus vel possimus suscipit quo.', 'https://via.placeholder.com/640x480.png/003366?text=modi', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('6', '10', '1998-03-31', 'Et temporibus nihil rem illo atque neque est. Et veritatis error recusandae qui aut. Maiores nesciunt facilis tenetur modi. Facere explicabo quos id ut quas.', 'https://via.placeholder.com/640x480.png/006622?text=illum', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('7', '10', '2016-06-25', 'Porro alias iste reprehenderit accusantium hic assumenda. Non placeat impedit beatae dolore in quam ullam. Sequi soluta voluptatem consequatur explicabo tenetur et rerum. Laboriosam ut eum natus.', 'https://via.placeholder.com/640x480.png/001122?text=et', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('8', '10', '1999-05-17', 'Dolorum quam ipsa consectetur voluptatum dolor aut. Iusto at et nostrum et. Est culpa veniam ex nemo sed. Nemo perspiciatis praesentium corporis.', 'https://via.placeholder.com/640x480.png/00eeff?text=ut', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('9', '10', '1985-04-11', 'Rem architecto numquam facilis ut harum. Laboriosam nulla qui nisi. In tenetur eum sapiente et optio nobis rerum hic. Nisi dolores expedita expedita explicabo qui.', 'https://via.placeholder.com/640x480.png/0088ee?text=magnam', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('10', '10', '1970-08-01', 'Amet quia ipsum aut fugiat quia quia. Eum ut et voluptas officiis amet a.', 'https://via.placeholder.com/640x480.png/0033aa?text=et', '0', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('11', '10', '2011-04-21', 'Provident nesciunt recusandae quod et dolore velit nemo. Tempore architecto est voluptatem. Harum aliquam architecto nemo distinctio cum. Asperiores modi ut et et et est magnam.', 'https://via.placeholder.com/640x480.png/0055ff?text=quis', '0', '2024-11-23 05:40:52', '2024-11-23 13:25:57');
INSERT INTO `permissions` VALUES ('12', '10', '2021-10-28', 'Accusamus qui cupiditate cumque quam ipsam. In dignissimos blanditiis et commodi ullam dolores. Culpa deleniti nulla vitae esse quis modi quo. Quos adipisci quia neque rerum et.', 'https://via.placeholder.com/640x480.png/00ddaa?text=cumque', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('13', '10', '2004-08-27', 'Est et ut quidem id ad iusto. Et omnis sit consequatur ab. Et eveniet neque repudiandae occaecati mollitia perspiciatis. Dolor voluptas molestias aliquam laborum et est.', 'https://via.placeholder.com/640x480.png/0044bb?text=cum', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('14', '10', '1975-07-26', 'Officia quam inventore qui cum suscipit. Deserunt laboriosam laudantium molestiae illum sit explicabo. Molestiae nihil corrupti est distinctio debitis non.', 'https://via.placeholder.com/640x480.png/00ff33?text=illum', '1', '2024-11-23 05:40:52', '2024-11-23 05:40:52');
INSERT INTO `permissions` VALUES ('15', '10', '2002-01-10', 'Accusantium corrupti aut dolor iure exercitationem et. Mollitia facere alias animi non. Cum pariatur et consequatur et debitis velit ut sunt. Consequatur molestiae voluptas saepe et quasi.', 'https://via.placeholder.com/640x480.png/0000aa?text=voluptatibus', '0', '2024-11-23 05:40:52', '2024-11-23 13:26:14');

-- ----------------------------
-- Table structure for `personal_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('8dnu2NnMUHgrVK02V4XYAvZMcATQwwjzXsFyZSbB', '14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoialY2RzRXR2laU2g2V2NROVJROGhUbGtmVnN6bUNYVXN0WmE5U3RrNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hYnNlbmNlcy9jcmVhdGUiO319', '1732886326');
INSERT INTO `sessions` VALUES ('phDvhjZXdRBaZxcwKjIxHxhMkRtyXjDHT09qA78R', '14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS3dKSGJXSGdSZ3FSTGxuT2ltVmZBNGtQTjZxWEl2VGxQY1NjMm4yMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdHRlbmRhbmNlcy9leHBvcnQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNDt9', '1732714353');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  `face_embedding` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `roles` varchar(255) NOT NULL DEFAULT 'user',
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Dr. Gus Langosh', 'sidney.ward@example.org', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, '4sYVrxyS1v', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('2', '1', 'Gertrude Jerde', 'marc.dickens@example.net', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, '1rWvwPJgrU', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('3', '1', 'Nakia Baumbach IV', 'gcrooks@example.org', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'ualgvwsuaH', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('4', '1', 'Juston Kuhn', 'cronin.devan@example.org', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'lysFgJ3UXu', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('5', '1', 'Trystan Labadie MD', 'wilderman.nathen@example.com', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'hvgnEeIyGH', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('6', '1', 'Reynold Johnston', 'ugibson@example.net', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'XCeUEgo0QD', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('7', '1', 'Emiliano Cummerata', 'tressie45@example.com', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'sieqLi5YiY', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('8', '1', 'Blaise Walter', 'adrianna.kreiger@example.net', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'WBAVfL51Pq', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('9', '1', 'Makayla Wilkinson', 'beryl48@example.net', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'TUcI0ZpeqB', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('10', '1', 'Dr. Alexandre Willms', 'camila.jakubowski@example.net', '2024-11-23 05:40:52', '$2y$12$/6n6VrjWiy54FFhaNlcCnetHrLAnaAlH2eGC2omAyvvK4bFROKomm', null, null, null, 'WMVJDWk99s', null, '2024-11-23 05:40:52', '2024-11-23 05:40:52', null, 'IT', null, null, null, 'user', '');
INSERT INTO `users` VALUES ('11', '2', 'Nico', 'nico@gmail.com', '2024-11-23 05:40:52', '$2y$12$5FOCmFZ5ADtSQk.p0V1wL.YLitaA797sABP4YBJJtSR6jlcAvfVdW', null, null, null, 'QBuxZJA0sm', null, '2024-11-23 05:40:52', '2024-11-24 05:09:58', null, 'JL Ijen', null, null, '0812345261736', 'user', 'male');
INSERT INTO `users` VALUES ('12', '2', 'daniel', 'daniel@gmail.com', null, '$2y$12$oH.0KIaxWWDk5tqYypEVqOzmIzuXZhCPGp6NXRLNCDvsR/u.8jqtu', null, null, null, null, null, '2024-11-23 12:41:28', '2024-11-24 05:08:21', null, 'Jl Pisang Candi', null, null, '081233386855', 'user', 'male');
INSERT INTO `users` VALUES ('13', '2', 'marcel', 'marcel@gmail.com', null, '$2y$12$cswp2u6tDm1zOWmPgqJxNuSiLvfBVO88E8wZ/aFu7N6eX/DyZrG7G', null, null, null, null, null, '2024-11-23 13:31:04', '2024-11-27 03:32:33', null, 'Jl. Ir rais 14 no.56', null, null, '081233386855', 'user', 'female');
INSERT INTO `users` VALUES ('14', '1', 'mama', 'mama@gmail.com', null, '$2y$12$lGvieXuW.faEnAd6hQ.9beiLWcHYhMZ36qdpW68/5aU7B5MnonAxm', null, null, null, null, null, '2024-11-23 13:38:11', '2024-11-24 05:08:09', null, 'JL Bromo', null, null, '0812345627182', 'admin', 'female');
INSERT INTO `users` VALUES ('15', '1', 'papa', 'papa@gmail.com', null, '$2y$12$8k0EEUwF87bwEs1w3gsQjuMsUyG5OAN8cX9LHgT7fO.a4iEyKxxIK', null, null, null, null, null, '2024-11-23 13:49:09', '2024-11-27 03:27:57', null, 'JL Welirang', null, null, '081233386855', 'employee', 'male');
INSERT INTO `users` VALUES ('21', '5', 'Dias', 'dias@gmail.com', null, '$2y$12$D5RNhvIBlbbK0hdr/pqdKu5382yoC4pYzbpKe0UrZyQB1OFDeYsW.', null, null, null, null, null, '2024-11-29 12:57:29', '2024-11-29 12:57:29', null, 'Jl. Ir rais 14 no.56', null, null, '081233386855', 'employee', 'female');
