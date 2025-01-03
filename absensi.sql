/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : absensi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2025-01-03 18:33:42
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
  `time_in_sesi2` varchar(255) DEFAULT NULL,
  `time_out_sesi2` varchar(255) DEFAULT NULL,
  `time_in_sesi3` varchar(255) DEFAULT NULL,
  `time_out_sesi3` varchar(255) DEFAULT NULL,
  `time_in_sesi4` varchar(255) DEFAULT NULL,
  `time_out_sesi4` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES ('1', 'Primary', '1', '55.731997,94.401315', '82.035758,-115.025435', '495', '07:00:08', '09:00:54', null, null, null, null, null, null, '2024-11-24 13:49:24', '2024-11-25 22:28:33');
INSERT INTO `absence` VALUES ('2', 'Matematika', '2', '55.731997,94.401315', '82.035758,-115.025432', '250', '07:30', '08:00', null, null, null, null, null, null, '2024-11-25 22:34:05', '2024-11-25 22:34:05');
INSERT INTO `absence` VALUES ('3', 'Biologi', '2', '-7.986403988475149', '112.61654741363418', '250', '13:34', '15:00', '22:20', '22:30', '22:45', '23:50', null, null, '2024-11-25 22:35:20', '2024-12-29 14:26:14');
INSERT INTO `absence` VALUES ('6', 'Fisika', '2', '-7.986355708983527', '112.61662421208666', '250', '12:01', '13:01', '18:17', '19:17', '19:30', '22:40', null, null, '2024-11-27 04:24:43', '2024-12-30 20:32:48');
INSERT INTO `absence` VALUES ('7', 'rapat', '1', '-6.235651950062367', '106.78302037011719', '230', '15:37', '16:37', null, null, null, null, null, null, '2024-12-03 08:37:48', '2024-12-03 08:39:18');
INSERT INTO `absence` VALUES ('8', 'dokumentasi', '1', '-6.221317512552811', '106.77460896264648', '59', '15:38', '16:38', '18:38', '19:38', null, null, null, null, '2024-12-03 08:38:42', '2024-12-03 08:38:42');
INSERT INTO `absence` VALUES ('9', 'mengajar', '1', '-6.227080688253128', '106.80891036987305', '150', '04:40', '05:40', '17:40', '19:40', '19:41', '20:41', null, null, '2024-12-03 08:41:29', '2024-12-03 10:16:20');
INSERT INTO `absence` VALUES ('10', 'notulensi', '1', '-7.946891200000002', '112.6161209', '200', '17:42', '18:42', '19:42', '20:42', '21:42', '22:42', '22:46', '23:50', '2024-12-03 08:43:07', '2024-12-08 23:07:13');
INSERT INTO `absence` VALUES ('11', 'acc absen', '5', '-7.986352467456034', '112.61662869458267', '500', '08:03', '22:07', null, null, null, null, null, null, '2024-12-23 21:04:07', '2024-12-28 22:19:48');

