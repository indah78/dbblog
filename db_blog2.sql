-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.22-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_blog2
CREATE DATABASE IF NOT EXISTS `db_blog2` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `db_blog2`;

-- Dumping structure for table db_blog2.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `excerpt` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `status` enum('draft','published','archived') DEFAULT 'draft',
  `views` int(11) DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.articles: 3 rows
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`article_id`, `title`, `slug`, `content`, `excerpt`, `featured_image`, `status`, `views`, `published_at`, `created_at`, `updated_at`, `user_id`) VALUES
	(19, 'Globalisasi', 'globalisasi', 'Globalisasi adalah suatu proses di mana dunia menjadi semakin terhubung dan saling bergantung melalui pertukaran informasi, teknologi, budaya, ekonomi, dan politik. Perkembangan teknologi komunikasi dan transportasi menjadi pendorong utama yang mempercepat arus globalisasi, memungkinkan orang, barang, dan ide melintasi batas negara dengan lebih mudah. Di satu sisi, globalisasi membuka peluang besar bagi pertumbuhan ekonomi, pertukaran budaya, serta kemajuan ilmu pengetahuan. Namun di sisi lain, globalisasi juga menimbulkan tantangan seperti kesenjangan ekonomi, homogenisasi budaya, dan isu-isu lingkungan. Oleh karena itu, penting bagi setiap negara dan individu untuk mampu memanfaatkan dampak positif globalisasi sekaligus mengelola risikonya secara bijak.', '', 'uploads/684d04ff72109.jpg', 'published', 0, '2025-06-14 12:13:35', '2025-06-14 05:13:35', '2025-06-14 05:13:35', NULL),
	(20, 'Kuliner Indonesia', 'kuliner-indonesia', 'Kuliner merupakan segala hal yang berkaitan dengan seni memasak dan menikmati makanan. Setiap daerah di dunia memiliki kekayaan kuliner yang khas, mencerminkan budaya, sejarah, serta sumber daya alam setempat. Selain sebagai kebutuhan dasar manusia, kuliner juga berkembang menjadi bagian penting dari pariwisata, industri kreatif, hingga identitas budaya. Melalui kuliner, seseorang dapat mengenal dan merasakan keunikan tradisi dari berbagai belahan dunia. Di era modern, inovasi dalam dunia kuliner terus berkembang dengan hadirnya tren makanan baru, penggabungan berbagai cita rasa (fusion), serta penggunaan teknologi dalam penyajian.', '', 'uploads/684d056597cf7.jpg', 'published', 0, '2025-06-14 12:15:17', '2025-06-14 05:15:17', '2025-06-14 05:15:30', NULL),
	(24, 'tes updated by admin', 'tes', 'tes', '', 'uploads/684d0a0f09849.png', 'published', 0, '2025-06-14 12:35:11', '2025-06-14 05:35:11', '2025-06-14 05:51:10', NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Dumping structure for table db_blog2.article_author
CREATE TABLE IF NOT EXISTS `article_author` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `is_main_author` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`article_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.article_author: 3 rows
/*!40000 ALTER TABLE `article_author` DISABLE KEYS */;
INSERT INTO `article_author` (`article_id`, `author_id`, `is_main_author`) VALUES
	(20, 9, 1),
	(19, 13, 1),
	(24, 9, 1);
/*!40000 ALTER TABLE `article_author` ENABLE KEYS */;

-- Dumping structure for table db_blog2.article_category
CREATE TABLE IF NOT EXISTS `article_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.article_category: 8 rows
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` (`article_id`, `category_id`) VALUES
	(6, 2),
	(9, 4),
	(10, 4),
	(11, 2),
	(12, 2),
	(19, 2),
	(20, 6),
	(24, 4);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;

-- Dumping structure for view db_blog2.article_ownership
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `article_ownership` (
	`article_id` INT(11) NOT NULL,
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`slug` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`status` ENUM('draft','published','archived') NULL COLLATE 'utf8mb4_unicode_ci',
	`created_at` TIMESTAMP NULL,
	`updated_at` TIMESTAMP NULL,
	`user_id` INT(11) NOT NULL,
	`username` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`author_id` INT(11) NOT NULL,
	`author_name` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for table db_blog2.article_tag
CREATE TABLE IF NOT EXISTS `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.article_tag: 9 rows
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
	(6, 5),
	(8, 5),
	(9, 5),
	(10, 5),
	(11, 5),
	(12, 1),
	(19, 5),
	(20, 5),
	(24, 1);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- Dumping structure for table db_blog2.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bio` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.authors: 4 rows
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`author_id`, `name`, `email`, `bio`, `profile_image`, `created_at`, `updated_at`) VALUES
	(13, 'indah', 'admin@gmail.com', 'Bio for indah', NULL, '2025-06-14 05:07:13', '2025-06-14 05:07:13'),
	(11, 'amelia', 'amelia@gmail.com', 'Bio for amelia', NULL, '2025-06-14 03:07:41', '2025-06-14 03:07:41'),
	(9, 'user1', 'pengguna1@gmail.com', 'Bio for user1', NULL, '2025-06-14 02:50:19', '2025-06-14 02:50:19'),
	(10, 'uinmlg', 'uinmlg@gmail.com', 'Bio for uinmlg', NULL, '2025-06-14 02:57:12', '2025-06-14 02:57:12');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- Dumping structure for table db_blog2.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.categories: 8 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`, `name`, `description`, `slug`, `created_at`) VALUES
	(1, 'Teknologi', 'Artikel seputar teknologi terbaru', 'teknologi', '2025-04-20 12:13:03'),
	(2, 'Lifestyle', 'Tips dan trik gaya hidup modern', 'lifestyle', '2025-04-20 12:13:03'),
	(3, 'Politik', 'Berita dan analisis politik', 'politik', '2025-04-20 12:13:03'),
	(4, 'Kesehatan', 'Informasi seputar kesehatan dan kebugaran', 'kesehatan', '2025-04-20 12:13:03'),
	(5, 'Pariwisata', 'Destinasi liburan, tips traveling, dan ulasan tempat wisata.', 'pariwisata', '2025-06-14 03:58:43'),
	(6, 'Kuliner', 'Resep masakan, ulasan tempat makan, dan info kuliner.', 'kuliner', '2025-06-14 03:58:43'),
	(7, 'Olahraga', 'Berita terbaru dari berbagai cabang olahraga.', 'olahraga', '2025-06-14 03:58:43'),
	(8, 'Hiburan', 'Ulasan film, musik, serial TV, dan berita dari dunia hiburan.', 'hiburan', '2025-06-14 03:58:43');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table db_blog2.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.tags: 5 rows
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`tag_id`, `name`, `slug`, `created_at`) VALUES
	(1, 'Programming', 'programming', '2025-04-20 12:13:03'),
	(2, 'Web Development', 'web-development', '2025-04-20 12:13:03'),
	(3, 'Kesehatan Mental', 'kesehatan-mental', '2025-04-20 12:13:03'),
	(4, 'Politik Nasional', 'politik-nasional', '2025-04-20 12:13:03'),
	(5, 'Tips Hidup', 'tips-hidup', '2025-04-20 12:13:03');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table db_blog2.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_blog2.users: 4 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
	(14, 'indah', 'admin@gmail.com', '$2y$12$AhtQdiIO7gxNQ5ov5TvH/OxTlw66YuWfX7D1BwQQSw7KRP7hHEyvK', 'admin', '2025-06-14 05:06:02', '2025-06-14 05:06:44'),
	(12, 'amelia', 'amelia@gmail.com', '$2y$12$40Qkw2ubtbXw2Jzpz34.MO.29p5rYbm/kl62PmYPagXZKHgr4EB6.', 'user', '2025-06-14 03:07:27', '2025-06-14 03:07:27'),
	(10, 'user1', 'pengguna1@gmail.com', '$2y$12$iqtUX9MofeiCEDSzGfyvuuO.qlOA1Y6K32fnQ25t2lojhizyEgZ.G', 'user', '2025-06-14 02:49:45', '2025-06-14 02:49:45'),
	(11, 'uinmlg', 'uinmlg@gmail.com', '$2y$12$IRhUH1Gu8gJbgbh4DB96VeRXBdK0xtT3z7pgIoIUpIHwGh5opYai.', 'user', '2025-06-14 02:56:58', '2025-06-14 02:56:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view db_blog2.article_ownership
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `article_ownership`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `article_ownership` AS SELECT 
    a.article_id,
    a.title,
    a.slug,
    a.status,
    a.created_at,
    a.updated_at,
    u.user_id,
    u.username,
    au.author_id,
    au.name as author_name
FROM `articles` a
JOIN `article_author` aa ON a.article_id = aa.article_id
JOIN `authors` au ON aa.author_id = au.author_id
JOIN `users` u ON au.email = u.email
WHERE aa.is_main_author = 1 ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
