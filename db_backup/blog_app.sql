-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 29, 2024 at 04:27 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ms. Janelle Collins', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(2, 'Kiara Rolfson', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(3, 'Mrs. Laurence Tremblay V', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(4, 'Joesph Kshlerin', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(5, 'Luella Moen', '2024-11-29 10:34:56', '2024-11-29 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `post_id`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Quidem sequi quia necessitatibus accusamus laudantium deleniti.', 1, 'dolorum', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(2, 'Hic nam nesciunt nisi itaque temporibus atque voluptatem.', 1, 'consequatur', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(3, 'Ratione deserunt quia ab voluptatem magnam quis rerum.', 2, 'saepe', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(4, 'Quas accusamus nihil modi qui sit.', 2, 'placeat', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(5, 'Ex fugit est tempora sint.', 2, 'architecto', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(6, 'Eum cumque voluptatum aut repellat.', 2, 'iusto', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(7, 'Iste dolorem aut molestias velit quia ea.', 3, 'rerum', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(8, 'Fugiat possimus eveniet ipsum voluptate non quidem dolores.', 3, 'natus', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(9, 'Facere et quia debitis a vero.', 3, 'pariatur', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(10, 'Iusto praesentium nihil quibusdam minima qui dolores neque et.', 4, 'et', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(11, 'Ab veritatis ad at est eos.', 4, 'voluptas', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(12, 'Ut suscipit velit doloribus.', 4, 'ipsam', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(13, 'Molestiae quia praesentium libero quasi placeat temporibus sit est.', 4, 'reprehenderit', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(14, 'Laboriosam aperiam voluptas quae omnis voluptas quia ea.', 4, 'omnis', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(15, 'Maxime laudantium voluptatem porro consequatur voluptatem.', 5, 'dolorem', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(16, 'Et reprehenderit itaque similique sed.', 5, 'in', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(17, 'Qui velit autem in perferendis.', 6, 'et', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(18, 'Debitis nam est optio.', 6, 'ab', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(19, 'Sed quasi consequuntur modi cumque voluptatem.', 7, 'fugiat', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(20, 'Consequatur labore perspiciatis sequi.', 7, 'iste', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(21, 'Quo repudiandae eveniet ut maiores assumenda architecto.', 8, 'quo', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(22, 'Eaque nulla nulla et doloremque consequatur est.', 8, 'occaecati', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(23, 'Sint officiis aliquam debitis enim.', 8, 'quia', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(24, 'Culpa repellat tempora maiores.', 8, 'itaque', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(25, 'Praesentium et optio a officia voluptas sed ea.', 8, 'quasi', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(26, 'Commodi quo perferendis pariatur magni in.', 9, 'quae', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(27, 'Aperiam et eum consequatur explicabo et doloribus ad aut.', 9, 'laudantium', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(28, 'Temporibus eveniet nostrum nihil consequatur.', 9, 'enim', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(29, 'Ut repellendus est omnis.', 9, 'facilis', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(30, 'Corporis quibusdam eum nesciunt asperiores.', 10, 'ipsa', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(31, 'Eos saepe est nulla dolorem at.', 10, 'possimus', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(32, 'Consequuntur et eveniet nam.', 11, 'harum', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(33, 'Sed molestiae voluptatem et corporis.', 11, 'dolorem', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(34, 'Sunt omnis qui doloribus est.', 11, 'aut', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(35, 'Tempora est tempore quia voluptas odit non amet.', 12, 'neque', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(36, 'Eligendi et fuga velit omnis aut ut dolores nulla.', 12, 'tempora', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(37, 'Eos voluptatum in nostrum impedit.', 13, 'quaerat', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(38, 'Facilis ex consequatur ut natus.', 13, 'recusandae', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(39, 'Iure voluptas aut cupiditate magnam rerum.', 13, 'dolorem', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(40, 'Ab mollitia quia fugiat provident asperiores.', 13, 'dolorem', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(41, 'Impedit eius nesciunt corrupti dignissimos.', 14, 'asperiores', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(42, 'Est quo ad nesciunt numquam.', 14, 'omnis', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(43, 'Incidunt magnam alias magni accusamus animi.', 14, 'ut', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(44, 'Explicabo est sunt eaque consectetur molestias.', 14, 'harum', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(45, 'Amet aut animi et et.', 14, 'omnis', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(46, 'Eos voluptatem rerum quae incidunt ut in.', 15, 'consequatur', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(47, 'Placeat eaque sunt laborum minus magni excepturi aspernatur.', 15, 'et', '2024-11-29 10:34:57', '2024-11-29 10:34:57'),
(48, 'Porro doloribus et eos quasi.', 15, 'quo', '2024-11-29 10:34:57', '2024-11-29 10:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(87, '2014_10_12_000000_create_users_table', 1),
(88, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(89, '2019_08_19_000000_create_failed_jobs_table', 1),
(90, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(91, '2024_11_28_171949_create_categories_table', 1),
(92, '2024_11_28_171955_create_posts_table', 1),
(93, '2024_11_28_172000_create_comments_table', 1),
(94, '2024_11_28_172004_create_tags_table', 1),
(95, '2024_11_28_172008_create_post_tag_table', 1),
(96, '2024_11_29_041449_add_deleted_at_to_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `author_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `category_id`, `image`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Quisquam in quia ipsa quaerat est sit.', 'Magni sit hic reprehenderit odio deleniti iste tenetur. Iste nemo quia dolores dicta alias non rerum. Vero sint voluptatem odit minus tempora.', 1, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(2, 'Vel expedita non quasi officia facilis cupiditate vel ex.', 'Quod adipisci necessitatibus qui. Non non quo libero doloribus laboriosam atque. Consequatur autem velit aut sint velit aperiam quidem. Delectus velit totam expedita excepturi.', 1, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(3, 'Nemo officia veniam qui nesciunt doloribus.', 'Aut accusantium expedita itaque. A omnis in accusamus voluptatem ea sapiente. Non voluptates unde dolor rerum corrupti ut. Quas iusto nam quae saepe delectus.', 1, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(4, 'In nam atque culpa ea laboriosam eius.', 'Repudiandae blanditiis beatae culpa neque pariatur voluptas dolore. Error quo iusto autem eligendi error dolor.', 2, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(5, 'Et reprehenderit est debitis dicta.', 'Consectetur earum consequuntur nam iure provident quis exercitationem sint. Aliquid vitae deserunt sit eius vero at et. Est quis ut hic voluptatem tempore id.', 2, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(6, 'Dolorem repellendus quibusdam rerum repellendus fugit.', 'Eveniet consequatur quia praesentium odio tempore. Harum dolor voluptas est et sed nisi. Facere recusandae illum dolorem eligendi deserunt laudantium sit. Ut nisi consequatur eligendi pariatur ducimus quis.', 2, NULL, NULL, '2024-11-29 10:34:56', '2024-11-29 10:34:56', NULL),
(7, 'Sed dolores voluptatem qui velit facere sit ut.', 'Voluptatibus assumenda quia corporis ratione. Saepe repellendus autem qui et id totam sunt. Voluptatum in repellendus illo aut optio qui voluptatem doloribus. Inventore exercitationem sequi adipisci.', 3, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(8, 'Quidem exercitationem suscipit sapiente et aut.', 'Ut ullam optio quis est aut modi. Magnam libero repellendus quo eum sunt. Sit adipisci minus explicabo id id aut excepturi. Laborum omnis enim enim quis.', 3, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(9, 'Unde in dolores rem iste.', 'Dolorem autem reprehenderit qui amet voluptatem. Qui dolor eum quaerat fuga illum commodi possimus. Totam maxime necessitatibus maiores blanditiis assumenda alias. Sapiente ipsa quo reprehenderit architecto et temporibus facere.', 3, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(10, 'Odio reprehenderit ullam quidem numquam necessitatibus et fugiat.', 'Molestias sapiente natus assumenda et et. Soluta voluptatem corporis recusandae sit.', 4, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(11, 'Dolorum ipsum voluptas ipsam hic.', 'Tempora dolore omnis autem natus voluptas ad quia. Atque inventore quia exercitationem adipisci et voluptates sit. Sunt perspiciatis blanditiis qui amet. Repellat architecto eum quia repudiandae magnam.', 4, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(12, 'Suscipit illum maxime aspernatur qui autem cum est.', 'Esse est aspernatur vero neque voluptas odio. Debitis cumque consequuntur laudantium officiis libero natus. Saepe fuga saepe pariatur magnam. Quis nulla occaecati ut.', 4, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(13, 'Repellat aut placeat et dolorum enim omnis.', 'Iusto voluptas error rerum rerum praesentium eum. Reprehenderit voluptatem et exercitationem molestias qui vel. Aperiam ut architecto nemo est et. Enim non cupiditate aliquam nulla ut tempore dolor.', 5, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(14, 'Deserunt hic quos architecto exercitationem placeat dolorem.', 'Voluptatem vel facere quas quos ducimus. Eveniet possimus modi deserunt. Necessitatibus officia dolor facilis aliquid ipsa quis molestiae a. Sint nostrum rem minus natus ea.', 5, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL),
(15, 'Numquam ab odio aliquid error et non.', 'Voluptas iste exercitationem id molestiae voluptas. Aut maxime dolor aut repellendus fugit. Beatae optio quisquam quisquam earum placeat incidunt autem.', 5, NULL, NULL, '2024-11-29 10:34:57', '2024-11-29 10:34:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 8),
(4, 1, 9),
(5, 1, 10),
(6, 2, 1),
(7, 2, 2),
(8, 2, 6),
(9, 2, 7),
(10, 2, 8),
(11, 3, 5),
(12, 3, 6),
(13, 3, 7),
(14, 4, 1),
(15, 4, 3),
(16, 4, 7),
(17, 4, 9),
(18, 4, 10),
(19, 5, 1),
(20, 5, 9),
(21, 5, 10),
(22, 6, 3),
(23, 6, 7),
(24, 7, 3),
(25, 7, 5),
(26, 7, 6),
(27, 8, 2),
(28, 8, 3),
(29, 8, 4),
(30, 8, 7),
(31, 8, 9),
(32, 9, 2),
(33, 9, 3),
(34, 9, 6),
(35, 10, 3),
(36, 10, 4),
(37, 10, 5),
(38, 10, 9),
(39, 10, 10),
(40, 11, 3),
(41, 11, 5),
(42, 11, 6),
(43, 11, 9),
(44, 12, 1),
(45, 12, 5),
(46, 12, 6),
(47, 12, 7),
(48, 12, 10),
(49, 13, 1),
(50, 13, 2),
(51, 13, 5),
(52, 13, 7),
(53, 13, 10),
(54, 14, 6),
(55, 14, 7),
(56, 14, 8),
(57, 14, 10),
(58, 15, 2),
(59, 15, 4),
(60, 15, 6),
(61, 15, 7),
(62, 15, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ea', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(2, 'dicta', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(3, 'ullam', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(4, 'consectetur', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(5, 'consequatur', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(6, 'non', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(7, 'quis', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(8, 'voluptatem', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(9, 'aspernatur', '2024-11-29 10:34:56', '2024-11-29 10:34:56'),
(10, 'velit', '2024-11-29 10:34:56', '2024-11-29 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@ymail.com', NULL, '$2y$12$CQfCGpYs4WbsJSiGedcxGeZPeoA6tCsL//VugXg/wSSc1PYQne//.', NULL, '2024-11-29 10:36:00', '2024-11-29 10:36:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