-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `absence_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `latlon_in` varchar(255) NOT NULL,
  `latlon_out` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('1', '11', '2', '2', '2024-12-05', '07:33:35', '18.976838', '76.114773', 'http://localhost', '2024-12-22 22:05:48', '2024-12-22 22:05:48');
INSERT INTO `attendance` VALUES ('2', '12', '2', '2', '2024-12-05', '07:32:07', '18.976838', '76.114773', 'http://localhost', '2024-12-22 22:05:57', '2024-12-22 22:05:57');
INSERT INTO `attendance` VALUES ('3', '13', '2', '2', '2024-12-05', '07:33:11', '18.976838', '76.114773', 'http://localhost', '2024-12-22 22:06:09', '2024-12-22 22:06:09');
INSERT INTO `attendance` VALUES ('4', '15', '1', '1', '2024-12-05', '07:33:59', '18.976838', '76.114773', 'http://localhost', '2024-12-22 22:06:17', '2024-12-22 22:06:17');
INSERT INTO `attendance` VALUES ('5', '11', '3', '2', '2024-12-07', '03:37:51', '-7.982078', '112.630982', 'http://localhost', '2024-12-09 22:02:22', '2024-12-09 22:02:22');
INSERT INTO `attendance` VALUES ('6', '12', '3', '2', '2024-12-07', '13:35:35', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:53:51', '2024-12-09 19:53:51');
INSERT INTO `attendance` VALUES ('7', '13', '3', '2', '2024-12-07', '13:37:00', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:53:57', '2024-12-09 19:53:57');
INSERT INTO `attendance` VALUES ('8', '14', '1', '5', '2024-12-07', '07:37:58', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:54:04', '2024-12-09 19:54:04');
INSERT INTO `attendance` VALUES ('9', '15', '7', '1', '2024-12-07', '15:42:39', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:54:33', '2024-12-09 19:54:33');
INSERT INTO `attendance` VALUES ('10', '11', '6', '2', '2024-12-08', '12:37:38', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:54:43', '2024-12-09 19:54:43');
INSERT INTO `attendance` VALUES ('11', '12', '6', '2', '2024-12-08', '12:49:21', '-7.982080', '112.630991', 'http://localhost', '2024-12-09 19:54:48', '2024-12-09 19:54:48');
INSERT INTO `attendance` VALUES ('12', '11', '6', '2', '2024-12-08', '18:45:05', '7.982080', '112.630991', 'http://localhost', '2024-12-10 22:45:32', '2024-12-10 22:45:32');
INSERT INTO `attendance` VALUES ('13', '15', '9', '1', '2024-12-09', '05:00:47', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:02:08', '2024-12-10 23:02:08');
INSERT INTO `attendance` VALUES ('14', '15', '9', '1', '2024-12-09', '18:01:28', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:02:14', '2024-12-10 23:02:14');
INSERT INTO `attendance` VALUES ('15', '15', '9', '1', '2024-12-09', '20:02:25', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:02:44', '2024-12-10 23:02:44');
INSERT INTO `attendance` VALUES ('16', '15', '9', '1', '2024-12-10', '05:02:54', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:03:07', '2024-12-10 23:03:07');
INSERT INTO `attendance` VALUES ('17', '15', '9', '1', '2024-12-10', '18:03:54', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:04:09', '2024-12-10 23:04:09');
INSERT INTO `attendance` VALUES ('18', '15', '9', '1', '2024-12-10', '20:04:43', '-7.982080', '112.630991', 'http://localhost', '2024-12-10 23:04:53', '2024-12-10 23:04:53');
INSERT INTO `attendance` VALUES ('19', '11', '2', '2', '2024-12-14', '21:38:22', '-7.982080', '112.630991', 'http://localhost', '2024-12-14 21:38:22', '2024-12-14 21:38:22');
INSERT INTO `attendance` VALUES ('20', '12', '2', '2', '2024-12-14', '21:39:05', '-7.982080', '112.630991', 'http://localhost', '2024-12-14 21:39:05', '2024-12-14 21:39:05');
INSERT INTO `attendance` VALUES ('21', '13', '2', '2', '2024-12-14', '21:43:01', '-7.982080', '112.630991', 'http://127.0.0.1:8000/storage/attendance_images/rVyiP9QAIs8FuMNDVj4dWDFQwgsYfoOeeywMLDlh.jpg', '2024-12-14 21:43:01', '2024-12-14 21:43:01');
INSERT INTO `attendance` VALUES ('22', '11', '2', '2', '2024-12-14', '21:46:17', '-7.982080', '112.630991', 'http://127.0.0.1:8000/storage/attendance_images/Nao6az2gYgZLbrFe82uPoYB5bmHPnMlWTvmkrxmS.jpg', '2024-12-14 21:46:18', '2024-12-14 21:46:18');
INSERT INTO `attendance` VALUES ('23', '12', '2', '2', '2024-12-22', '11:26:04', '-7.982080', '112.630991', 'http://127.0.0.1:8000/storage/attendance_images/tRoa3wtbHnwgWaUVxVUCoPp6bn867HW3451IINvV.jpg', '2024-12-22 11:26:04', '2024-12-22 11:26:04');
INSERT INTO `attendance` VALUES ('24', '11', '2', '2', '2024-12-22', '11:34:53', '-7.982080', '112.630991', 'http://192.168.0.3:8000/storage/attendance_images/ecqTTEx21vZYZmJRH7F6aMRGt5KV8FuM21rdyrGh.jpg', '2024-12-22 11:34:53', '2024-12-22 11:34:53');
INSERT INTO `attendance` VALUES ('25', '11', '2', '2', '2024-12-22', '11:41:46', '-7.982080', '112.630991', 'http://192.168.0.3:8000/storage/attendance_images/YwmmY7MkJn3JAJGArYchzFpqA7hDwLgZwpZ9ABAE.jpg', '2024-12-22 11:41:46', '2024-12-22 11:41:46');
INSERT INTO `attendance` VALUES ('26', '11', '2', '2', '2024-12-22', '13:21:24', '-7.982080', '112.630991', 'http://172.20.10.5:8000/storage/attendance_images/HX88D3sS8NH6OMTCbXLTjJLG8FjnWNALYxqfUjeE.jpg', '2024-12-22 13:21:24', '2024-12-22 13:21:24');
INSERT INTO `attendance` VALUES ('27', '11', '2', '2', '2024-12-22', '13:52:13', '-7.982080', '112.630991', 'http://192.168.0.2:8000/storage/attendance_images/omc4n5fLkmJYowbSU94sQEboHxigC6sTqAHbknBF.jpg', '2024-12-22 13:52:13', '2024-12-22 13:52:13');
INSERT INTO `attendance` VALUES ('28', '11', '2', '2', '2024-12-22', '13:53:52', '-7.982080', '112.630991', 'http://192.168.0.2:8000/storage/attendance_images/b1LfhsAKzgJB55NDG2eR940is9aYc6o2YFyYzOkc.jpg', '2024-12-22 13:53:52', '2024-12-22 13:53:52');
INSERT INTO `attendance` VALUES ('29', '11', '2', '2', '2024-12-22', '14:42:51', '-7.982080', '112.630991', 'http://192.168.0.2:8000/storage/attendance_images/iINfP8tXfiLqOj2vCp7JWdCCtlEhaoUe9Ppmx5tW.jpg', '2024-12-22 14:42:51', '2024-12-22 14:42:51');
INSERT INTO `attendance` VALUES ('30', '11', '2', '2', '2024-12-23', '20:22:26', '-7.982080', '112.630991', 'http://192.168.17.234:8000/storage/attendance_images/HpMAKOzLOQHzIh2U5KpLiRjA76JcBjWGekVwhsal.jpg', '2024-12-23 20:22:26', '2024-12-23 20:22:26');
INSERT INTO `attendance` VALUES ('31', '11', '2', '2', '2024-12-28', '13:56:18', '-7.982080', '112.630991', 'http://192.168.1.8:8000/storage/attendance_images/oCwmh6njhzlDb5grmM04wYNb0h3BoRxBtoCjR9kl.jpg', '2024-12-28 13:56:18', '2024-12-28 13:56:18');
INSERT INTO `attendance` VALUES ('32', '11', '2', '2', '2024-12-28', '14:26:29', '-7.982080', '112.630991', 'http://192.168.1.8:8000/storage/attendance_images/6tCdAxVFeMVtklV4DBfMDnLPpzBCUhZgXLjKCVcx.jpg', '2024-12-28 14:26:29', '2024-12-28 14:26:29');
INSERT INTO `attendance` VALUES ('33', '21', '11', '5', '2024-12-28', '14:28:03', '-7.9780613', '112.6692926', 'http://192.168.1.8:8000/storage/attendance_images/4a3ips9F6HualzYvseZ52ulQknNr3FQn6Uug3Ghw.jpg', '2024-12-28 14:28:03', '2024-12-28 14:28:03');
INSERT INTO `attendance` VALUES ('34', '23', '11', '5', '2024-12-28', '22:20:59', '-7.9867777', '112.6165124', 'http://192.168.0.7:8000/storage/attendance_images/BKyqrZtNmwydgXJbMdxsrAMHzg4hUXW4i4hVmQuW.jpg', '2024-12-28 22:20:59', '2024-12-28 22:20:59');
INSERT INTO `attendance` VALUES ('35', '24', '3', '2', '2024-12-29', '14:28:29', '-7.9867847', '112.6165147', 'http://192.168.0.3:8000/storage/attendance_images/GIpTP7MZfzdBUgoXpdL1aK2PKpy0qGl0OIv3Sxnl.jpg', '2024-12-29 14:28:29', '2024-12-29 14:28:29');
INSERT INTO `attendance` VALUES ('36', '25', '6', '2', '2024-12-30', '20:44:39', '-7.9867639', '112.6165264', 'http://192.168.0.2:8000/storage/attendance_images/DQPzbXuttRgmajspXYKkNRSuzAOUCf2DZftinKJl.jpg', '2024-12-30 20:44:39', '2024-12-30 20:44:39');
INSERT INTO `attendance` VALUES ('37', '25', '3', '2', '2024-12-30', '23:29:25', '-7.9867715', '112.6165281', 'http://192.168.0.4:8000/storage/attendance_images/ooLwD3sppk7a0oqZIo9lw1RZiPwAecNB3E6xmNRw.jpg', '2024-12-30 23:29:25', '2024-12-30 23:29:25');

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
  `absence_id` bigint(20) NOT NULL,
  `date_permission` date NOT NULL,
  `reason` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('16', '15', '9', '2024-12-14', 'sakit', 'http://192.168.17.234:8000/storage/attendance_images/HpMAKOzLOQHzIh2U5KpLiRjA76JcBjWGekVwhsal.jpg', '1', '21', '2024-12-14 22:22:52', '2024-12-25 22:42:12');
INSERT INTO `permissions` VALUES ('17', '11', '2', '2024-12-15', 'sakit', 'http://127.0.0.1:8000/storage/permissions_images/vb6yfnCMnBEhWLrRhPNnL5YTT3uYYWrQ5vdIwwX4.jpg', '1', '21', '2024-12-14 22:39:37', '2024-12-25 22:42:20');
INSERT INTO `permissions` VALUES ('18', '21', '9', '2024-12-23', 'sakit', 'http://192.168.17.234:8000/storage/attendance_images/HpMAKOzLOQHzIh2U5KpLiRjA76JcBjWGekVwhsal.jpg', '1', '21', '2024-12-23 22:24:52', '2024-12-25 22:28:54');
INSERT INTO `permissions` VALUES ('19', '11', '2', '2024-12-28', 'sakit', 'http://192.168.1.8:8000/storage/permissions_images/IUFENZxuTeWp9YkL3qZcrTFERVPrXbrqM9E5HgvW.jpg', '1', '21', '2024-12-28 10:53:32', '2024-12-28 22:59:19');
INSERT INTO `permissions` VALUES ('20', '21', '11', '2024-12-28', 'yhcghyf', 'http://192.168.1.8:8000/storage/permissions_images/A1Wvhcdy1UXf4Wk9i43HNpO7sVoePPI6HfEY53fs.jpg', '1', '23', '2024-12-28 11:02:48', '2024-12-28 13:17:00');
INSERT INTO `permissions` VALUES ('21', '23', '11', '2024-12-28', 'gawai nikah', 'http://192.168.1.8:8000/storage/permissions_images/5zY5dzSfnzyz7918miv1qu6nCV3hrLGOdIGxizbX.jpg', '1', '21', '2024-12-28 13:18:15', '2024-12-28 13:21:08');
INSERT INTO `permissions` VALUES ('22', '21', '11', '2024-12-28', 'izin lagi', 'http://192.168.1.8:8000/storage/permissions_images/zgBVkB67fVYoJwnZ9L8KYmmLiVSj2d3bfEEKwr2O.jpg', '1', '23', '2024-12-28 13:39:19', '2024-12-28 22:18:04');
INSERT INTO `permissions` VALUES ('23', '24', '3', '2024-12-29', 'healing', 'http://192.168.0.3:8000/storage/permissions_images/19f89XdMjIuS6FwMoEs53hpngcjyTOIG6fBxR5Bl.jpg', '1', '21', '2024-12-29 14:37:40', '2024-12-29 14:38:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES ('1', 'App\\Models\\User', '11', 'auth_token', '732b993f3ac7c9992038ac15852821d95bf23da76a951050bd5947684fb2392e', '[\"*\"]', null, null, '2024-12-07 01:27:04', '2024-12-07 01:27:04');
INSERT INTO `personal_access_tokens` VALUES ('2', 'App\\Models\\User', '11', 'auth_token', '4a1052dfd2668702ab46c932f16385fbfd45ca04a3ec736b912a2d49b362fe07', '[\"*\"]', null, null, '2024-12-07 01:27:18', '2024-12-07 01:27:18');
INSERT INTO `personal_access_tokens` VALUES ('3', 'App\\Models\\User', '11', 'auth_token', '1798b87a6c59688481ddd8f6a0564dea4d9887bdf66f2bae54cdb6cd95658d7f', '[\"*\"]', null, null, '2024-12-07 01:27:46', '2024-12-07 01:27:46');
INSERT INTO `personal_access_tokens` VALUES ('4', 'App\\Models\\User', '11', 'auth_token', '83cb1e06fbcbf0d3b993a0a04122c78b0994e7edaadaf81c0a2d42e024675604', '[\"*\"]', null, null, '2024-12-07 01:28:23', '2024-12-07 01:28:23');
INSERT INTO `personal_access_tokens` VALUES ('5', 'App\\Models\\User', '11', 'auth_token', 'ab8ac2231e3edd43e0d8f19cb866429cb01cbb6c31d3ffd26ba9378284a757e0', '[\"*\"]', null, null, '2024-12-07 01:31:34', '2024-12-07 01:31:34');
INSERT INTO `personal_access_tokens` VALUES ('6', 'App\\Models\\User', '11', 'auth_token', 'a2ccfb30ebf3a02b1bc52dfeccbca731428c0901233cf3b779c29ea057657098', '[\"*\"]', null, null, '2024-12-07 01:31:50', '2024-12-07 01:31:50');
INSERT INTO `personal_access_tokens` VALUES ('7', 'App\\Models\\User', '11', 'auth_token', 'd9c728876efeeb5dfe00e317c2c85916e85fbb40c573044ca0a0f5aa1396a229', '[\"*\"]', null, null, '2024-12-07 01:32:15', '2024-12-07 01:32:15');
INSERT INTO `personal_access_tokens` VALUES ('8', 'App\\Models\\User', '11', 'auth_token', '3917847ed073498ef67ecfbc8974a6ef568cecea2498b0e8e6fe89d95833277e', '[\"*\"]', null, null, '2024-12-07 01:32:53', '2024-12-07 01:32:53');
INSERT INTO `personal_access_tokens` VALUES ('9', 'App\\Models\\User', '11', 'auth_token', 'ea7d513640d7fe030708cc7fdfbb6adce15c69cf48612075a0b710f3e25b0e49', '[\"*\"]', null, null, '2024-12-07 01:33:09', '2024-12-07 01:33:09');
INSERT INTO `personal_access_tokens` VALUES ('10', 'App\\Models\\User', '11', 'auth_token', '01c155098760d0b4d6aeedd43070cbb748c026132e3db990f2468134fb28cc7c', '[\"*\"]', null, null, '2024-12-07 01:33:31', '2024-12-07 01:33:31');
INSERT INTO `personal_access_tokens` VALUES ('12', 'App\\Models\\User', '11', 'auth_token', '803f36f876368a1ea4b4ceb29077307711d539b70161c18614db04dc67696a9d', '[\"*\"]', null, null, '2024-12-07 01:35:32', '2024-12-07 01:35:32');
INSERT INTO `personal_access_tokens` VALUES ('13', 'App\\Models\\User', '11', 'auth_token', '7c0885d5d280efaed5dcd533ac94fbff3f8870504bec35856d4233f27b1d5008', '[\"*\"]', null, null, '2024-12-07 01:44:04', '2024-12-07 01:44:04');
INSERT INTO `personal_access_tokens` VALUES ('14', 'App\\Models\\User', '11', 'auth_token', '098e7e5f1ec98dc850c61a508d46a7c677e6397d4a64bef409967f725cd9813d', '[\"*\"]', null, null, '2024-12-07 01:44:36', '2024-12-07 01:44:36');
INSERT INTO `personal_access_tokens` VALUES ('15', 'App\\Models\\User', '11', 'auth_token', 'e0a39d7f3cf619bc270841b431ecfccd52755c726e7b1c664770433f1bafef59', '[\"*\"]', null, null, '2024-12-07 01:47:17', '2024-12-07 01:47:17');
INSERT INTO `personal_access_tokens` VALUES ('16', 'App\\Models\\User', '11', 'auth_token', 'bed689f19155572a846a7c1be2f7c793ea93ef2132d97452f3f82a2162830281', '[\"*\"]', null, null, '2024-12-07 01:51:20', '2024-12-07 01:51:20');
INSERT INTO `personal_access_tokens` VALUES ('17', 'App\\Models\\User', '11', 'auth_token', 'f299d2ec5408ef4eca78db64032fd44af76e8c471c6424074f44fc411fcae8fd', '[\"*\"]', null, null, '2024-12-07 01:55:15', '2024-12-07 01:55:15');
INSERT INTO `personal_access_tokens` VALUES ('18', 'App\\Models\\User', '11', 'auth_token', 'dc15a3495573129744f5fc9a6d101cd78dbb7276e42af96158f2f897a83cb11a', '[\"*\"]', null, null, '2024-12-07 02:13:57', '2024-12-07 02:13:57');
INSERT INTO `personal_access_tokens` VALUES ('19', 'App\\Models\\User', '12', 'auth_token', '4817d6f4b0e7abf9d03f551da3372616012ef8856a31e9b24c49852de75d2c19', '[\"*\"]', '2024-12-07 02:39:25', null, '2024-12-07 02:25:30', '2024-12-07 02:39:25');
INSERT INTO `personal_access_tokens` VALUES ('20', 'App\\Models\\User', '13', 'auth_token', 'f764fa546b24c40bfb6066f47f6acba9f093de2e58b8ece1ae5a2d46823df9aa', '[\"*\"]', null, null, '2024-12-07 02:40:26', '2024-12-07 02:40:26');
INSERT INTO `personal_access_tokens` VALUES ('21', 'App\\Models\\User', '13', 'auth_token', 'd9d33bc0d0608534b80c73c1db09d30065300f72b5b40a0a8c8dd46c9a0b2947', '[\"*\"]', null, null, '2024-12-07 02:40:40', '2024-12-07 02:40:40');
INSERT INTO `personal_access_tokens` VALUES ('22', 'App\\Models\\User', '13', 'auth_token', 'a66168a1063d0d7b362c61167c5acaa66080bb83eaa223969b85a55ef7c3cedb', '[\"*\"]', '2024-12-07 03:07:13', null, '2024-12-07 03:05:32', '2024-12-07 03:07:13');
INSERT INTO `personal_access_tokens` VALUES ('23', 'App\\Models\\User', '13', 'auth_token', '46009a380b7e645b16a5d6366af09308f599c1ccaa34abb66931f99b0628a707', '[\"*\"]', null, null, '2024-12-07 03:30:49', '2024-12-07 03:30:49');
INSERT INTO `personal_access_tokens` VALUES ('24', 'App\\Models\\User', '13', 'auth_token', '3c50d150de1ce8024f6675759d4119f02306f726b87924ed4cf803cb279b41f7', '[\"*\"]', null, null, '2024-12-07 03:34:23', '2024-12-07 03:34:23');
INSERT INTO `personal_access_tokens` VALUES ('25', 'App\\Models\\User', '13', 'auth_token', '36108e7eca1fcf236c39db5d5d156de69ea2b50bdd56654a77330c05c7193301', '[\"*\"]', null, null, '2024-12-07 03:43:34', '2024-12-07 03:43:34');
INSERT INTO `personal_access_tokens` VALUES ('26', 'App\\Models\\User', '12', 'auth_token', '6bedd148f08a7d2df5d19f0f5c872347cfdf7ea00737a668ca1d1d2a50cfdcc7', '[\"*\"]', null, null, '2024-12-07 03:43:53', '2024-12-07 03:43:53');
INSERT INTO `personal_access_tokens` VALUES ('27', 'App\\Models\\User', '12', 'auth_token', 'cff46c4128cfc3b35359765e331396a55c9b5131ba12ad36ae19c365f68a04db', '[\"*\"]', null, null, '2024-12-07 03:44:58', '2024-12-07 03:44:58');

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
INSERT INTO `sessions` VALUES ('NBGwiebYgMRvfIAchH0w5hGIpHuegC1AyLd81cjF', '22', '192.168.0.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieFVqRkxoRXo5UlVlWmtkbjBzdnZBblE2OVVaQmowRXlsMjNMRkQ3VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xOTIuMTY4LjAuNDo4MDAwL3VzZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyMjt9', '1735721875');
INSERT INTO `sessions` VALUES ('qG9e0HojGrFBGk0D1srH2ITKnLAzeNhSal3hBJvh', '22', '192.168.0.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR0JMMjU0Qm84S2liVW5lRkE2ZnRBdjExN2I2UmpURDBCMUFObEVscSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cDovLzE5Mi4xNjguMC40OjgwMDAvYXR0ZW5kYW5jZXMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyODoiaHR0cDovLzE5Mi4xNjguMC40OjgwMDAvdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIyO30=', '1735575492');
INSERT INTO `sessions` VALUES ('zsOJui8AZ50ZQb0G0QPpn8BpHJsqOviONJ0YRYxG', '22', '172.20.10.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYjdqYlhkdnA5Sllmc2dXdkJabkZEUVpBaE9VenFpYWdEcDVPRklpdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xNzIuMjAuMTAuNTo4MDAwL3VzZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyMjt9', '1735573496');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `users` VALUES ('11', '2', 'Nico', 'nico@gmail.com', '2024-11-23 05:40:52', '$2y$12$5FOCmFZ5ADtSQk.p0V1wL.YLitaA797sABP4YBJJtSR6jlcAvfVdW', null, null, null, 'QBuxZJA0sm', null, '2024-11-23 05:40:52', '2024-12-29 23:43:55', null, 'Jl soehat', null, null, '08123456789', 'user', 'male');
INSERT INTO `users` VALUES ('12', '2', 'daniel', 'daniel@gmail.com', null, '$2y$12$oH.0KIaxWWDk5tqYypEVqOzmIzuXZhCPGp6NXRLNCDvsR/u.8jqtu', null, null, null, null, null, '2024-11-23 12:41:28', '2024-11-24 05:08:21', null, 'Jl Pisang Candi', null, null, '081233386855', 'user', 'male');
INSERT INTO `users` VALUES ('13', '2', 'marcel', 'marcel@gmail.com', null, '$2y$12$cswp2u6tDm1zOWmPgqJxNuSiLvfBVO88E8wZ/aFu7N6eX/DyZrG7G', null, null, null, null, null, '2024-11-23 13:31:04', '2024-11-27 03:32:33', null, 'Jl. Ir rais 14 no.56', null, null, '081233386855', 'user', 'female');
INSERT INTO `users` VALUES ('14', '5', 'mama', 'mama@gmail.com', null, '$2y$12$lGvieXuW.faEnAd6hQ.9beiLWcHYhMZ36qdpW68/5aU7B5MnonAxm', null, null, null, null, null, '2024-11-23 13:38:11', '2024-12-07 01:40:49', null, 'JL Bromo', null, null, '0812345627182', 'employee', 'female');
INSERT INTO `users` VALUES ('15', '1', 'papa', 'papa@gmail.com', null, '$2y$12$8k0EEUwF87bwEs1w3gsQjuMsUyG5OAN8cX9LHgT7fO.a4iEyKxxIK', null, null, null, null, null, '2024-11-23 13:49:09', '2024-12-07 01:38:28', null, 'JL Welirang', null, null, '081233386855', 'user', 'male');
INSERT INTO `users` VALUES ('21', '5', 'Dias', 'dias@gmail.com', null, '$2y$12$D5RNhvIBlbbK0hdr/pqdKu5382yoC4pYzbpKe0UrZyQB1OFDeYsW.', null, null, null, null, null, '2024-11-29 12:57:29', '2024-11-29 12:57:29', null, 'Jl. Ir rais 14 no.56', null, null, '081233386855', 'employee', 'female');
INSERT INTO `users` VALUES ('22', '5', 'admin', 'admin@gmail.com', null, '$2y$12$w6npOs4UR78a1rvxKIoRpuK0V4BIQEx3peIce3ezSWci0GVkF0HKa', null, null, null, null, null, '2024-12-07 01:40:07', '2024-12-07 01:40:07', null, 'Jl. Bromo 33', null, null, '0823128362839', 'admin', 'male');
INSERT INTO `users` VALUES ('23', '5', 'gawai', 'gawai@gmail.com', null, '$2y$12$AlgfyZlqbQIxpBoAfkGkd.tSEKA94FdO.rOIuWEZKaKylJqUY.mzu', null, null, null, null, null, '2024-12-28 13:15:44', '2024-12-28 13:15:44', null, 'Jl pegawai', null, null, '081234567890', 'employee', 'male');
INSERT INTO `users` VALUES ('24', '2', 'Nia Lailati', 'Nia@gmail.com', null, '$2y$12$LkULPONv9RuvbgxE0SDUm.o5tU1R2Ik2t5fMmr3E9bjg1YuH22AJu', null, null, null, null, null, '2024-12-29 14:22:53', '2024-12-29 14:22:53', null, 'Jl nia', null, null, '0812345678990', 'user', 'female');
INSERT INTO `users` VALUES ('25', '2', 'Nico Ardia Effendy', 'nana@gmail.com', null, '$2y$12$14n4UMjlBN3B9t0CDaQXzupy3fryykC8hH5GK6JSWTxjxHVfsz1Ze', null, null, null, null, null, '2024-12-30 08:39:21', '2025-01-01 15:20:47', null, 'jl suhat1', null, 'https://drive.google.com/uc?export=download&id=1g4i63y_jprRtnJtgDMlZbRxCLr35zYh1', '812', 'user', 'male');
INSERT INTO `users` VALUES ('26', '2', 'Bima Bhakti', 'bima@gmail.com', null, '$2y$12$8hh9Lj/6XMhOg1puHgKjo.67kvAeC03E0YTbAqPaeSricS6s9VoSG', null, null, null, null, null, '2024-12-30 08:39:21', '2025-01-01 15:20:47', null, 'jl suhat2', null, 'https://drive.google.com/uc?export=download&id=19hQW-1HwxWCZkMHsrMxY285uivZhx-fQ', '813', 'user', 'female');
INSERT INTO `users` VALUES ('27', '2', 'Ramadhani', 'rama@gmail.com', null, '$2y$12$k4HZhFKEqpLzDl3KYkLnAOxV8SAbz5BkDn4VAW06QAPCR.Ai8vDpi', null, null, null, null, null, '2024-12-30 08:39:21', '2025-01-01 15:20:47', null, 'jl suhat3', null, 'https://drive.google.com/uc?export=download&id=1xgH2NvHVySXAIqe2I5cg7NIrhkrG2WwV', '814', 'user', 'male');
INSERT INTO `users` VALUES ('28', '2', 'Amelia Intan', 'amelia@gmail.com', null, '$2y$12$lo1BKNV9K3L33sx32AcDpe3dkNcg40pNOnOJ.RNg9AkidZASq0wXK', null, null, null, null, null, '2024-12-30 08:39:21', '2025-01-01 15:20:47', null, 'jl suhat4', null, 'https://drive.google.com/uc?export=download&id=1vc4BQ-Fl-23Wz-45ynHY20tl9UJ_yPgz', '815', 'user', 'male');
INSERT INTO `users` VALUES ('29', '2', 'Namira Salsabilla', 'nam@gmail.com', null, '$2y$12$mv4LskchqTTOux79F3VkHODfhO9aqlyXzrKNqFVUTZYM0QYaAky9a', null, null, null, null, null, '2024-12-30 08:39:21', '2025-01-01 15:20:48', null, 'jl suhat5', null, 'https://drive.google.com/uc?export=download&id=13dKkoGXuuCkar85dCuVoVvfnFVYCR0rs', '816', 'user', 'female');
INSERT INTO `users` VALUES ('32', '2', 'Nia Lailati', 'niala@gmail.com', null, '$2y$12$IdAqVe7FOAyQcr1Onqa5nefCKnORol.YQ8RbfvM59G.c2eFSXK5Nq', null, null, null, null, null, '2024-12-30 08:44:49', '2025-01-01 15:20:48', null, 'jl suhat6', null, 'https://drive.google.com/uc?export=download&id=1UHm-xq0T4ksXHYTKmdhLO1M0XZEmgQIF', '817', 'user', 'male');
INSERT INTO `users` VALUES ('35', '2', 'Abu Bakar', 'bakar@gmail.com', null, '$2y$12$X8sQtcA5RpGi7JMb9fJirujHU8aJmjItiDxxAGD0LLPa7mDXNPIdW', null, null, null, null, null, '2025-01-01 15:20:48', '2025-01-01 15:20:48', null, 'jl suhat7', null, 'https://drive.google.com/uc?export=download&id=1UHm-xq0T4ksXHYTKmdhLO1M0XZEmgQIF', '818', 'user', 'male');
