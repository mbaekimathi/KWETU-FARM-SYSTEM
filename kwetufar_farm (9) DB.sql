-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2025 at 12:46 AM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kwetufar_farm`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `employee_id`, `action`, `description`, `table_name`, `record_id`, `created_at`) VALUES
(398, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-13 11:21:48'),
(399, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-13 12:16:07'),
(400, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-13 12:19:03'),
(401, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-13 12:21:14'),
(402, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-13 16:29:24'),
(403, 10, 'MILK_TRANSACTION', 'Sale recorded: L', NULL, NULL, '2025-10-13 16:32:37'),
(404, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:29:41'),
(405, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:36:57'),
(406, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:37:25'),
(407, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C001', NULL, NULL, '2025-10-14 08:39:46'),
(408, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C002', NULL, NULL, '2025-10-14 08:41:53'),
(409, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C003', NULL, NULL, '2025-10-14 08:44:12'),
(410, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C004', NULL, NULL, '2025-10-14 08:46:25'),
(411, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C005', NULL, NULL, '2025-10-14 08:48:33'),
(412, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-14 08:51:42'),
(413, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:54:34'),
(414, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:54:40'),
(415, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-14 08:56:38'),
(416, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C001', NULL, NULL, '2025-10-14 08:58:31'),
(417, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C002', NULL, NULL, '2025-10-14 08:59:47'),
(418, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C003', NULL, NULL, '2025-10-14 09:03:01'),
(419, 10, 'COW_REGISTRATION', 'New cow registered with ear tag C004', NULL, NULL, '2025-10-14 09:04:32'),
(420, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-14 09:17:53'),
(421, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P091 with Boar EP060', NULL, NULL, '2025-10-14 09:19:27'),
(422, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-14 11:42:26'),
(423, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-14 12:07:59'),
(424, 9, 'PIG_REGISTRATION', 'New batch registered with tag B001 at farm 2', NULL, NULL, '2025-10-14 12:08:41'),
(425, 11, 'SIGNUP', 'New employee Dennis Amutsa registered with code 999999 - Status: Waiting Approval', NULL, NULL, '2025-10-15 12:16:29'),
(426, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-15 12:16:51'),
(427, 9, 'STATUS_UPDATE', 'Employee 11 status changed to active', NULL, NULL, '2025-10-15 12:16:59'),
(428, 9, 'EMPLOYEE_UPDATE', 'Employee 11 details updated', NULL, NULL, '2025-10-15 12:17:08'),
(429, 9, 'LOGOUT', 'Employee dennis kimathi mbae logged out', NULL, NULL, '2025-10-15 12:17:13'),
(430, 11, 'LOGIN', 'Employee Dennis Amutsa logged in successfully', NULL, NULL, '2025-10-15 12:17:29'),
(431, 11, 'LOGIN', 'Employee Dennis Amutsa logged in successfully', NULL, NULL, '2025-10-15 12:17:29'),
(432, 11, 'LOGIN', 'Employee Dennis Amutsa logged in successfully', NULL, NULL, '2025-10-15 12:23:06'),
(433, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 08:45:41'),
(434, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-16 08:50:39'),
(435, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 08:53:30'),
(436, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 09:11:48'),
(437, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 09:19:10'),
(438, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 10:03:14'),
(439, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-16 10:07:11'),
(440, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-16 16:52:34'),
(441, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-17 04:37:12'),
(442, 9, 'MILK_TRANSACTION', 'Sale recorded: 4.5L', NULL, NULL, '2025-10-17 04:38:44'),
(443, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-17 04:39:14'),
(444, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-10-17 04:39:38'),
(445, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-10-17 04:40:03'),
(446, 9, 'MILK_TRANSACTION', 'Sale recorded: 0L', NULL, NULL, '2025-10-17 04:40:25'),
(447, 9, 'MILK_TRANSACTION', 'Sale recorded: 20L', NULL, NULL, '2025-10-17 04:40:46'),
(448, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-10-17 04:41:11'),
(449, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-17 04:41:38'),
(450, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-17 04:42:31'),
(451, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-10-17 04:43:25'),
(452, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-10-17 04:43:46'),
(453, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7.5L for cow 18', NULL, NULL, '2025-10-17 04:44:12'),
(454, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 18', NULL, NULL, '2025-10-17 04:44:34'),
(455, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-17 04:44:54'),
(456, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-17 04:45:29'),
(457, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-10-17 04:46:13'),
(458, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-10-17 04:46:35'),
(459, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7L for cow 18', NULL, NULL, '2025-10-17 04:46:59'),
(460, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 18', NULL, NULL, '2025-10-17 04:47:21'),
(461, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-17 04:47:46'),
(462, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-17 04:48:07'),
(463, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-10-17 04:48:36'),
(464, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.2L for cow 16', NULL, NULL, '2025-10-17 04:48:55'),
(465, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7L for cow 18', NULL, NULL, '2025-10-17 04:49:17'),
(466, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-10-17 04:49:37'),
(467, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5.5L for cow 15', NULL, NULL, '2025-10-17 04:49:58'),
(468, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-17 04:50:20'),
(469, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-10-17 04:50:43'),
(470, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-10-17 04:51:00'),
(471, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7.5L for cow 18', NULL, NULL, '2025-10-17 04:51:18'),
(472, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-17 04:51:39'),
(473, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-17 04:51:59'),
(474, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-17 04:52:20'),
(475, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 08:59:01'),
(476, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 09:00:17'),
(477, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 09:05:47'),
(478, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 09:09:52'),
(479, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P984 at farm 2', NULL, NULL, '2025-10-17 09:15:52'),
(480, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P985 at farm 2', NULL, NULL, '2025-10-17 09:17:03'),
(481, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P986 at farm 2', NULL, NULL, '2025-10-17 09:17:55'),
(482, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 09:19:58'),
(483, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P987 at farm 2', NULL, NULL, '2025-10-17 09:21:07'),
(484, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P988 at farm 2', NULL, NULL, '2025-10-17 09:21:50'),
(485, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P989 at farm 2', NULL, NULL, '2025-10-17 09:23:00'),
(486, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P990 at farm 2', NULL, NULL, '2025-10-17 09:24:07'),
(487, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P991 at farm 2', NULL, NULL, '2025-10-17 09:24:49'),
(488, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P992 at farm 2', NULL, NULL, '2025-10-17 09:25:33'),
(489, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 12:44:19'),
(490, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P993 at farm 2', NULL, NULL, '2025-10-17 12:45:28'),
(491, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P994 at farm 2', NULL, NULL, '2025-10-17 12:46:12'),
(492, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P995 at farm 2', NULL, NULL, '2025-10-17 12:47:00'),
(493, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P996 at farm 2', NULL, NULL, '2025-10-17 12:47:44'),
(494, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P997 at farm 2', NULL, NULL, '2025-10-17 12:48:19'),
(495, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P998 at farm 2', NULL, NULL, '2025-10-17 12:49:00'),
(496, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P999 at farm 2', NULL, NULL, '2025-10-17 12:49:40'),
(497, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1000 at farm 2', NULL, NULL, '2025-10-17 12:50:20'),
(498, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1001 at farm 2', NULL, NULL, '2025-10-17 12:51:21'),
(499, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1002 at farm 2', NULL, NULL, '2025-10-17 12:52:01'),
(500, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1003 at farm 2', NULL, NULL, '2025-10-17 12:53:22'),
(501, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1004 at farm 2', NULL, NULL, '2025-10-17 12:53:59'),
(502, 10, 'PIG_REGISTRATION', 'New grown_pig registered with tag P1005 at farm 2', NULL, NULL, '2025-10-17 12:54:57'),
(503, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-17 13:01:57'),
(504, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 13:02:48'),
(505, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 13:08:52'),
(506, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-17 13:27:46'),
(507, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P993 with Boar Ep011', NULL, NULL, '2025-10-17 13:34:45'),
(508, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP9094 with Boar Ep011', NULL, NULL, '2025-10-17 13:37:34'),
(509, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P062 with Boar EP060', NULL, NULL, '2025-10-17 13:40:22'),
(510, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P020 with Boar Ep011', NULL, NULL, '2025-10-17 13:41:21'),
(511, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P026 with Boar EP060', NULL, NULL, '2025-10-17 13:43:15'),
(512, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P029 with Boar Ep011', NULL, NULL, '2025-10-17 13:44:07'),
(513, 9, 'PIG_UPDATE', 'Updated pig B001 with changes: Tag ID: B001 → B002, Farm: 2 → 1, Birth Date: 2025-08-17 → 2025-08-17, Age: 61 days → 61 days, Tag ID: B001 → EB002 (edited)', NULL, NULL, '2025-10-17 13:44:17'),
(514, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P036 with Boar Ep011', NULL, NULL, '2025-10-17 13:45:03'),
(515, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P999 with Boar EP060', NULL, NULL, '2025-10-17 13:47:23'),
(516, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P075 with Boar Ep011', NULL, NULL, '2025-10-17 13:48:33'),
(517, 9, 'BREEDING_REGISTRATION', 'Breeding record created: Sow P076 with Boar EP060', NULL, NULL, '2025-10-17 13:50:02'),
(518, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:46:51'),
(519, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:48:06'),
(520, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:48:20'),
(521, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:49:26'),
(522, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:53:59'),
(523, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:54:10'),
(524, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:54:15'),
(525, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 18:58:04'),
(526, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 19:04:38'),
(527, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 19:13:52'),
(528, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 19:14:38'),
(529, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-17 19:18:07'),
(530, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-19 04:47:21'),
(531, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-10-19 04:48:20'),
(532, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-10-19 04:48:41'),
(533, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7L for cow 18', NULL, NULL, '2025-10-19 04:49:09'),
(534, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-19 04:49:31'),
(535, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-19 04:50:02'),
(536, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-19 04:50:27'),
(537, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-10-19 04:51:07'),
(538, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.6L for cow 16', NULL, NULL, '2025-10-19 04:51:28'),
(539, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-19 04:51:55'),
(540, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-19 04:52:17'),
(541, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5.5L for cow 15', NULL, NULL, '2025-10-19 04:52:43'),
(542, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.4L for cow 15', NULL, NULL, '2025-10-19 04:53:05'),
(543, 9, 'MILK_TRANSACTION', 'Sale recorded: 4.5L', NULL, NULL, '2025-10-19 05:01:33'),
(544, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-19 05:01:59'),
(545, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-19 05:03:22'),
(546, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-19 05:03:45'),
(547, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-10-19 05:03:46'),
(548, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-19 05:03:51'),
(549, 9, 'MILK_TRANSACTION', 'Sale recorded: 16.5L', NULL, NULL, '2025-10-19 05:04:21'),
(550, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-19 05:05:33'),
(551, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-19 05:05:53'),
(552, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-19 05:06:07'),
(553, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-19 05:06:27'),
(554, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-19 05:06:43'),
(555, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-19 05:28:42'),
(556, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-21 05:33:49'),
(557, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-10-21 05:35:23'),
(558, 9, 'MILK_TRANSACTION', 'Sale recorded: 16L', NULL, NULL, '2025-10-21 05:35:47'),
(559, 9, 'MILK_TRANSACTION', 'Sale recorded: 4L', NULL, NULL, '2025-10-21 05:36:22'),
(560, 9, 'MILK_TRANSACTION', 'Sale recorded: 60L', NULL, NULL, '2025-10-21 05:36:49'),
(561, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-21 05:37:26'),
(562, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-21 05:38:08'),
(563, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-21 07:03:19'),
(564, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-21 07:04:57'),
(565, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-21 07:05:10'),
(566, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-10-21 07:05:24'),
(567, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-21 16:37:19'),
(568, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-10-21 16:38:21'),
(569, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-10-21 16:38:48'),
(570, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-21 16:39:21'),
(571, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-21 16:39:45'),
(572, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-21 16:40:15'),
(573, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-10-21 16:40:36'),
(574, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-10-21 16:41:07'),
(575, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-10-21 16:41:27'),
(576, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7.5L for cow 18', NULL, NULL, '2025-10-21 16:41:57'),
(577, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4.7L for cow 18', NULL, NULL, '2025-10-21 16:42:21'),
(578, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 15', NULL, NULL, '2025-10-21 16:42:45'),
(579, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-10-21 16:43:05'),
(580, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.7L for cow 16', NULL, NULL, '2025-10-21 16:43:41'),
(581, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-10-21 16:43:56'),
(582, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7.8L for cow 18', NULL, NULL, '2025-10-21 16:44:39'),
(583, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4.7L for cow 18', NULL, NULL, '2025-10-21 16:44:58'),
(584, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-21 16:45:16'),
(585, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.7L for cow 15', NULL, NULL, '2025-10-21 16:45:35'),
(586, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-22 06:43:45'),
(587, 9, 'PIG_DELETED', 'Pig deleted: P077 (ID: 8) - Type: grown_pig, Breed: Large white, Status: active', NULL, NULL, '2025-10-22 06:44:03'),
(588, 9, 'PIG_DELETED', 'Pig deleted: P014 (ID: 9) - Type: grown_pig, Breed: Large white , Status: active', NULL, NULL, '2025-10-22 06:44:17'),
(589, 9, 'PIG_DELETED', 'Pig deleted: P013 (ID: 10) - Type: grown_pig, Breed: Largewhite, Status: active', NULL, NULL, '2025-10-22 06:44:27'),
(590, 9, 'PIG_DELETED', 'Pig deleted: P078 (ID: 11) - Type: grown_pig, Breed: Largewhite , Status: active', NULL, NULL, '2025-10-22 06:44:39'),
(591, 9, 'PIG_DELETED', 'Pig deleted: P018 (ID: 12) - Type: grown_pig, Breed: Largewhite , Status: active', NULL, NULL, '2025-10-22 06:44:50'),
(592, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-24 06:06:58'),
(593, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-24 06:52:15'),
(594, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P001 at farm 2', NULL, NULL, '2025-10-24 06:52:43'),
(595, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-25 17:22:05'),
(596, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-29 08:17:42'),
(597, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P002 at farm 2', NULL, NULL, '2025-10-29 08:23:23'),
(598, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P003 at farm 2', NULL, NULL, '2025-10-29 08:29:52'),
(599, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P004 at farm 2', NULL, NULL, '2025-10-29 08:31:01'),
(600, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P005 at farm 2', NULL, NULL, '2025-10-29 08:37:26'),
(601, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P006 at farm 2', NULL, NULL, '2025-10-29 08:38:07'),
(602, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P007 at farm 2', NULL, NULL, '2025-10-29 08:38:53'),
(603, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P008 at farm 2', NULL, NULL, '2025-10-29 08:40:25'),
(604, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P009 at farm 2', NULL, NULL, '2025-10-29 08:41:10'),
(605, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P010 at farm 2', NULL, NULL, '2025-10-29 08:42:09'),
(606, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P011 at farm 2', NULL, NULL, '2025-10-29 08:42:42'),
(607, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P012 at farm 2', NULL, NULL, '2025-10-29 08:43:19'),
(608, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P013 at farm 2', NULL, NULL, '2025-10-29 08:43:53'),
(609, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P014 at farm 2', NULL, NULL, '2025-10-29 08:44:44'),
(610, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P015 at farm 2', NULL, NULL, '2025-10-29 08:45:19'),
(611, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P016 at farm 2', NULL, NULL, '2025-10-29 08:48:43'),
(612, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P017 at farm 2', NULL, NULL, '2025-10-29 08:50:55'),
(613, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P018 at farm 2', NULL, NULL, '2025-10-29 08:51:37'),
(614, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P019 at farm 2', NULL, NULL, '2025-10-29 08:52:25'),
(615, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P020 at farm 2', NULL, NULL, '2025-10-29 08:53:53'),
(616, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P021 at farm 2', NULL, NULL, '2025-10-29 08:55:49'),
(617, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P022 at farm 2', NULL, NULL, '2025-10-29 08:55:50'),
(618, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P023 at farm 2', NULL, NULL, '2025-10-29 08:55:51'),
(619, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P024 at farm 2', NULL, NULL, '2025-10-29 08:55:51'),
(620, 12, 'SIGNUP', 'New employee Hakan Genc registered with code 878678 - Status: Waiting Approval', NULL, NULL, '2025-10-30 18:08:21'),
(621, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-31 04:56:46'),
(622, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P025 at farm 2', NULL, NULL, '2025-10-31 04:58:42'),
(623, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P026 at farm 2', NULL, NULL, '2025-10-31 05:00:40'),
(624, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P027 at farm 2', NULL, NULL, '2025-10-31 05:02:06'),
(625, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P028 at farm 2', NULL, NULL, '2025-10-31 05:04:13'),
(626, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P029 at farm 2', NULL, NULL, '2025-10-31 05:06:30'),
(627, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P030 at farm 2', NULL, NULL, '2025-10-31 05:07:42'),
(628, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P031 at farm 2', NULL, NULL, '2025-10-31 05:08:11'),
(629, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P032 at farm 2', NULL, NULL, '2025-10-31 05:09:59'),
(630, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P033 at farm 2', NULL, NULL, '2025-10-31 05:10:38'),
(631, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P034 at farm 2', NULL, NULL, '2025-10-31 05:11:08'),
(632, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P035 at farm 2', NULL, NULL, '2025-10-31 05:12:35'),
(633, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P036 at farm 2', NULL, NULL, '2025-10-31 05:13:30'),
(634, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P037 at farm 2', NULL, NULL, '2025-10-31 05:15:20'),
(635, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P038 at farm 2', NULL, NULL, '2025-10-31 05:15:54'),
(636, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P039 at farm 2', NULL, NULL, '2025-10-31 05:17:51'),
(637, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P040 at farm 2', NULL, NULL, '2025-10-31 05:17:59'),
(638, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P041 at farm 2', NULL, NULL, '2025-10-31 05:18:00'),
(639, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P042 at farm 2', NULL, NULL, '2025-10-31 05:19:39'),
(640, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P043 at farm 2', NULL, NULL, '2025-10-31 05:20:40'),
(641, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P044 at farm 2', NULL, NULL, '2025-10-31 05:21:17'),
(642, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P045 at farm 2', NULL, NULL, '2025-10-31 05:22:13'),
(643, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P046 at farm 2', NULL, NULL, '2025-10-31 05:22:54'),
(644, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P047 at farm 2', NULL, NULL, '2025-10-31 05:23:25'),
(645, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P048 at farm 2', NULL, NULL, '2025-10-31 05:24:54'),
(646, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P049 at farm 2', NULL, NULL, '2025-10-31 05:25:29'),
(647, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P050 at farm 2', NULL, NULL, '2025-10-31 05:26:10'),
(648, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P051 at farm 2', NULL, NULL, '2025-10-31 05:27:08'),
(649, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P052 at farm 2', NULL, NULL, '2025-10-31 05:28:59'),
(650, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P053 at farm 2', NULL, NULL, '2025-10-31 05:31:58'),
(651, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P054 at farm 2', NULL, NULL, '2025-10-31 05:32:40'),
(652, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P055 at farm 2', NULL, NULL, '2025-10-31 05:34:01'),
(653, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P056 at farm 2', NULL, NULL, '2025-10-31 05:35:19'),
(654, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P057 at farm 2', NULL, NULL, '2025-10-31 05:36:01'),
(655, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P058 at farm 2', NULL, NULL, '2025-10-31 05:37:35'),
(656, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P059 at farm 2', NULL, NULL, '2025-10-31 05:38:39'),
(657, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P060 at farm 2', NULL, NULL, '2025-10-31 05:46:39'),
(658, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P061 at farm 2', NULL, NULL, '2025-10-31 05:51:26'),
(659, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P062 at farm 2', NULL, NULL, '2025-10-31 05:51:53'),
(660, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P063 at farm 2', NULL, NULL, '2025-10-31 05:54:09'),
(661, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-31 06:12:52'),
(662, 9, 'PIG_REGISTRATION', 'New grown_pig registered with tag P064 at farm 2', NULL, NULL, '2025-10-31 06:14:07'),
(663, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-10-31 15:41:10'),
(664, 9, 'MILK_TRANSACTION', 'Sale recorded: 16L', NULL, NULL, '2025-10-31 15:47:02'),
(665, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-10-31 15:47:36'),
(666, 9, 'MILK_TRANSACTION', 'Sale recorded: 15.5L', NULL, NULL, '2025-10-31 15:48:45'),
(667, 9, 'MILK_TRANSACTION', 'Sale recorded: 50L', NULL, NULL, '2025-10-31 15:49:14'),
(668, 9, 'MILK_TRANSACTION', 'Sale recorded: 15.5L', NULL, NULL, '2025-10-31 15:50:10'),
(669, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.5L', NULL, NULL, '2025-10-31 15:50:33'),
(670, 9, 'MILK_TRANSACTION', 'Sale recorded: 15.5L', NULL, NULL, '2025-10-31 15:51:02'),
(671, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.5L', NULL, NULL, '2025-10-31 15:51:27'),
(672, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-31 15:52:04'),
(673, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-10-31 15:52:27'),
(674, 9, 'MILK_TRANSACTION', 'Sale recorded: 15L', NULL, NULL, '2025-10-31 15:52:50'),
(675, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-10-31 15:54:42'),
(676, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-10-31 15:55:06'),
(677, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-31 15:56:01'),
(678, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-31 15:56:21'),
(679, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-31 15:56:43'),
(680, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-31 15:57:03'),
(681, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-10-31 15:57:28'),
(682, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-10-31 15:57:54'),
(683, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-31 15:58:10'),
(684, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-31 15:58:28'),
(685, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-31 15:58:50'),
(686, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-10-31 15:59:07'),
(687, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-10-31 15:59:30'),
(688, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-10-31 15:59:53'),
(689, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-31 16:00:13'),
(690, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-31 16:00:32'),
(691, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-31 16:00:59'),
(692, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-10-31 16:01:18'),
(693, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-10-31 16:01:43'),
(694, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-10-31 16:02:03'),
(695, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-31 16:02:19'),
(696, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-31 16:02:37'),
(697, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-31 16:02:58'),
(698, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-10-31 16:03:15'),
(699, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-10-31 16:03:53'),
(700, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.9L for cow 16', NULL, NULL, '2025-10-31 16:04:10'),
(701, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-10-31 16:04:27'),
(702, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-10-31 16:04:45'),
(703, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-10-31 16:05:04'),
(704, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-10-31 16:05:21'),
(705, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:07:34'),
(706, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:07:50'),
(707, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:08:12'),
(708, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:08:44'),
(709, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:08:58'),
(710, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:09:11'),
(711, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:09:25'),
(712, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-10-31 16:09:42'),
(713, 13, 'SIGNUP', 'New employee Cc Hshs registered with code 696969 - Status: Waiting Approval', NULL, NULL, '2025-11-04 16:10:59'),
(714, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-04 18:50:14'),
(715, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-05 05:30:54'),
(716, 10, 'PIG_UPDATE', 'Updated pig P064 with changes: Tag ID: P064 → P067, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P064 → EP067 (edited)', NULL, NULL, '2025-11-05 05:33:45'),
(717, 10, 'PIG_UPDATE', 'Updated pig P063 with changes: Tag ID: P063 → P066, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P063 → EP066 (edited)', NULL, NULL, '2025-11-05 05:35:10'),
(718, 10, 'PIG_UPDATE', 'Updated pig P062 with changes: Tag ID: P062 → P065, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P062 → EP065 (edited)', NULL, NULL, '2025-11-05 05:36:20'),
(719, 10, 'PIG_UPDATE', 'Updated pig P061 with changes: Tag ID: P061 → P064, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P061 → EP064 (edited)', NULL, NULL, '2025-11-05 05:37:08'),
(720, 10, 'PIG_UPDATE', 'Updated pig P060 with changes: Tag ID: P060 → P063, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P060 → EP063 (edited)', NULL, NULL, '2025-11-05 05:38:01'),
(721, 10, 'PIG_UPDATE', 'Updated pig EP063 with changes: Tag ID: EP063 → P063, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: EP063 → EP063 (edited)', NULL, NULL, '2025-11-05 05:41:15'),
(722, 10, 'PIG_UPDATE', 'Updated pig P059 with changes: Tag ID: P059 → P088, Birth Date: 2023-10-31 → 2023-10-31, Age: 736 days → 736 days, Breeding Status: available → available, Tag ID: P059 → EP088 (edited)', NULL, NULL, '2025-11-05 05:45:31'),
(723, 10, 'PIG_UPDATE', 'Updated pig P058 with changes: Tag ID: P058 → P084, Birth Date: 2024-10-31 → 2024-10-31, Age: 370 days → 370 days, Breeding Status: available → available, Tag ID: P058 → EP084 (edited)', NULL, NULL, '2025-11-05 05:46:12'),
(724, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-05 05:50:29'),
(725, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-05 05:50:59'),
(726, 10, 'PIG_UPDATE', 'Updated pig P056 with changes: Tag ID: P056 → P075, Birth Date: 2023-10-31 → 2023-10-31, Age: 736 days → 736 days, Breeding Status: available → available, Tag ID: P056 → EP075 (edited)', NULL, NULL, '2025-11-05 05:51:51'),
(727, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-05 08:58:03'),
(728, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-05 13:54:37'),
(729, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-11-05 13:56:30'),
(730, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-11-05 13:57:09'),
(731, 9, 'MILK_TRANSACTION', 'Sale recorded: 6.3L', NULL, NULL, '2025-11-05 13:57:38'),
(732, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-11-05 13:58:01'),
(733, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-11-05 13:58:24'),
(734, 9, 'MILK_TRANSACTION', 'Sale recorded: 16L', NULL, NULL, '2025-11-05 13:58:46'),
(735, 9, 'MILK_TRANSACTION', 'Sale recorded: 0L', NULL, NULL, '2025-11-05 13:59:18'),
(736, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-05 14:00:00'),
(737, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-05 14:00:22'),
(738, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-05 14:00:48'),
(739, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-05 14:01:13'),
(740, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-05 14:02:52'),
(741, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.3L for cow 16', NULL, NULL, '2025-11-05 14:03:24'),
(742, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-05 14:03:46'),
(743, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-05 14:04:10'),
(744, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-05 14:04:39'),
(745, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-11-05 14:05:02'),
(746, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-05 14:05:28'),
(747, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.3L for cow 16', NULL, NULL, '2025-11-05 14:05:51'),
(748, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-05 14:06:12'),
(749, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-05 14:06:37'),
(750, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-05 14:06:56'),
(751, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-11-05 14:07:14'),
(752, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-05 14:07:37'),
(753, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.3L for cow 16', NULL, NULL, '2025-11-05 14:07:58'),
(754, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-05 14:08:23'),
(755, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 18', NULL, NULL, '2025-11-05 14:08:50'),
(756, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4.5L for cow 15', NULL, NULL, '2025-11-05 14:09:07'),
(757, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-11-05 14:09:28'),
(758, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-05 14:09:55'),
(759, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-05 14:10:16'),
(760, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-05 14:10:36'),
(761, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-05 14:10:55'),
(762, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5.5L for cow 15', NULL, NULL, '2025-11-05 14:11:17'),
(763, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-05 14:11:39'),
(764, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:16:49'),
(765, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:26:47'),
(766, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:34:21'),
(767, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:40:14'),
(768, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:40:34'),
(769, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 02:45:39'),
(770, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-06 04:35:09'),
(771, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 07:18:34'),
(772, 10, 'PIG_UPDATE', 'Updated pig P052 with changes: Tag ID: P052 → P060, Birth Date: 2023-10-31 → 2023-10-31, Age: 737 days → 737 days, Breeding Status: available → available, Tag ID: P052 → EP060 (edited)', NULL, NULL, '2025-11-06 07:22:02'),
(773, 10, 'PIG_UPDATE', 'Updated pig P051 with changes: Tag ID: P051 → P085, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P051 → EP085 (edited)', NULL, NULL, '2025-11-06 07:22:39'),
(774, 10, 'PIG_UPDATE', 'Updated pig P050 with changes: Tag ID: P050 → P083, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P050 → EP083 (edited)', NULL, NULL, '2025-11-06 07:23:13'),
(775, 10, 'PIG_UPDATE', 'Updated pig P049 with changes: Tag ID: P049 → P078, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P049 → EP078 (edited)', NULL, NULL, '2025-11-06 07:24:04'),
(776, 10, 'PIG_UPDATE', 'Updated pig P046 with changes: Tag ID: P046 → P010, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P046 → EP010 (edited)', NULL, NULL, '2025-11-06 07:26:28'),
(777, 10, 'PIG_UPDATE', 'Updated pig EP010 with changes: Tag ID: EP010 → P010, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: EP010 → EP010 (edited)', NULL, NULL, '2025-11-06 07:30:22'),
(778, 10, 'PIG_UPDATE', 'Updated pig P043 with changes: Tag ID: P043 → P094, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P043 → EP094 (edited)', NULL, NULL, '2025-11-06 07:32:21'),
(779, 10, 'PIG_UPDATE', 'Updated pig P042 with changes: Tag ID: P042 → P016, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P042 → EP016 (edited)', NULL, NULL, '2025-11-06 07:32:56'),
(780, 10, 'PIG_UPDATE', 'Updated pig P041 with changes: Tag ID: P041 → P015, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P041 → EP015 (edited)', NULL, NULL, '2025-11-06 07:34:16'),
(781, 10, 'PIG_UPDATE', 'Updated pig P040 with changes: Tag ID: P040 → P044, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P040 → EP044 (edited)', NULL, NULL, '2025-11-06 07:35:00'),
(782, 10, 'PIG_UPDATE', 'Updated pig P039 with changes: Tag ID: P039 → P046, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P039 → EP046 (edited)', NULL, NULL, '2025-11-06 07:36:12'),
(783, 10, 'PIG_UPDATE', 'Updated pig P038 with changes: Tag ID: P038 → P034, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P038 → EP034 (edited)', NULL, NULL, '2025-11-06 07:36:57'),
(784, 10, 'PIG_UPDATE', 'Updated pig P037 with changes: Tag ID: P037 → P030, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P037 → EP030 (edited)', NULL, NULL, '2025-11-06 07:38:17'),
(785, 10, 'PIG_UPDATE', 'Updated pig P036 with changes: Tag ID: P036 → P636, Birth Date: 2023-10-31 → 2023-10-31, Age: 737 days → 737 days, Breeding Status: available → available, Tag ID: P036 → EP636 (edited)', NULL, NULL, '2025-11-06 07:39:36'),
(786, 10, 'PIG_UPDATE', 'Updated pig P035 with changes: Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available', NULL, NULL, '2025-11-06 07:39:56'),
(787, 10, 'PIG_UPDATE', 'Updated pig P035 with changes: Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available', NULL, NULL, '2025-11-06 07:39:56'),
(788, 10, 'PIG_UPDATE', 'Updated pig P035 with changes: Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available', NULL, NULL, '2025-11-06 07:40:14'),
(789, 10, 'PIG_UPDATE', 'Updated pig P034 with changes: Tag ID: P034 → P087, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P034 → EP087 (edited)', NULL, NULL, '2025-11-06 07:40:45'),
(790, 10, 'PIG_UPDATE', 'Updated pig P033 with changes: Tag ID: P033 → P086, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P033 → EP086 (edited)', NULL, NULL, '2025-11-06 07:41:17'),
(791, 10, 'PIG_UPDATE', 'Updated pig P032 with changes: Tag ID: P032 → P081, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P032 → EP081 (edited)', NULL, NULL, '2025-11-06 07:41:41'),
(792, 10, 'PIG_UPDATE', 'Updated pig P031 with changes: Tag ID: P031 → P079, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P031 → EP079 (edited)', NULL, NULL, '2025-11-06 07:42:13'),
(793, 10, 'PIG_UPDATE', 'Updated pig P030 with changes: Tag ID: P030 → P020, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P030 → EP020 (edited)', NULL, NULL, '2025-11-06 07:43:03'),
(794, 10, 'PIG_UPDATE', 'Updated pig P029 with changes: Tag ID: P029 → P011, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P029 → EP011 (edited)', NULL, NULL, '2025-11-06 07:43:36'),
(795, 10, 'PIG_UPDATE', 'Updated pig P028 with changes: Tag ID: P028 → P082, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P028 → EP082 (edited)', NULL, NULL, '2025-11-06 07:44:05'),
(796, 10, 'PIG_UPDATE', 'Updated pig P025 with changes: Tag ID: P025 → P071, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P025 → EP071 (edited)', NULL, NULL, '2025-11-06 07:46:57'),
(797, 10, 'PIG_UPDATE', 'Updated pig P024 with changes: Tag ID: P024 → P091, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P024 → EP091 (edited)', NULL, NULL, '2025-11-06 07:47:22'),
(798, 10, 'PIG_UPDATE', 'Updated pig P023 with changes: Tag ID: P023 → P076, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P023 → EP076 (edited)', NULL, NULL, '2025-11-06 07:47:46'),
(799, 10, 'PIG_UPDATE', 'Updated pig P022 with changes: Tag ID: P022 → P026, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P022 → EP026 (edited)', NULL, NULL, '2025-11-06 07:48:13'),
(800, 10, 'PIG_UPDATE', 'Updated pig P021 with changes: Tag ID: P021 → P080, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P021 → EP080 (edited)', NULL, NULL, '2025-11-06 07:49:04'),
(801, 10, 'PIG_UPDATE', 'Updated pig P019 with changes: Tag ID: P019 → P021, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P019 → EP021 (edited)', NULL, NULL, '2025-11-06 07:50:42'),
(802, 10, 'PIG_UPDATE', 'Updated pig P018 with changes: Tag ID: P018 → P031, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P018 → EP031 (edited)', NULL, NULL, '2025-11-06 07:51:02'),
(803, 10, 'PIG_UPDATE', 'Updated pig P017 with changes: Tag ID: P017 → P093, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P017 → EP093 (edited)', NULL, NULL, '2025-11-06 07:51:55'),
(804, 10, 'PIG_UPDATE', 'Updated pig P015 with changes: Tag ID: P015 → P099, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P015 → EP099 (edited)', NULL, NULL, '2025-11-06 07:53:34'),
(805, 10, 'PIG_UPDATE', 'Updated pig P014 with changes: Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available', NULL, NULL, '2025-11-06 07:53:45'),
(806, 10, 'PIG_UPDATE', 'Updated pig P014 with changes: Tag ID: P014 → P048, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P014 → EP048 (edited)', NULL, NULL, '2025-11-06 07:54:04'),
(807, 10, 'PIG_UPDATE', 'Updated pig P013 with changes: Tag ID: P013 → P077, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P013 → EP077 (edited)', NULL, NULL, '2025-11-06 07:54:31'),
(808, 10, 'PIG_UPDATE', 'Updated pig P012 with changes: Tag ID: P012 → P056, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P012 → EP056 (edited)', NULL, NULL, '2025-11-06 07:54:53');
INSERT INTO `activity_log` (`id`, `employee_id`, `action`, `description`, `table_name`, `record_id`, `created_at`) VALUES
(809, 10, 'PIG_UPDATE', 'Updated pig P011 with changes: Tag ID: P011 → P029, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P011 → EP029 (edited)', NULL, NULL, '2025-11-06 07:55:15'),
(810, 10, 'PIG_UPDATE', 'Updated pig P010 with changes: Tag ID: P010 → P049, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P010 → EP049 (edited)', NULL, NULL, '2025-11-06 07:55:33'),
(811, 10, 'PIG_UPDATE', 'Updated pig P009 with changes: Tag ID: P009 → P062, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P009 → EP062 (edited)', NULL, NULL, '2025-11-06 07:55:56'),
(812, 10, 'PIG_UPDATE', 'Updated pig P008 with changes: Tag ID: P008 → P004, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P008 → EP004 (edited)', NULL, NULL, '2025-11-06 07:56:33'),
(813, 10, 'PIG_UPDATE', 'Updated pig P007 with changes: Tag ID: P007 → P002, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P007 → EP002 (edited)', NULL, NULL, '2025-11-06 07:56:59'),
(814, 10, 'PIG_UPDATE', 'Updated pig P006 with changes: Tag ID: P006 → P003, Birth Date: 2024-10-29 → 2024-10-29, Age: 373 days → 373 days, Breeding Status: available → available, Tag ID: P006 → EP003 (edited)', NULL, NULL, '2025-11-06 07:57:22'),
(815, 10, 'PIG_UPDATE', 'Updated pig P004 with changes: Tag ID: P004 → P045, Birth Date: 2022-10-29 → 2022-10-29, Age: 1104 days → 1104 days, Breeding Status: available → available, Tag ID: P004 → EP045 (edited)', NULL, NULL, '2025-11-06 07:59:38'),
(816, 10, 'PIG_UPDATE', 'Updated pig P003 with changes: Tag ID: P003 → P032, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P003 → EP032 (edited)', NULL, NULL, '2025-11-06 08:00:32'),
(817, 10, 'PIG_UPDATE', 'Updated pig P002 with changes: Tag ID: P002 → P037, Birth Date: 2023-10-29 → 2023-10-29, Age: 739 days → 739 days, Breeding Status: available → available, Tag ID: P002 → EP037 (edited)', NULL, NULL, '2025-11-06 08:00:57'),
(818, 10, 'PIG_UPDATE', 'Updated pig P044 with changes: Tag ID: P044 → P033, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P044 → EP033 (edited)', NULL, NULL, '2025-11-06 08:05:30'),
(819, 10, 'PIG_UPDATE', 'Updated pig P057 with changes: Tag ID: P057 → P022, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P057 → EP022 (edited)', NULL, NULL, '2025-11-06 08:07:57'),
(820, 10, 'PIG_UPDATE', 'Updated pig P055 with changes: Tag ID: P055 → P012, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P055 → EP012 (edited)', NULL, NULL, '2025-11-06 08:08:26'),
(821, 10, 'PIG_UPDATE', 'Updated pig P054 with changes: Tag ID: P054 → P018, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P054 → EP018 (edited)', NULL, NULL, '2025-11-06 08:10:02'),
(822, 10, 'PIG_UPDATE', 'Updated pig P053 with changes: Tag ID: P053 → P007, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P053 → EP007 (edited)', NULL, NULL, '2025-11-06 08:10:26'),
(823, 10, 'PIG_UPDATE', 'Updated pig P048 with changes: Tag ID: P048 → P024, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P048 → EP024 (edited)', NULL, NULL, '2025-11-06 08:10:52'),
(824, 10, 'PIG_UPDATE', 'Updated pig P027 with changes: Tag ID: P027 → P025, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P027 → EP025 (edited)', NULL, NULL, '2025-11-06 08:12:47'),
(825, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 08:16:15'),
(826, 10, 'PIG_UPDATE', 'Updated pig P047 with changes: Tag ID: P047 → P013, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: P047 → EP013 (edited)', NULL, NULL, '2025-11-06 08:17:04'),
(827, 10, 'PIG_UPDATE', 'Updated pig EP046 with changes: Tag ID: EP046 → P046, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: EP046 → EP046 (edited)', NULL, NULL, '2025-11-06 08:22:50'),
(828, 10, 'PIG_UPDATE', 'Updated pig EP046 with changes: Tag ID: EP046 → P014, Birth Date: 2024-10-31 → 2024-10-31, Age: 371 days → 371 days, Breeding Status: available → available, Tag ID: EP046 → EP014 (edited)', NULL, NULL, '2025-11-06 08:25:52'),
(829, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 08:39:10'),
(830, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 08:55:06'),
(831, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-06 08:58:17'),
(832, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-08 11:46:37'),
(833, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-08 11:47:25'),
(834, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-08 11:47:45'),
(835, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-08 11:48:10'),
(836, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-08 11:48:33'),
(837, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-08 11:48:50'),
(838, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-08 11:49:09'),
(839, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 16', NULL, NULL, '2025-11-08 11:49:31'),
(840, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-08 11:49:49'),
(841, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-08 11:50:09'),
(842, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-08 11:50:31'),
(843, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-08 11:50:59'),
(844, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-11-08 11:51:17'),
(845, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-08 11:51:39'),
(846, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-08 11:51:59'),
(847, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-08 11:52:21'),
(848, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-11-08 11:52:40'),
(849, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-08 11:53:05'),
(850, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-11-08 11:53:23'),
(851, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 16', NULL, NULL, '2025-11-08 11:53:51'),
(852, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-08 11:54:09'),
(853, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-08 11:54:38'),
(854, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-08 11:55:00'),
(855, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-11-08 11:55:25'),
(856, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4.5L for cow 15', NULL, NULL, '2025-11-08 11:55:47'),
(857, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-08 11:56:13'),
(858, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 11:57:03'),
(859, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 11:57:18'),
(860, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 11:57:42'),
(861, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 11:58:02'),
(862, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 11:58:21'),
(863, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-11-08 11:58:48'),
(864, 9, 'MILK_TRANSACTION', 'Sale recorded: 6.3L', NULL, NULL, '2025-11-08 11:59:12'),
(865, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-11-08 11:59:36'),
(866, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-11-08 12:00:12'),
(867, 9, 'MILK_TRANSACTION', 'Sale recorded: 16L', NULL, NULL, '2025-11-08 12:00:37'),
(868, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-08 12:01:10'),
(869, 9, 'MILK_TRANSACTION', 'Sale recorded: 14.5L', NULL, NULL, '2025-11-08 12:01:40'),
(870, 9, 'MILK_TRANSACTION', 'Sale recorded: 5.3L', NULL, NULL, '2025-11-08 12:02:13'),
(871, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-09 11:02:26'),
(872, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP013 with Boar EP636', NULL, NULL, '2025-11-09 11:11:51'),
(873, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP010 with Boar EP636', NULL, NULL, '2025-11-09 11:13:19'),
(874, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP015 with Boar EP636', NULL, NULL, '2025-11-09 11:19:09'),
(875, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP016 with Boar EP636', NULL, NULL, '2025-11-09 11:21:58'),
(876, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP018 with Boar EP636', NULL, NULL, '2025-11-09 11:23:30'),
(877, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP014 with Boar EP636', NULL, NULL, '2025-11-09 11:36:43'),
(878, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP024 with Boar EP636', NULL, NULL, '2025-11-09 11:37:37'),
(879, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP044 with Boar EP636', NULL, NULL, '2025-11-09 11:39:09'),
(880, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP067 with Boar EP636', NULL, NULL, '2025-11-09 11:40:15'),
(881, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP071 with Boar EP636', NULL, NULL, '2025-11-09 11:41:04'),
(882, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP078 with Boar EP636', NULL, NULL, '2025-11-09 11:42:05'),
(883, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP088 with Boar EP636', NULL, NULL, '2025-11-09 11:42:46'),
(884, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-09 15:46:50'),
(885, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-10 07:52:02'),
(886, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-10 07:52:37'),
(887, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-10 07:52:57'),
(888, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-10 07:53:14'),
(889, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 18', NULL, NULL, '2025-11-10 07:53:34'),
(890, 9, 'MILK_PRODUCTION', 'Milk production recorded: 5L for cow 15', NULL, NULL, '2025-11-10 07:53:53'),
(891, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-11-10 07:54:11'),
(892, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-10 07:54:35'),
(893, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-10 07:54:51'),
(894, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-10 07:55:13'),
(895, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-11-10 07:55:33'),
(896, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 15', NULL, NULL, '2025-11-10 07:55:56'),
(897, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-10 07:56:13'),
(898, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-10 07:56:32'),
(899, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-10 07:56:48'),
(900, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-10 07:57:02'),
(901, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-10 07:57:21'),
(902, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 15', NULL, NULL, '2025-11-10 07:57:36'),
(903, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-10 07:57:49'),
(904, 9, 'MILK_TRANSACTION', 'Sale recorded: 14L', NULL, NULL, '2025-11-10 07:58:26'),
(905, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-10 07:58:45'),
(906, 9, 'MILK_TRANSACTION', 'Sale recorded: 14L', NULL, NULL, '2025-11-10 07:59:13'),
(907, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-10 07:59:34'),
(908, 9, 'MILK_TRANSACTION', 'Sale recorded: 14L', NULL, NULL, '2025-11-10 07:59:53'),
(909, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-10 08:00:16'),
(910, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-10 08:00:30'),
(911, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-10 08:00:44'),
(912, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-11 09:55:13'),
(913, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-11 09:57:45'),
(914, 10, 'LOGIN', 'Employee Mary karimi logged in successfully', NULL, NULL, '2025-11-13 08:57:06'),
(915, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP011 with Boar EP636', NULL, NULL, '2025-11-13 09:05:48'),
(916, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP021 with Boar EP636', NULL, NULL, '2025-11-13 09:07:18'),
(917, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP022 with Boar EP636', NULL, NULL, '2025-11-13 09:08:22'),
(918, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP031 with Boar EP636', NULL, NULL, '2025-11-13 09:09:21'),
(919, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP032 with Boar EP636', NULL, NULL, '2025-11-13 09:10:15'),
(920, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP030 with Boar EP636', NULL, NULL, '2025-11-13 09:11:03'),
(921, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP037 with Boar EP636', NULL, NULL, '2025-11-13 09:12:17'),
(922, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP045 with Boar EP636', NULL, NULL, '2025-11-13 09:13:11'),
(923, 10, 'BREEDING_REGISTRATION', 'Breeding record created: Sow EP049 with Boar EP636', NULL, NULL, '2025-11-13 09:14:00'),
(924, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-13 09:20:29'),
(925, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-15 05:33:33'),
(926, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-15 05:34:49'),
(927, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-15 05:35:05'),
(928, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-15 05:35:25'),
(929, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-15 05:35:42'),
(930, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-15 05:35:59'),
(931, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-15 05:36:14'),
(932, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-15 05:36:37'),
(933, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-15 05:36:54'),
(934, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-15 05:37:11'),
(935, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 18', NULL, NULL, '2025-11-15 05:37:27'),
(936, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 15', NULL, NULL, '2025-11-15 05:37:52'),
(937, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-11-15 05:38:11'),
(938, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-15 05:38:35'),
(939, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-15 05:38:53'),
(940, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-15 05:39:15'),
(941, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-15 05:39:33'),
(942, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 15', NULL, NULL, '2025-11-15 05:39:57'),
(943, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 15', NULL, NULL, '2025-11-15 05:40:14'),
(944, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2L for cow 16', NULL, NULL, '2025-11-15 05:40:34'),
(945, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-15 05:40:50'),
(946, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-15 05:41:07'),
(947, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-15 05:41:25'),
(948, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 15', NULL, NULL, '2025-11-15 05:41:44'),
(949, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 15', NULL, NULL, '2025-11-15 05:42:01'),
(950, 9, 'MILK_TRANSACTION', 'Sale recorded: 12L', NULL, NULL, '2025-11-15 05:42:36'),
(951, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-15 05:42:53'),
(952, 9, 'MILK_TRANSACTION', 'Sale recorded: 14L', NULL, NULL, '2025-11-15 05:43:12'),
(953, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-15 05:43:29'),
(954, 9, 'MILK_TRANSACTION', 'Sale recorded: 14L', NULL, NULL, '2025-11-15 05:44:04'),
(955, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-15 05:44:23'),
(956, 9, 'MILK_TRANSACTION', 'Sale recorded: 12.5L', NULL, NULL, '2025-11-15 05:44:57'),
(957, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-15 05:45:25'),
(958, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-15 05:45:52'),
(959, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-15 05:46:05'),
(960, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-15 05:46:31'),
(961, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-15 05:46:46'),
(962, 9, 'MILK_TRANSACTION', 'Usage recorded: L', NULL, NULL, '2025-11-15 05:47:02'),
(963, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-18 15:03:35'),
(964, 9, 'MILK_TRANSACTION', 'Sale recorded: 12L', NULL, NULL, '2025-11-18 15:04:10'),
(965, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-18 15:04:31'),
(966, 9, 'MILK_TRANSACTION', 'Sale recorded: 5L', NULL, NULL, '2025-11-18 15:04:48'),
(967, 9, 'MILK_TRANSACTION', 'Sale recorded: 12L', NULL, NULL, '2025-11-18 15:05:09'),
(968, 9, 'MILK_TRANSACTION', 'Sale recorded: 4L', NULL, NULL, '2025-11-18 15:05:30'),
(969, 9, 'MILK_TRANSACTION', 'Sale recorded: 10L', NULL, NULL, '2025-11-18 15:05:50'),
(970, 9, 'MILK_TRANSACTION', 'Sale recorded: 10L', NULL, NULL, '2025-11-18 15:06:15'),
(971, 9, 'MILK_TRANSACTION', 'Sale recorded: 4L', NULL, NULL, '2025-11-18 15:06:29'),
(972, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-18 15:07:09'),
(973, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-18 15:07:26'),
(974, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-18 15:07:45'),
(975, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-11-18 15:08:08'),
(976, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3L for cow 15', NULL, NULL, '2025-11-18 15:08:33'),
(977, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-11-18 15:08:56'),
(978, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-18 15:09:17'),
(979, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-18 15:09:35'),
(980, 9, 'MILK_PRODUCTION', 'Milk production recorded: 8L for cow 18', NULL, NULL, '2025-11-18 15:09:55'),
(981, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-18 15:10:15'),
(982, 9, 'MILK_PRODUCTION', 'Milk production recorded: 2.5L for cow 15', NULL, NULL, '2025-11-18 15:10:35'),
(983, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 15', NULL, NULL, '2025-11-18 15:10:53'),
(984, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-18 15:11:19'),
(985, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-18 15:11:40'),
(986, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7L for cow 18', NULL, NULL, '2025-11-18 15:12:02'),
(987, 9, 'MILK_PRODUCTION', 'Milk production recorded: 3.5L for cow 18', NULL, NULL, '2025-11-18 15:12:24'),
(988, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 15', NULL, NULL, '2025-11-18 15:12:44'),
(989, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 15', NULL, NULL, '2025-11-18 15:13:08'),
(990, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 16', NULL, NULL, '2025-11-18 15:13:39'),
(991, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 16', NULL, NULL, '2025-11-18 15:13:53'),
(992, 9, 'MILK_PRODUCTION', 'Milk production recorded: 7L for cow 18', NULL, NULL, '2025-11-18 15:14:09'),
(993, 9, 'MILK_PRODUCTION', 'Milk production recorded: 4L for cow 18', NULL, NULL, '2025-11-18 15:14:28'),
(994, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1.5L for cow 15', NULL, NULL, '2025-11-18 15:14:45'),
(995, 9, 'MILK_PRODUCTION', 'Milk production recorded: 1L for cow 15', NULL, NULL, '2025-11-18 15:15:00'),
(996, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-19 08:31:23'),
(997, 9, 'LOGIN', 'Employee dennis kimathi mbae logged in successfully', NULL, NULL, '2025-11-19 08:42:25'),
(998, 14, 'SIGNUP', 'New employee djjdjs registered with code 777777 - Status: Waiting Approval', NULL, NULL, '2025-11-19 14:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `breeding_records`
--

CREATE TABLE `breeding_records` (
  `id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `boar_id` int(11) NOT NULL,
  `mating_date` date NOT NULL,
  `expected_due_date` date DEFAULT NULL,
  `status` enum('served','pregnant','cancelled','completed') DEFAULT 'served',
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeding_records`
--

INSERT INTO `breeding_records` (`id`, `sow_id`, `boar_id`, `mating_date`, `expected_due_date`, `status`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(66, 156, 144, '2025-06-04', '2025-09-26', 'completed', '', 10, '2025-11-09 11:11:51', '2025-11-09 11:58:21'),
(67, 155, 144, '2025-05-29', '2025-09-20', 'completed', '', 10, '2025-11-09 11:13:19', '2025-11-09 11:57:53'),
(68, 150, 144, '2025-06-28', '2025-10-20', 'completed', '', 10, '2025-11-09 11:19:09', '2025-11-09 11:57:10'),
(69, 151, 144, '2025-05-31', '2025-09-22', 'completed', '', 10, '2025-11-09 11:21:58', '2025-11-09 11:56:38'),
(70, 163, 144, '2025-06-15', '2025-10-07', 'completed', '', 10, '2025-11-09 11:23:30', '2025-11-09 11:56:06'),
(71, 147, 144, '2025-07-05', '2025-10-27', 'completed', '', 10, '2025-11-09 11:36:43', '2025-11-09 11:55:28'),
(72, 157, 144, '2025-06-22', '2025-10-14', 'completed', '', 10, '2025-11-09 11:37:37', '2025-11-09 11:53:30'),
(73, 148, 144, '2025-06-23', '2025-10-15', 'completed', '', 10, '2025-11-09 11:39:09', '2025-11-09 11:54:51'),
(74, 173, 144, '2025-05-31', '2025-09-22', 'completed', '', 10, '2025-11-09 11:40:15', '2025-11-09 11:52:51'),
(75, 133, 144, '2025-07-03', '2025-10-25', 'completed', '', 10, '2025-11-09 11:41:04', '2025-11-09 11:54:11'),
(76, 158, 144, '2025-06-23', '2025-10-15', 'completed', '', 10, '2025-11-09 11:42:05', '2025-11-09 11:46:24'),
(77, 168, 144, '2025-05-30', '2025-09-21', 'completed', '', 10, '2025-11-09 11:42:46', '2025-11-13 09:22:04'),
(78, 137, 144, '2025-10-14', '2026-02-05', 'pregnant', '', 10, '2025-11-13 09:05:48', '2025-11-13 09:20:29'),
(79, 125, 144, '2025-10-03', '2026-01-25', 'pregnant', '', 10, '2025-11-13 09:07:18', '2025-11-13 09:20:29'),
(80, 166, 144, '2025-10-21', '2026-02-12', 'pregnant', '', 10, '2025-11-13 09:08:22', '2025-11-18 15:03:35'),
(81, 124, 144, '2025-10-06', '2026-01-28', 'pregnant', '', 10, '2025-11-13 09:09:21', '2025-11-13 09:20:29'),
(82, 109, 144, '2025-10-17', '2026-02-08', 'pregnant', '', 10, '2025-11-13 09:10:15', '2025-11-13 09:20:29'),
(83, 145, 144, '2025-10-23', '2026-02-14', 'pregnant', '', 10, '2025-11-13 09:11:03', '2025-11-18 15:03:35'),
(84, 108, 144, '2025-10-22', '2026-02-13', 'pregnant', '', 10, '2025-11-13 09:12:17', '2025-11-18 15:03:35'),
(85, 110, 144, '2025-10-15', '2026-02-06', 'pregnant', '', 10, '2025-11-13 09:13:11', '2025-11-13 09:20:29'),
(86, 116, 144, '2025-10-14', '2026-02-05', 'pregnant', '', 10, '2025-11-13 09:13:59', '2025-11-13 09:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `calves`
--

CREATE TABLE `calves` (
  `id` int(11) NOT NULL,
  `calf_id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `breed` varchar(100) NOT NULL,
  `color_markings` text DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `birth_date` date NOT NULL,
  `dam_id` int(11) NOT NULL,
  `sire_id` int(11) NOT NULL,
  `status` enum('active','sold','deceased') DEFAULT 'active',
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chickens`
--

CREATE TABLE `chickens` (
  `id` int(11) NOT NULL,
  `chicken_id` varchar(20) NOT NULL,
  `batch_name` varchar(100) NOT NULL,
  `chicken_type` enum('broiler','kienyeji','layer') NOT NULL,
  `breed_name` varchar(100) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `hatch_date` date NOT NULL,
  `age_days` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `coop_number` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `current_status` enum('active','sold','dead','culled') DEFAULT 'active',
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_meat_production`
--

CREATE TABLE `chicken_meat_production` (
  `id` int(11) NOT NULL,
  `production_id` int(11) DEFAULT NULL,
  `chicken_number` int(11) NOT NULL,
  `alive_weight` decimal(6,3) NOT NULL,
  `dead_weight` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_medications`
--

CREATE TABLE `chicken_medications` (
  `id` int(11) NOT NULL,
  `category` enum('broiler','kienyeji','layer') NOT NULL,
  `medication_name` varchar(200) NOT NULL,
  `start_day` int(11) NOT NULL,
  `end_day` int(11) NOT NULL,
  `purpose` text DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_medication_tracking`
--

CREATE TABLE `chicken_medication_tracking` (
  `id` int(11) NOT NULL,
  `chicken_id` varchar(20) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `scheduled_date` date NOT NULL,
  `completed_date` date DEFAULT NULL,
  `status` enum('pending','completed','missed') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `administered_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_production`
--

CREATE TABLE `chicken_production` (
  `id` int(11) NOT NULL,
  `production_type` enum('eggs','meat') NOT NULL,
  `chicken_id` varchar(50) NOT NULL,
  `chicken_category` varchar(20) NOT NULL,
  `production_date` date NOT NULL,
  `production_time` time NOT NULL,
  `quantity` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_production_audit`
--

CREATE TABLE `chicken_production_audit` (
  `id` int(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `chicken_id` varchar(50) NOT NULL,
  `production_type` enum('eggs','meat') NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_stages`
--

CREATE TABLE `chicken_stages` (
  `id` int(11) NOT NULL,
  `category` enum('broiler','kienyeji','layer') NOT NULL,
  `stage_name` varchar(100) NOT NULL,
  `start_day` int(11) NOT NULL,
  `end_day` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chicken_stages`
--

INSERT INTO `chicken_stages` (`id`, `category`, `stage_name`, `start_day`, `end_day`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'broiler', 'BROODING SATGE ', 1, 14, 'Young chicks need warmth and starter feed.', 9, '2025-10-12 06:17:53', '2025-10-12 06:21:53'),
(2, 'broiler', 'GROWERS', 15, 28, 'Rapid growth; feed grower mash.', 9, '2025-10-12 06:22:23', '2025-10-12 06:22:23'),
(3, 'broiler', 'FINISHERS', 29, 56, 'Final fattening before selling or slaughter.', 9, '2025-10-12 06:22:48', '2025-10-12 06:22:48'),
(4, 'kienyeji', 'BROODING SATGE ', 1, 28, 'Chicks need warmth, water, and starter feed.', 9, '2025-10-12 06:23:27', '2025-10-12 06:23:27'),
(5, 'kienyeji', 'GROWERS STAGE', 29, 98, 'Chickens grow bigger and stronger.', 9, '2025-10-12 06:23:58', '2025-10-12 06:23:58'),
(6, 'kienyeji', 'PRE-LAYER STAGE', 99, 140, 'Preparing to lay eggs or be sold.', 9, '2025-10-12 06:24:34', '2025-10-12 06:24:34'),
(7, 'kienyeji', 'LAYING STAGE', 141, 500, 'Hens start laying; cocks ready for sale.', 9, '2025-10-12 06:25:09', '2025-10-12 06:25:09'),
(8, 'layer', 'BROODING SATGE ', 1, 42, 'Chicks need heat, care, and starter feed.', 9, '2025-10-12 06:25:35', '2025-10-12 06:25:35'),
(9, 'layer', 'GROWERS STAGE', 43, 126, 'Birds develop and prepare to start laying', 9, '2025-10-12 06:26:04', '2025-10-12 06:26:04'),
(10, 'layer', 'LAYERS STAGE', 127, 560, 'Hens lay eggs daily; feed layer mash.', 9, '2025-10-12 06:26:37', '2025-10-12 06:26:37'),
(11, 'layer', 'RETIREMENT STAGE', 561, 700, 'Hens stop laying; ready for sale.', 9, '2025-10-12 06:27:04', '2025-10-12 06:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `chicken_weight_standards`
--

CREATE TABLE `chicken_weight_standards` (
  `id` int(11) NOT NULL,
  `category` enum('broiler','kienyeji','layer') NOT NULL,
  `age_days` int(11) NOT NULL,
  `expected_weight` decimal(6,3) NOT NULL COMMENT 'Weight in kilograms',
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chicken_weight_tracking`
--

CREATE TABLE `chicken_weight_tracking` (
  `id` int(11) NOT NULL,
  `chicken_id` varchar(50) NOT NULL,
  `weight_standard_id` int(11) NOT NULL,
  `actual_weight` decimal(6,3) NOT NULL,
  `expected_weight` decimal(6,3) NOT NULL,
  `weight_percentage` decimal(5,2) NOT NULL,
  `weight_category` enum('healthy','underweight','overweight') NOT NULL,
  `checked_by` int(11) NOT NULL,
  `checked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cows`
--

CREATE TABLE `cows` (
  `id` int(11) NOT NULL,
  `ear_tag` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `color_markings` text DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `birth_date` date DEFAULT NULL,
  `age_days` int(11) DEFAULT NULL,
  `source` enum('born','purchased') NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_place` varchar(255) DEFAULT NULL,
  `sire_ear_tag` varchar(20) DEFAULT NULL,
  `sire_details` text DEFAULT NULL,
  `dam_ear_tag` varchar(20) DEFAULT NULL,
  `dam_details` text DEFAULT NULL,
  `status` enum('active','sold','deceased','transferred') DEFAULT 'active',
  `registered_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cows`
--

INSERT INTO `cows` (`id`, `ear_tag`, `name`, `breed`, `color_markings`, `gender`, `birth_date`, `age_days`, `source`, `purchase_date`, `purchase_place`, `sire_ear_tag`, `sire_details`, `dam_ear_tag`, `dam_details`, `status`, `registered_by`, `created_at`, `updated_at`) VALUES
(15, 'C001', 'Grace', 'Friesian', 'Black and white', 'female', '2021-10-30', 1445, 'purchased', '2022-08-27', 'Gatuuri farm', 'Ai', '', 'N/A', '', 'active', 10, '2025-10-14 08:58:31', '2025-10-14 08:58:31'),
(16, 'C002', 'Jenny', 'Friesian', 'Black and white', 'female', '2022-09-29', 1111, 'born', '0000-00-00', '', 'Ai', '', 'Jenny 001', '', 'active', 10, '2025-10-14 08:59:47', '2025-10-14 08:59:47'),
(17, 'C003', 'Mukiri', 'Friesian', 'Black white', 'female', '2023-01-31', 987, 'purchased', '2023-12-21', 'Kionyo farm  (gitonga)', 'Ai', '', 'N/a', '', 'active', 10, '2025-10-14 09:03:01', '2025-10-14 09:03:01'),
(18, 'C004', 'Toore', 'Friesian', '', 'female', '2023-01-04', 1014, 'born', '0000-00-00', '', 'Ai', '', 'Grace', '', 'active', 10, '2025-10-14 09:04:32', '2025-10-14 09:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `cow_breeding`
--

CREATE TABLE `cow_breeding` (
  `id` int(11) NOT NULL,
  `dam_id` int(11) NOT NULL,
  `sire_id` int(11) NOT NULL,
  `breeding_date` date NOT NULL,
  `expected_calving_date` date NOT NULL,
  `pregnancy_status` enum('served','conceived','lactating','available') DEFAULT 'served',
  `conception_cancelled` tinyint(1) DEFAULT 0,
  `cancellation_reason` text DEFAULT NULL,
  `cancellation_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `lactation_start_date` date DEFAULT NULL,
  `lactation_end_date` date DEFAULT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cow_edit_history`
--

CREATE TABLE `cow_edit_history` (
  `id` int(11) NOT NULL,
  `cow_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cow_edit_history`
--

INSERT INTO `cow_edit_history` (`id`, `cow_id`, `field_name`, `old_value`, `new_value`, `edited_by`, `edited_at`) VALUES
(1, 2, 'Ear Tag', 'C002', 'EC002', 10, '2025-09-30 07:00:18'),
(2, 2, 'Dam Ear Tag', 'Jenny', 'Grace', 10, '2025-09-30 07:00:18'),
(3, 2, 'Dam Details', '', 'Brought to kwetu farm from home.belonged to mum and was purchased in January 2025', 10, '2025-09-30 07:00:18'),
(4, 1, 'Ear Tag', 'C001', 'EC001', 10, '2025-09-30 07:04:21'),
(5, 1, 'Name', 'May', 'Jenn', 10, '2025-09-30 07:04:21'),
(6, 1, 'Color/Markings', 'Black', 'White and black', 10, '2025-09-30 07:04:21'),
(7, 1, 'Birth Date', '2024-09-27', '2022-09-27', 10, '2025-09-30 07:04:21'),
(8, 1, 'Source', 'born', 'purchased', 10, '2025-09-30 07:04:21'),
(9, 1, 'Purchase Date', '0000-00-00', '2023-09-30', 10, '2025-09-30 07:04:21'),
(10, 1, 'Purchase Place', '', 'Nyaagi farm', 10, '2025-09-30 07:04:21'),
(11, 1, 'Sire Ear Tag', 'A001', 'Ai', 10, '2025-09-30 07:04:21'),
(12, 1, 'Sire Details', 'Test', 'Sired once, the calve did not survive', 10, '2025-09-30 07:04:21'),
(13, 1, 'Dam Ear Tag', 'B001', 'Grace', 10, '2025-09-30 07:04:21'),
(14, 1, 'Dam Details', 'Test', 'Bought from nyaagi farm ', 10, '2025-09-30 07:04:21'),
(15, 1, 'Name', 'Jenn', 'Jenny', 10, '2025-09-30 07:04:58'),
(16, 3, 'Ear Tag', 'C001', 'EC003', 10, '2025-09-30 07:09:42'),
(17, 4, 'Ear Tag', 'C001', 'EC004', 10, '2025-09-30 07:14:44'),
(18, 5, 'Ear Tag', 'C001', 'EC005', 10, '2025-09-30 07:17:39'),
(19, 5, 'Purchase Date', '0000-00-00', '', 10, '2025-09-30 07:17:39'),
(20, 6, 'Ear Tag', 'C001', 'EC006', 10, '2025-09-30 07:20:27'),
(21, 7, 'Ear Tag', 'C001', 'EC007', 10, '2025-09-30 07:22:33'),
(22, 8, 'Ear Tag', 'C001', 'EC008', 10, '2025-09-30 07:27:39'),
(23, 9, 'Ear Tag', 'C001', 'EC009', 10, '2025-09-30 07:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `dead_pigs`
--

CREATE TABLE `dead_pigs` (
  `id` int(11) NOT NULL,
  `pig_id` int(11) DEFAULT NULL,
  `litter_id` int(11) DEFAULT NULL,
  `pig_type` enum('grown_pig','litter') NOT NULL,
  `death_date` date NOT NULL,
  `cause_of_death` enum('disease','injury','old_age','predator_attack','accident','birth_complications','unknown') NOT NULL,
  `weight_at_death` decimal(8,2) NOT NULL,
  `age_at_death` int(11) DEFAULT NULL,
  `additional_details` text DEFAULT NULL,
  `pigs_count` int(11) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `death_records_edit_history`
--

CREATE TABLE `death_records_edit_history` (
  `id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `employee_code` varchar(6) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` enum('administrator','manager','employee','vet','it') DEFAULT 'employee',
  `status` enum('waiting_approval','active','suspended') DEFAULT 'waiting_approval',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `email`, `phone`, `employee_code`, `password`, `profile_image`, `role`, `status`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'kimathi mbae', 'kimathimbae1@gmail.com', '0795606115', '000000', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', NULL, 'administrator', 'active', 1, '2025-08-29 10:03:20', '2025-08-29 14:18:10'),
(9, 'dennis kimathi mbae', 'kimathimbae@gmail.com', '0795606114', '111111', 'c612d44854fc0e5783e8a18eab88c8f89cfc5aed5c3defce5103c95735606da9', NULL, 'administrator', 'active', 1, '2025-08-29 11:13:53', '2025-08-29 18:52:04'),
(10, 'Mary karimi', 'guantaimary@gmail.com', '0723864156', '222222', '0efe04144a0d0ac3f303bf653f2cfce813272df928c391d36042456a3e6b3bae', NULL, 'administrator', 'active', 1, '2025-09-06 06:45:51', '2025-09-06 06:47:05'),
(11, 'Dennis Amutsa', 'amutsadennis@gmail.com', '0740968090', '999999', '937377f056160fc4b15e0b770c67136a5f03c15205b4d3bf918268fefa2c6d0a', NULL, 'administrator', 'active', 1, '2025-10-15 12:16:29', '2025-10-15 12:17:08'),
(12, 'Hakan Genc', 'Hnhautorepair@yahoo.com', '6315126722', '878678', '76d11ff99f9d66e79f08767007ce73e9e423873a3722980662c52c0f3dd4a2e6', NULL, 'employee', 'waiting_approval', 1, '2025-10-30 18:08:21', '2025-10-30 18:08:21'),
(13, 'Cc Hshs', 'dennysyahputra2900@gmail.com', '06959595969', '696969', 'af65bf1d3bcb482f1480dab5210d79cdbeecab1ec8cf556dc1fdc8984c5c04d6', NULL, 'employee', 'waiting_approval', 1, '2025-11-04 16:10:59', '2025-11-04 16:10:59'),
(14, 'djjdjs', 'ratugepuk@gmail.com', '085833265566', '777777', '9a784b76dd6fb8a025183787c3efb0e7b35baf0b7f0c6a2b068f6182d9afa75f', NULL, 'employee', 'waiting_approval', 1, '2025-11-19 14:59:21', '2025-11-19 14:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_conceptions`
--

CREATE TABLE `failed_conceptions` (
  `id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `boar_id` int(11) NOT NULL,
  `mating_date` date NOT NULL,
  `failure_date` date NOT NULL,
  `failure_reason` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farms`
--

CREATE TABLE `farms` (
  `id` int(11) NOT NULL,
  `farm_name` varchar(100) NOT NULL,
  `farm_location` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farms`
--

INSERT INTO `farms` (`id`, `farm_name`, `farm_location`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FARM A', 'KEMU', 9, 'active', '2025-09-05 21:40:54', '2025-09-05 21:40:54'),
(2, 'FARM B', 'TOWN', 9, 'active', '2025-09-05 21:41:08', '2025-09-05 21:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `farrowing_activities`
--

CREATE TABLE `farrowing_activities` (
  `id` int(11) NOT NULL,
  `farrowing_record_id` int(11) NOT NULL,
  `activity_name` varchar(100) NOT NULL,
  `due_day` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `completed` tinyint(1) DEFAULT 0,
  `completed_date` datetime DEFAULT NULL,
  `weaning_weight` decimal(5,2) DEFAULT NULL,
  `weaning_date` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `completed_by` int(11) DEFAULT NULL COMMENT 'Employee who completed the activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farrowing_activities`
--

INSERT INTO `farrowing_activities` (`id`, `farrowing_record_id`, `activity_name`, `due_day`, `due_date`, `completed`, `completed_date`, `weaning_weight`, `weaning_date`, `notes`, `created_at`, `updated_at`, `completed_by`) VALUES
(1, 1, 'Clear airways, ensure colostrum intake', 1, '2025-09-06', 1, '2025-09-06 01:53:45', NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(2, 1, 'Provide heat lamps', 1, '2025-09-06', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(3, 1, 'Remove afterbirth', 1, '2025-09-06', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(4, 1, 'Iron injections', 2, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(5, 1, 'Ear notching/tagging', 2, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(6, 1, 'Tail docking', 3, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(7, 1, 'Castration (males)', 3, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(8, 1, 'Start creep feed', 14, '2025-09-19', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(9, 1, 'Weaning', 21, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:27', '2025-10-04 05:03:50', NULL),
(10, 2, 'Clear airways, ensure colostrum intake', 1, '2025-07-18', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(11, 2, 'Provide heat lamps', 1, '2025-07-18', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(12, 2, 'Remove afterbirth', 1, '2025-07-18', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(13, 2, 'Iron injections', 2, '2025-07-19', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(14, 2, 'Ear notching/tagging', 2, '2025-07-19', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(15, 2, 'Tail docking', 3, '2025-07-20', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(16, 2, 'Castration (males)', 3, '2025-07-20', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(17, 2, 'Start creep feed', 14, '2025-07-31', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(18, 2, 'Weaning', 21, '2025-08-07', 0, NULL, NULL, NULL, NULL, '2025-09-05 22:18:53', '2025-10-04 05:03:50', NULL),
(19, 3, 'Clear airways, ensure colostrum intake', 1, '2025-07-11', 1, '2025-09-06 01:54:00', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(20, 3, 'Provide heat lamps', 1, '2025-07-11', 1, '2025-09-06 01:54:20', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(21, 3, 'Remove afterbirth', 1, '2025-07-11', 1, '2025-09-06 01:54:25', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(22, 3, 'Iron injections', 2, '2025-07-12', 1, '2025-09-06 01:54:30', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(23, 3, 'Ear notching/tagging', 2, '2025-07-12', 1, '2025-09-06 01:54:36', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(24, 3, 'Tail docking', 3, '2025-07-13', 1, '2025-09-06 01:54:42', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(25, 3, 'Castration (males)', 3, '2025-07-13', 1, '2025-09-06 01:54:47', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(26, 3, 'Start creep feed', 14, '2025-07-24', 1, '2025-09-06 01:54:53', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(27, 3, 'Weaning', 21, '2025-07-31', 1, '2025-09-06 01:55:11', NULL, NULL, NULL, '2025-09-05 22:20:51', '2025-10-04 05:03:50', NULL),
(28, 4, 'Clear airways, ensure colostrum intake', 1, '2025-09-24', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(29, 4, 'Provide heat lamps', 1, '2025-09-24', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(30, 4, 'Remove afterbirth', 1, '2025-09-24', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(31, 4, 'Iron injections', 2, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(32, 4, 'Ear notching/tagging', 2, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(33, 4, 'Tail docking', 3, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(34, 4, 'Castration (males)', 3, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(35, 4, 'Start creep feed', 14, '2025-10-07', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(36, 4, 'Weaning', 21, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-09-23 08:30:54', '2025-10-04 05:03:50', NULL),
(37, 5, 'Clear airways, ensure colostrum intake', 1, '2025-09-25', 1, '2025-09-25 00:00:00', NULL, NULL, ' - Auto-completed on due day 2025-09-25', '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(38, 5, 'Provide heat lamps', 1, '2025-09-25', 1, '2025-09-25 00:00:00', NULL, NULL, ' - Auto-completed on due day 2025-09-25', '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(39, 5, 'Remove afterbirth', 1, '2025-09-25', 1, '2025-09-25 00:00:00', NULL, NULL, ' - Auto-completed on due day 2025-09-25', '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(40, 5, 'Iron injections', 2, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(41, 5, 'Ear notching/tagging', 2, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(42, 5, 'Tail docking', 3, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(43, 5, 'Castration (males)', 3, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(44, 5, 'Start creep feed', 14, '2025-10-08', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(45, 5, 'Weaning', 21, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:32', '2025-10-04 05:03:50', NULL),
(46, 6, 'Clear airways, ensure colostrum intake', 1, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(47, 6, 'Provide heat lamps', 1, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(48, 6, 'Remove afterbirth', 1, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(49, 6, 'Iron injections', 2, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(50, 6, 'Ear notching/tagging', 2, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(51, 6, 'Tail docking', 3, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(52, 6, 'Castration (males)', 3, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(53, 6, 'Start creep feed', 14, '2025-10-08', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(54, 6, 'Weaning', 21, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-09-24 07:33:52', '2025-10-04 05:03:50', NULL),
(55, 7, 'Clear airways, ensure colostrum intake', 1, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(56, 7, 'Provide heat lamps', 1, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(57, 7, 'Remove afterbirth', 1, '2025-09-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(58, 7, 'Iron injections', 2, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(59, 7, 'Ear notching/tagging', 2, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(60, 7, 'Tail docking', 3, '2025-09-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(61, 7, 'Castration (males)', 3, '2025-09-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(62, 7, 'Start creep feed', 14, '2025-10-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(63, 7, 'Weaning', 21, '2025-10-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 03:13:52', '2025-10-04 05:03:50', NULL),
(64, 11, 'Clear airways, ensure colostrum intake', 1, '2025-08-29', 1, '2025-10-04 00:00:00', NULL, NULL, 'TEST', '2025-09-25 15:52:38', '2025-10-04 05:04:08', 9),
(65, 11, 'Provide heat lamps', 1, '2025-08-29', 1, '2025-10-04 00:00:00', NULL, NULL, 'G', '2025-09-25 15:52:38', '2025-10-04 06:20:48', 9),
(66, 11, 'Remove afterbirth', 1, '2025-08-29', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:05', 9),
(67, 11, 'Iron injections', 2, '2025-08-30', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:14', 9),
(68, 11, 'Ear notching/tagging', 2, '2025-08-30', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:22', 9),
(69, 11, 'Tail docking', 3, '2025-08-31', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:27', 9),
(70, 11, 'Castration (males)', 3, '2025-08-31', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:41', 9),
(71, 11, 'Start creep feed', 14, '2025-09-11', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-25 15:52:38', '2025-10-04 06:21:48', 9),
(72, 11, 'Weaning', 21, '2025-09-18', 1, '2025-10-04 00:00:00', 3.00, '2025-10-04 09:21:00', '3', '2025-09-25 15:52:38', '2025-10-04 06:22:00', 9),
(73, 12, 'Clear airways, ensure colostrum intake', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(74, 12, 'Provide heat lamps', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(75, 12, 'Remove afterbirth', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(76, 12, 'Iron injections', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(77, 12, 'Ear notching/tagging', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(78, 12, 'Tail docking', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(79, 12, 'Castration (males)', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(80, 12, 'Start creep feed', 14, '2025-08-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(81, 12, 'Weaning', 21, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:53:46', '2025-10-04 05:03:50', NULL),
(82, 13, 'Clear airways, ensure colostrum intake', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(83, 13, 'Provide heat lamps', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(84, 13, 'Remove afterbirth', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(85, 13, 'Iron injections', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(86, 13, 'Ear notching/tagging', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(87, 13, 'Tail docking', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(88, 13, 'Castration (males)', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(89, 13, 'Start creep feed', 14, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(90, 13, 'Weaning', 21, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:54:50', '2025-10-04 05:03:50', NULL),
(91, 14, 'Clear airways, ensure colostrum intake', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(92, 14, 'Provide heat lamps', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(93, 14, 'Remove afterbirth', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(94, 14, 'Iron injections', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(95, 14, 'Ear notching/tagging', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(96, 14, 'Tail docking', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(97, 14, 'Castration (males)', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(98, 14, 'Start creep feed', 14, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(99, 14, 'Weaning', 21, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:55:37', '2025-10-04 05:03:50', NULL),
(100, 15, 'Clear airways, ensure colostrum intake', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(101, 15, 'Provide heat lamps', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(102, 15, 'Remove afterbirth', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(103, 15, 'Iron injections', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(104, 15, 'Ear notching/tagging', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(105, 15, 'Tail docking', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(106, 15, 'Castration (males)', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(107, 15, 'Start creep feed', 14, '2025-09-23', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(108, 15, 'Weaning', 21, '2025-09-30', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:56:29', '2025-10-04 05:03:50', NULL),
(109, 16, 'Clear airways, ensure colostrum intake', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(110, 16, 'Provide heat lamps', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(111, 16, 'Remove afterbirth', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(112, 16, 'Iron injections', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(113, 16, 'Ear notching/tagging', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(114, 16, 'Tail docking', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(115, 16, 'Castration (males)', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(116, 16, 'Start creep feed', 14, '2025-09-23', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(117, 16, 'Weaning', 21, '2025-09-30', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:57:01', '2025-10-04 05:03:50', NULL),
(118, 17, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(119, 17, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(120, 17, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(121, 17, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(122, 17, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(123, 17, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(124, 17, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(125, 17, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(126, 17, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:01', '2025-10-04 05:03:50', NULL),
(127, 18, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(128, 18, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(129, 18, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(130, 18, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(131, 18, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(132, 18, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(133, 18, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(134, 18, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(135, 18, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-25 15:59:41', '2025-10-04 05:03:50', NULL),
(136, 19, 'Clear airways, ensure colostrum intake', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(137, 19, 'Provide heat lamps', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(138, 19, 'Remove afterbirth', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(139, 19, 'Iron injections', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(140, 19, 'Ear notching/tagging', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(141, 19, 'Tail docking', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(142, 19, 'Castration (males)', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(143, 19, 'Start creep feed', 14, '2025-09-21', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(144, 19, 'Weaning', 21, '2025-09-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:16', '2025-10-04 05:03:50', NULL),
(145, 20, 'Clear airways, ensure colostrum intake', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(146, 20, 'Provide heat lamps', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(147, 20, 'Remove afterbirth', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(148, 20, 'Iron injections', 2, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(149, 20, 'Ear notching/tagging', 2, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(150, 20, 'Tail docking', 3, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(151, 20, 'Castration (males)', 3, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(152, 20, 'Start creep feed', 14, '2025-08-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(153, 20, 'Weaning', 21, '2025-09-04', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:00:57', '2025-10-04 05:03:50', NULL),
(154, 21, 'Clear airways, ensure colostrum intake', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(155, 21, 'Provide heat lamps', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(156, 21, 'Remove afterbirth', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(157, 21, 'Iron injections', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(158, 21, 'Ear notching/tagging', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(159, 21, 'Tail docking', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(160, 21, 'Castration (males)', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(161, 21, 'Start creep feed', 14, '2025-08-27', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(162, 21, 'Weaning', 21, '2025-09-03', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:01:34', '2025-10-04 05:03:50', NULL),
(163, 22, 'Clear airways, ensure colostrum intake', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(164, 22, 'Provide heat lamps', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(165, 22, 'Remove afterbirth', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(166, 22, 'Iron injections', 2, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(167, 22, 'Ear notching/tagging', 2, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(168, 22, 'Tail docking', 3, '2025-08-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(169, 22, 'Castration (males)', 3, '2025-08-26', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(170, 22, 'Start creep feed', 14, '2025-09-06', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(171, 22, 'Weaning', 21, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:12', '2025-10-04 05:03:50', NULL),
(172, 23, 'Clear airways, ensure colostrum intake', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(173, 23, 'Provide heat lamps', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(174, 23, 'Remove afterbirth', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(175, 23, 'Iron injections', 2, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(176, 23, 'Ear notching/tagging', 2, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(177, 23, 'Tail docking', 3, '2025-09-14', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(178, 23, 'Castration (males)', 3, '2025-09-14', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(179, 23, 'Start creep feed', 14, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(180, 23, 'Weaning', 21, '2025-10-02', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:03:50', '2025-10-04 05:03:50', NULL),
(181, 24, 'Clear airways, ensure colostrum intake', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(182, 24, 'Provide heat lamps', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(183, 24, 'Remove afterbirth', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(184, 24, 'Iron injections', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(185, 24, 'Ear notching/tagging', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(186, 24, 'Tail docking', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(187, 24, 'Castration (males)', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(188, 24, 'Start creep feed', 14, '2025-09-21', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(189, 24, 'Weaning', 21, '2025-09-28', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:04:47', '2025-10-04 05:03:50', NULL),
(190, 25, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(191, 25, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(192, 25, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(193, 25, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(194, 25, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(195, 25, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(196, 25, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(197, 25, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(198, 25, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-25 16:05:40', '2025-10-04 05:03:50', NULL),
(199, 26, 'Clear airways, ensure colostrum intake', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(200, 26, 'Provide heat lamps', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(201, 26, 'Remove afterbirth', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(202, 26, 'Iron injections', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(203, 26, 'Ear notching/tagging', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(204, 26, 'Tail docking', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(205, 26, 'Castration (males)', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(206, 26, 'Start creep feed', 14, '2025-08-08', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(207, 26, 'Weaning', 21, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:00:38', '2025-10-04 05:03:50', NULL),
(208, 27, 'Clear airways, ensure colostrum intake', 1, '2025-08-09', 1, '2025-10-04 00:00:00', NULL, NULL, '', '2025-09-26 14:01:17', '2025-10-04 06:21:36', 9),
(209, 27, 'Provide heat lamps', 1, '2025-08-09', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(210, 27, 'Remove afterbirth', 1, '2025-08-09', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(211, 27, 'Iron injections', 2, '2025-08-10', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(212, 27, 'Ear notching/tagging', 2, '2025-08-10', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(213, 27, 'Tail docking', 3, '2025-08-11', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(214, 27, 'Castration (males)', 3, '2025-08-11', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(215, 27, 'Start creep feed', 14, '2025-08-22', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(216, 27, 'Weaning', 21, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:01:17', '2025-10-04 05:03:50', NULL),
(217, 28, 'Clear airways, ensure colostrum intake', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(218, 28, 'Provide heat lamps', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(219, 28, 'Remove afterbirth', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(220, 28, 'Iron injections', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(221, 28, 'Ear notching/tagging', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(222, 28, 'Tail docking', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(223, 28, 'Castration (males)', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(224, 28, 'Start creep feed', 14, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(225, 28, 'Weaning', 21, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-26 14:02:07', '2025-10-04 05:03:50', NULL),
(226, 29, 'Clear airways, ensure colostrum intake', 1, '2025-08-09', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:24:54', 9),
(227, 29, 'Provide heat lamps', 1, '2025-08-09', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:02', 9),
(228, 29, 'Remove afterbirth', 1, '2025-08-09', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:08', 9),
(229, 29, 'Iron injections', 2, '2025-08-10', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:13', 9),
(230, 29, 'Ear notching/tagging', 2, '2025-08-10', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:20', 9),
(231, 29, 'Tail docking', 3, '2025-08-11', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:26', 9),
(232, 29, 'Castration (males)', 3, '2025-08-11', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:32', 9),
(233, 29, 'Start creep feed', 14, '2025-08-22', 1, '2025-10-04 00:00:00', NULL, NULL, 'A', '2025-09-29 05:31:47', '2025-10-04 06:25:38', 9),
(234, 29, 'Weaning', 21, '2025-08-29', 1, '2025-10-04 00:00:00', 1.00, '2025-10-04 09:25:00', '2', '2025-09-29 05:31:47', '2025-10-04 06:25:50', 9),
(235, 30, 'Clear airways, ensure colostrum intake', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(236, 30, 'Provide heat lamps', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(237, 30, 'Remove afterbirth', 1, '2025-07-26', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(238, 30, 'Iron injections', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(239, 30, 'Ear notching/tagging', 2, '2025-07-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(240, 30, 'Tail docking', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(241, 30, 'Castration (males)', 3, '2025-07-28', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(242, 30, 'Start creep feed', 14, '2025-08-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(243, 30, 'Weaning', 21, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:32:51', '2025-10-04 05:03:50', NULL),
(244, 31, 'Clear airways, ensure colostrum intake', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(245, 31, 'Provide heat lamps', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(246, 31, 'Remove afterbirth', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(247, 31, 'Iron injections', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(248, 31, 'Ear notching/tagging', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(249, 31, 'Tail docking', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(250, 31, 'Castration (males)', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(251, 31, 'Start creep feed', 14, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(252, 31, 'Weaning', 21, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:33:48', '2025-10-04 05:03:50', NULL),
(253, 32, 'Clear airways, ensure colostrum intake', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(254, 32, 'Provide heat lamps', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(255, 32, 'Remove afterbirth', 1, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(256, 32, 'Iron injections', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(257, 32, 'Ear notching/tagging', 2, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(258, 32, 'Tail docking', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(259, 32, 'Castration (males)', 3, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(260, 32, 'Start creep feed', 14, '2025-08-29', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(261, 32, 'Weaning', 21, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:34:47', '2025-10-04 05:03:50', NULL),
(262, 33, 'Clear airways, ensure colostrum intake', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(263, 33, 'Provide heat lamps', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(264, 33, 'Remove afterbirth', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(265, 33, 'Iron injections', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(266, 33, 'Ear notching/tagging', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(267, 33, 'Tail docking', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(268, 33, 'Castration (males)', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(269, 33, 'Start creep feed', 14, '2025-09-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(270, 33, 'Weaning', 21, '2025-09-30', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:35:32', '2025-10-04 05:03:50', NULL),
(271, 34, 'Clear airways, ensure colostrum intake', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(272, 34, 'Provide heat lamps', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(273, 34, 'Remove afterbirth', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(274, 34, 'Iron injections', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(275, 34, 'Ear notching/tagging', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(276, 34, 'Tail docking', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(277, 34, 'Castration (males)', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(278, 34, 'Start creep feed', 14, '2025-09-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(279, 34, 'Weaning', 21, '2025-09-30', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:36:18', '2025-10-04 05:03:50', NULL),
(280, 35, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(281, 35, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(282, 35, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(283, 35, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(284, 35, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(285, 35, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(286, 35, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(287, 35, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(288, 35, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:37:17', '2025-10-04 05:03:50', NULL),
(289, 36, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(290, 36, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(291, 36, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(292, 36, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(293, 36, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(294, 36, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(295, 36, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(296, 36, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(297, 36, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:00', '2025-10-04 05:03:50', NULL),
(298, 37, 'Clear airways, ensure colostrum intake', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(299, 37, 'Provide heat lamps', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(300, 37, 'Remove afterbirth', 1, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(301, 37, 'Iron injections', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(302, 37, 'Ear notching/tagging', 2, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(303, 37, 'Tail docking', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(304, 37, 'Castration (males)', 3, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(305, 37, 'Start creep feed', 14, '2025-09-21', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(306, 37, 'Weaning', 21, '2025-09-28', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:38:44', '2025-10-04 05:03:50', NULL),
(307, 38, 'Clear airways, ensure colostrum intake', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(308, 38, 'Provide heat lamps', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(309, 38, 'Remove afterbirth', 1, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(310, 38, 'Iron injections', 2, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(311, 38, 'Ear notching/tagging', 2, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(312, 38, 'Tail docking', 3, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(313, 38, 'Castration (males)', 3, '2025-08-17', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(314, 38, 'Start creep feed', 14, '2025-08-28', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(315, 38, 'Weaning', 21, '2025-09-04', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:39:23', '2025-10-04 05:03:50', NULL),
(316, 39, 'Clear airways, ensure colostrum intake', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(317, 39, 'Provide heat lamps', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(318, 39, 'Remove afterbirth', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(319, 39, 'Iron injections', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(320, 39, 'Ear notching/tagging', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(321, 39, 'Tail docking', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(322, 39, 'Castration (males)', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(323, 39, 'Start creep feed', 14, '2025-08-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(324, 39, 'Weaning', 21, '2025-09-03', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:40:11', '2025-10-04 05:03:50', NULL),
(325, 40, 'Clear airways, ensure colostrum intake', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(326, 40, 'Provide heat lamps', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(327, 40, 'Remove afterbirth', 1, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(328, 40, 'Iron injections', 2, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(329, 40, 'Ear notching/tagging', 2, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(330, 40, 'Tail docking', 3, '2025-08-26', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(331, 40, 'Castration (males)', 3, '2025-08-26', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(332, 40, 'Start creep feed', 14, '2025-09-06', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(333, 40, 'Weaning', 21, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:41:37', '2025-10-04 05:03:50', NULL),
(334, 41, 'Clear airways, ensure colostrum intake', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(335, 41, 'Provide heat lamps', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(336, 41, 'Remove afterbirth', 1, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(337, 41, 'Iron injections', 2, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(338, 41, 'Ear notching/tagging', 2, '2025-09-13', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(339, 41, 'Tail docking', 3, '2025-09-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(340, 41, 'Castration (males)', 3, '2025-09-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(341, 41, 'Start creep feed', 14, '2025-09-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(342, 41, 'Weaning', 21, '2025-10-02', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:42:36', '2025-10-04 05:03:50', NULL),
(343, 42, 'Clear airways, ensure colostrum intake', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(344, 42, 'Provide heat lamps', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(345, 42, 'Remove afterbirth', 1, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(346, 42, 'Iron injections', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(347, 42, 'Ear notching/tagging', 2, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(348, 42, 'Tail docking', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(349, 42, 'Castration (males)', 3, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(350, 42, 'Start creep feed', 14, '2025-09-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(351, 42, 'Weaning', 21, '2025-09-30', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:43:17', '2025-10-04 05:03:50', NULL),
(352, 43, 'Clear airways, ensure colostrum intake', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(353, 43, 'Provide heat lamps', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(354, 43, 'Remove afterbirth', 1, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(355, 43, 'Iron injections', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(356, 43, 'Ear notching/tagging', 2, '2025-09-10', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(357, 43, 'Tail docking', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(358, 43, 'Castration (males)', 3, '2025-09-11', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(359, 43, 'Start creep feed', 14, '2025-09-22', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(360, 43, 'Weaning', 21, '2025-09-29', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:44:01', '2025-10-04 05:03:50', NULL),
(361, 44, 'Clear airways, ensure colostrum intake', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(362, 44, 'Provide heat lamps', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(363, 44, 'Remove afterbirth', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(364, 44, 'Iron injections', 2, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(365, 44, 'Ear notching/tagging', 2, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(366, 44, 'Tail docking', 3, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(367, 44, 'Castration (males)', 3, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(368, 44, 'Start creep feed', 14, '2025-09-20', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(369, 44, 'Weaning', 21, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:03', '2025-10-04 05:03:50', NULL),
(370, 45, 'Clear airways, ensure colostrum intake', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(371, 45, 'Provide heat lamps', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(372, 45, 'Remove afterbirth', 1, '2025-09-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(373, 45, 'Iron injections', 2, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(374, 45, 'Ear notching/tagging', 2, '2025-09-08', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(375, 45, 'Tail docking', 3, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(376, 45, 'Castration (males)', 3, '2025-09-09', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(377, 45, 'Start creep feed', 14, '2025-09-20', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(378, 45, 'Weaning', 21, '2025-09-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:45:36', '2025-10-04 05:03:50', NULL),
(379, 46, 'Clear airways, ensure colostrum intake', 1, '2025-08-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(380, 46, 'Provide heat lamps', 1, '2025-08-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(381, 46, 'Remove afterbirth', 1, '2025-08-23', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(382, 46, 'Iron injections', 2, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(383, 46, 'Ear notching/tagging', 2, '2025-08-24', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(384, 46, 'Tail docking', 3, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(385, 46, 'Castration (males)', 3, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(386, 46, 'Start creep feed', 14, '2025-09-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL),
(387, 46, 'Weaning', 21, '2025-09-12', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:46:30', '2025-10-04 05:03:50', NULL);
INSERT INTO `farrowing_activities` (`id`, `farrowing_record_id`, `activity_name`, `due_day`, `due_date`, `completed`, `completed_date`, `weaning_weight`, `weaning_date`, `notes`, `created_at`, `updated_at`, `completed_by`) VALUES
(388, 47, 'Clear airways, ensure colostrum intake', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(389, 47, 'Provide heat lamps', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(390, 47, 'Remove afterbirth', 1, '2025-08-14', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(391, 47, 'Iron injections', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(392, 47, 'Ear notching/tagging', 2, '2025-08-15', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(393, 47, 'Tail docking', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(394, 47, 'Castration (males)', 3, '2025-08-16', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(395, 47, 'Start creep feed', 14, '2025-08-27', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(396, 47, 'Weaning', 21, '2025-09-03', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:47:14', '2025-10-04 05:03:50', NULL),
(397, 48, 'Clear airways, ensure colostrum intake', 1, '2025-08-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(398, 48, 'Provide heat lamps', 1, '2025-08-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(399, 48, 'Remove afterbirth', 1, '2025-08-05', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(400, 48, 'Iron injections', 2, '2025-08-06', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(401, 48, 'Ear notching/tagging', 2, '2025-08-06', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(402, 48, 'Tail docking', 3, '2025-08-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(403, 48, 'Castration (males)', 3, '2025-08-07', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(404, 48, 'Start creep feed', 14, '2025-08-18', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(405, 48, 'Weaning', 21, '2025-08-25', 0, NULL, NULL, NULL, NULL, '2025-09-29 05:48:17', '2025-10-04 05:03:50', NULL),
(406, 49, 'Clear airways, ensure colostrum intake', 1, '2025-06-05', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(407, 49, 'Provide heat lamps', 1, '2025-06-05', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(408, 49, 'Remove afterbirth', 1, '2025-06-05', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(409, 49, 'Iron injections', 2, '2025-06-06', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(410, 49, 'Ear notching/tagging', 2, '2025-06-06', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(411, 49, 'Tail docking', 3, '2025-06-07', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(412, 49, 'Castration (males)', 3, '2025-06-07', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(413, 49, 'Start creep feed', 14, '2025-06-18', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(414, 49, 'Weaning', 21, '2025-06-25', 0, NULL, NULL, NULL, NULL, '2025-10-04 04:44:00', '2025-10-04 05:03:50', NULL),
(415, 50, 'Clear airways, ensure colostrum intake', 1, '2025-10-09', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(416, 50, 'Provide heat lamps', 1, '2025-10-09', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(417, 50, 'Remove afterbirth', 1, '2025-10-09', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(418, 50, 'Iron injections', 2, '2025-10-10', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(419, 50, 'Ear notching/tagging', 2, '2025-10-10', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(420, 50, 'Tail docking', 3, '2025-10-11', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(421, 50, 'Castration (males)', 3, '2025-10-11', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(422, 50, 'Start creep feed', 14, '2025-10-22', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(423, 50, 'Weaning', 21, '2025-10-29', 0, NULL, NULL, NULL, NULL, '2025-10-08 01:04:09', '2025-10-08 01:04:09', NULL),
(424, 51, 'Clear airways, ensure colostrum intake', 1, '2025-10-13', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(425, 51, 'Provide heat lamps', 1, '2025-10-13', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(426, 51, 'Remove afterbirth', 1, '2025-10-13', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(427, 51, 'Iron injections', 2, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(428, 51, 'Ear notching/tagging', 2, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(429, 51, 'Tail docking', 3, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(430, 51, 'Castration (males)', 3, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(431, 51, 'Start creep feed', 14, '2025-10-26', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(432, 51, 'Weaning', 21, '2025-11-02', 0, NULL, NULL, NULL, NULL, '2025-10-12 17:54:57', '2025-10-12 17:54:57', NULL),
(433, 52, 'Clear airways, ensure colostrum intake', 1, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(434, 52, 'Provide heat lamps', 1, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(435, 52, 'Remove afterbirth', 1, '2025-10-14', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(436, 52, 'Iron injections', 2, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(437, 52, 'Ear notching/tagging', 2, '2025-10-15', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(438, 52, 'Tail docking', 3, '2025-10-16', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(439, 52, 'Castration (males)', 3, '2025-10-16', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(440, 52, 'Start creep feed', 14, '2025-10-27', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(441, 52, 'Weaning', 21, '2025-11-03', 0, NULL, NULL, NULL, NULL, '2025-10-13 10:58:43', '2025-10-13 10:58:43', NULL),
(442, 53, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(443, 53, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(444, 53, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(445, 53, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(446, 53, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(447, 53, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(448, 53, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(449, 53, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(450, 53, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:45:24', '2025-11-09 11:45:24', NULL),
(451, 54, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(452, 54, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(453, 54, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(454, 54, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(455, 54, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(456, 54, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(457, 54, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(458, 54, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(459, 54, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:46:24', '2025-11-09 11:46:24', NULL),
(460, 55, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(461, 55, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(462, 55, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(463, 55, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(464, 55, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(465, 55, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(466, 55, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(467, 55, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(468, 55, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:52:51', '2025-11-09 11:52:51', NULL),
(469, 56, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(470, 56, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(471, 56, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(472, 56, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(473, 56, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(474, 56, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(475, 56, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(476, 56, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(477, 56, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:53:30', '2025-11-09 11:53:30', NULL),
(478, 57, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(479, 57, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(480, 57, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(481, 57, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(482, 57, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(483, 57, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(484, 57, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(485, 57, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(486, 57, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:11', '2025-11-09 11:54:11', NULL),
(487, 58, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(488, 58, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(489, 58, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(490, 58, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(491, 58, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(492, 58, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(493, 58, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(494, 58, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(495, 58, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:54:51', '2025-11-09 11:54:51', NULL),
(496, 59, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(497, 59, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(498, 59, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(499, 59, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(500, 59, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(501, 59, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(502, 59, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(503, 59, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(504, 59, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:55:28', '2025-11-09 11:55:28', NULL),
(505, 60, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(506, 60, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(507, 60, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(508, 60, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(509, 60, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(510, 60, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(511, 60, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(512, 60, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(513, 60, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:06', '2025-11-09 11:56:06', NULL),
(514, 61, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(515, 61, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(516, 61, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(517, 61, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(518, 61, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(519, 61, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(520, 61, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(521, 61, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(522, 61, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:56:38', '2025-11-09 11:56:38', NULL),
(523, 62, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(524, 62, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(525, 62, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(526, 62, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(527, 62, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(528, 62, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(529, 62, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(530, 62, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(531, 62, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:10', '2025-11-09 11:57:10', NULL),
(532, 63, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(533, 63, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(534, 63, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(535, 63, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(536, 63, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(537, 63, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(538, 63, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(539, 63, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(540, 63, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:57:53', '2025-11-09 11:57:53', NULL),
(541, 64, 'Clear airways, ensure colostrum intake', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(542, 64, 'Provide heat lamps', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(543, 64, 'Remove afterbirth', 1, '2025-11-10', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(544, 64, 'Iron injections', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(545, 64, 'Ear notching/tagging', 2, '2025-11-11', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(546, 64, 'Tail docking', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(547, 64, 'Castration (males)', 3, '2025-11-12', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(548, 64, 'Start creep feed', 14, '2025-11-23', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(549, 64, 'Weaning', 21, '2025-11-30', 0, NULL, NULL, NULL, NULL, '2025-11-09 11:58:21', '2025-11-09 11:58:21', NULL),
(550, 65, 'Clear airways, ensure colostrum intake', 1, '2025-11-14', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(551, 65, 'Provide heat lamps', 1, '2025-11-14', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(552, 65, 'Remove afterbirth', 1, '2025-11-14', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(553, 65, 'Iron injections', 2, '2025-11-15', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(554, 65, 'Ear notching/tagging', 2, '2025-11-15', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(555, 65, 'Tail docking', 3, '2025-11-16', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(556, 65, 'Castration (males)', 3, '2025-11-16', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(557, 65, 'Start creep feed', 14, '2025-11-27', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL),
(558, 65, 'Weaning', 21, '2025-12-04', 0, NULL, NULL, NULL, NULL, '2025-11-13 09:22:04', '2025-11-13 09:22:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `farrowing_records`
--

CREATE TABLE `farrowing_records` (
  `id` int(11) NOT NULL,
  `breeding_id` int(11) NOT NULL,
  `farrowing_date` date NOT NULL,
  `alive_piglets` int(11) NOT NULL,
  `still_births` int(11) NOT NULL,
  `avg_weight` decimal(5,2) NOT NULL,
  `health_notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `dead_piglets` int(11) DEFAULT 0,
  `weak_piglets` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farrowing_records`
--

INSERT INTO `farrowing_records` (`id`, `breeding_id`, `farrowing_date`, `alive_piglets`, `still_births`, `avg_weight`, `health_notes`, `created_by`, `created_at`, `dead_piglets`, `weak_piglets`, `notes`, `updated_at`) VALUES
(53, 77, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:45:24', 0, 0, NULL, '2025-11-09 11:45:24'),
(54, 76, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:46:24', 0, 0, NULL, '2025-11-09 11:46:24'),
(55, 74, '2025-11-09', 9, 0, 1.50, NULL, 10, '2025-11-09 11:52:51', 0, 0, NULL, '2025-11-09 11:52:51'),
(56, 72, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:53:30', 0, 0, NULL, '2025-11-09 11:53:30'),
(57, 75, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:54:11', 0, 0, NULL, '2025-11-09 11:54:11'),
(58, 73, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:54:51', 0, 0, NULL, '2025-11-09 11:54:51'),
(59, 71, '2025-11-09', 11, 0, 1.50, NULL, 10, '2025-11-09 11:55:28', 0, 0, NULL, '2025-11-09 11:55:28'),
(60, 70, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:56:06', 0, 0, NULL, '2025-11-09 11:56:06'),
(61, 69, '2025-11-09', 11, 0, 1.50, NULL, 10, '2025-11-09 11:56:38', 0, 0, NULL, '2025-11-09 11:56:38'),
(62, 68, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:57:10', 0, 0, NULL, '2025-11-09 11:57:10'),
(63, 67, '2025-11-09', 10, 0, 1.50, NULL, 10, '2025-11-09 11:57:53', 0, 0, NULL, '2025-11-09 11:57:53'),
(64, 66, '2025-11-09', 11, 0, 1.50, NULL, 10, '2025-11-09 11:58:21', 0, 0, NULL, '2025-11-09 11:58:21'),
(65, 77, '2025-11-13', 10, 0, 1.00, NULL, 9, '2025-11-13 09:22:04', 0, 0, NULL, '2025-11-13 09:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `farrowing_records_edit_history`
--

CREATE TABLE `farrowing_records_edit_history` (
  `id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `litters`
--

CREATE TABLE `litters` (
  `id` int(11) NOT NULL,
  `litter_id` varchar(20) NOT NULL,
  `farrowing_record_id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `boar_id` int(11) DEFAULT NULL,
  `farrowing_date` date NOT NULL,
  `total_piglets` int(11) NOT NULL,
  `alive_piglets` int(11) NOT NULL,
  `still_births` int(11) DEFAULT 0,
  `avg_weight` decimal(5,2) DEFAULT NULL,
  `weaning_weight` decimal(5,2) DEFAULT NULL,
  `weaning_date` date DEFAULT NULL,
  `status` enum('unweaned','weaned','sold','deceased','dead','slaughtered') DEFAULT 'unweaned',
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `litters`
--

INSERT INTO `litters` (`id`, `litter_id`, `farrowing_record_id`, `sow_id`, `boar_id`, `farrowing_date`, `total_piglets`, `alive_piglets`, `still_births`, `avg_weight`, `weaning_weight`, `weaning_date`, `status`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(53, 'L001', 53, 168, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:45:24', '2025-11-09 11:45:24'),
(54, 'L002', 54, 158, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:46:24', '2025-11-09 11:46:24'),
(55, 'L003', 55, 173, 144, '2025-11-09', 9, 9, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:52:51', '2025-11-09 11:52:51'),
(56, 'L004', 56, 157, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:53:30', '2025-11-09 11:53:30'),
(57, 'L005', 57, 133, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:54:11', '2025-11-09 11:54:11'),
(58, 'L006', 58, 148, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:54:51', '2025-11-09 11:54:51'),
(59, 'L007', 59, 147, 144, '2025-11-09', 11, 11, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:55:28', '2025-11-09 11:55:28'),
(60, 'L008', 60, 163, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:56:06', '2025-11-09 11:56:06'),
(61, 'L009', 61, 151, 144, '2025-11-09', 11, 11, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:56:38', '2025-11-09 11:56:38'),
(62, 'L010', 62, 150, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:57:10', '2025-11-09 11:57:10'),
(63, 'L011', 63, 155, 144, '2025-11-09', 10, 10, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:57:53', '2025-11-09 11:57:53'),
(64, 'L012', 64, 156, 144, '2025-11-09', 11, 11, 0, 1.50, NULL, NULL, 'unweaned', NULL, 10, '2025-11-09 11:58:21', '2025-11-09 11:58:21'),
(65, 'L013', 65, 168, 144, '2025-11-13', 10, 10, 0, 1.00, NULL, NULL, 'unweaned', NULL, 9, '2025-11-13 09:22:04', '2025-11-13 09:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `milk_production`
--

CREATE TABLE `milk_production` (
  `id` int(11) NOT NULL,
  `cow_id` int(11) NOT NULL,
  `production_date` date NOT NULL,
  `milking_session` enum('morning','afternoon','evening') NOT NULL,
  `milk_quantity` decimal(10,2) NOT NULL,
  `fat_percentage` decimal(5,2) DEFAULT NULL,
  `protein_percentage` decimal(5,2) DEFAULT NULL,
  `milk_grade` varchar(50) DEFAULT NULL,
  `milk_quality_assessment` enum('good_quality','moderate_quality','poor_quality') DEFAULT 'moderate_quality',
  `additional_notes` text DEFAULT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `milk_production`
--

INSERT INTO `milk_production` (`id`, `cow_id`, `production_date`, `milking_session`, `milk_quantity`, `fat_percentage`, `protein_percentage`, `milk_grade`, `milk_quality_assessment`, `additional_notes`, `recorded_by`, `created_at`) VALUES
(2, 4, '2025-08-01', 'morning', 8.00, 0.00, 0.00, NULL, 'good_quality', '', 10, '2025-09-30 09:28:29'),
(3, 4, '2025-08-02', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:29:20'),
(4, 4, '2025-08-03', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:30:06'),
(5, 4, '2025-08-04', 'morning', 7.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:31:00'),
(6, 4, '2025-08-05', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:32:07'),
(7, 4, '2025-08-07', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:32:56'),
(8, 4, '2025-08-08', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:33:57'),
(9, 4, '2025-08-09', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:34:32'),
(10, 4, '2025-08-09', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:35:14'),
(11, 4, '2025-08-10', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:36:14'),
(12, 4, '2025-08-11', 'morning', 7.00, 0.00, 0.00, NULL, 'good_quality', '', 10, '2025-09-30 09:36:50'),
(13, 4, '2025-08-12', 'morning', 6.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:38:46'),
(14, 4, '2025-08-13', 'morning', 6.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:39:18'),
(15, 4, '2025-09-14', 'morning', 6.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:41:01'),
(16, 4, '2025-08-15', 'morning', 6.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:41:49'),
(17, 4, '2025-08-16', 'morning', 6.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:42:22'),
(18, 4, '2025-08-17', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:42:57'),
(19, 5, '2025-08-18', 'morning', 4.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:43:29'),
(20, 4, '2025-07-19', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:44:09'),
(21, 4, '2025-08-20', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:45:04'),
(22, 4, '2025-09-21', 'morning', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:47:21'),
(23, 4, '2025-08-22', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:47:58'),
(24, 4, '2025-08-23', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:48:47'),
(25, 4, '2025-09-23', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 10, '2025-09-30 09:49:55'),
(26, 9, '2025-10-13', 'morning', 9.00, 5.00, 5.00, NULL, 'moderate_quality', NULL, 9, '2025-10-13 05:41:15'),
(27, 16, '2025-10-13', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:43:25'),
(28, 16, '2025-10-13', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:43:46'),
(29, 18, '2025-10-13', 'morning', 7.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:44:12'),
(30, 18, '2025-10-13', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:44:34'),
(31, 15, '2025-10-13', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:44:54'),
(32, 15, '2025-10-13', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:45:29'),
(33, 16, '2025-10-14', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:46:13'),
(34, 16, '2025-10-14', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:46:35'),
(35, 18, '2025-10-14', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:46:59'),
(36, 18, '2025-10-14', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:47:21'),
(37, 15, '2025-10-14', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:47:46'),
(38, 15, '2025-10-14', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:48:07'),
(39, 16, '2025-10-15', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:48:36'),
(40, 16, '2025-10-15', 'evening', 1.20, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:48:55'),
(41, 18, '2025-10-15', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:49:17'),
(42, 18, '2025-10-15', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:49:37'),
(43, 15, '2025-10-15', 'morning', 5.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:49:58'),
(44, 15, '2025-10-15', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:50:20'),
(45, 16, '2025-10-16', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:50:43'),
(46, 16, '2025-10-16', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:51:00'),
(47, 18, '2025-10-16', 'morning', 7.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:51:18'),
(48, 18, '2025-10-16', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:51:39'),
(49, 15, '2025-10-16', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:51:59'),
(50, 15, '2025-10-16', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-17 04:52:20'),
(51, 16, '2025-10-17', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:48:20'),
(52, 16, '2025-10-17', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:48:41'),
(53, 18, '2025-10-17', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:49:09'),
(54, 18, '2025-10-17', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:49:31'),
(55, 15, '2025-10-17', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:50:02'),
(56, 15, '2025-10-17', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:50:27'),
(57, 16, '2025-10-18', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:51:07'),
(58, 16, '2025-10-18', 'evening', 1.60, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:51:28'),
(59, 18, '2025-10-18', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:51:55'),
(60, 18, '2025-10-18', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:52:17'),
(61, 15, '2025-10-18', 'morning', 5.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:52:43'),
(62, 15, '2025-10-18', 'evening', 2.40, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-19 04:53:05'),
(63, 16, '2025-10-19', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:38:21'),
(64, 16, '2025-10-19', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:38:48'),
(65, 18, '2025-10-19', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:39:21'),
(66, 18, '2025-10-19', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:39:45'),
(67, 15, '2025-10-19', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:40:15'),
(68, 15, '2025-10-19', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:40:36'),
(69, 16, '2025-10-20', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:41:07'),
(70, 16, '2025-10-20', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:41:27'),
(71, 18, '2025-10-20', 'morning', 7.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:41:57'),
(72, 18, '2025-10-20', 'evening', 4.70, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:42:21'),
(73, 15, '2025-10-20', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:42:45'),
(74, 15, '2025-10-20', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:43:05'),
(75, 16, '2025-10-21', 'morning', 2.70, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:43:41'),
(76, 16, '2025-10-21', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:43:56'),
(77, 18, '2025-10-21', 'morning', 7.80, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:44:39'),
(78, 18, '2025-10-21', 'evening', 4.70, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:44:58'),
(79, 15, '2025-10-21', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:45:16'),
(80, 15, '2025-10-21', 'evening', 2.70, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-21 16:45:35'),
(81, 16, '2025-10-26', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:54:42'),
(82, 16, '2025-10-26', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:55:06'),
(83, 18, '2025-10-26', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:56:01'),
(84, 18, '2025-10-26', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:56:21'),
(85, 15, '2025-10-26', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:56:43'),
(86, 15, '2025-10-26', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:57:03'),
(87, 16, '2025-10-27', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:57:28'),
(88, 16, '2025-10-27', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:57:54'),
(89, 18, '2025-10-27', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:58:10'),
(90, 18, '2025-10-27', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:58:28'),
(91, 15, '2025-10-27', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:58:50'),
(92, 15, '2025-10-27', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:59:07'),
(93, 16, '2025-10-28', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:59:30'),
(94, 16, '2025-10-28', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 15:59:53'),
(95, 18, '2025-10-28', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:00:13'),
(96, 18, '2025-10-28', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:00:32'),
(97, 15, '2025-10-28', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:00:59'),
(98, 15, '2025-10-28', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:01:18'),
(99, 16, '2025-10-29', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:01:43'),
(100, 16, '2025-10-29', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:02:03'),
(101, 18, '2025-10-29', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:02:19'),
(102, 18, '2025-10-29', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:02:37'),
(103, 15, '2025-10-29', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:02:58'),
(104, 15, '2025-10-29', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:03:15'),
(105, 16, '2025-10-30', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:03:53'),
(106, 16, '2025-10-30', 'evening', 1.90, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:04:10'),
(107, 18, '2025-10-30', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:04:27'),
(108, 18, '2025-10-30', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:04:45'),
(109, 15, '2025-10-30', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:05:04'),
(110, 15, '2025-10-30', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-10-31 16:05:21'),
(111, 16, '2025-10-31', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:02:52'),
(112, 16, '2025-10-31', 'evening', 1.30, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:03:24'),
(113, 18, '2025-10-31', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:03:46'),
(114, 18, '2025-11-05', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:04:10'),
(115, 15, '2025-10-31', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:04:39'),
(116, 15, '2025-10-31', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:05:02'),
(117, 16, '2025-11-01', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:05:28'),
(118, 16, '2025-11-01', 'evening', 1.30, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:05:51'),
(119, 18, '2025-11-01', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:06:12'),
(120, 18, '2025-11-01', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:06:37'),
(121, 15, '2025-11-01', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:06:56'),
(122, 15, '2025-11-01', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:07:14'),
(123, 16, '2025-11-02', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:07:37'),
(124, 16, '2025-11-02', 'evening', 1.30, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:07:58'),
(125, 18, '2025-11-02', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:08:23'),
(126, 18, '2025-11-02', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:08:50'),
(127, 15, '2025-11-02', 'morning', 4.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:09:07'),
(128, 15, '2025-11-02', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:09:28'),
(129, 16, '2025-11-03', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:09:55'),
(130, 16, '2025-11-03', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:10:16'),
(131, 18, '2025-11-03', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:10:36'),
(132, 18, '2025-11-03', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:10:55'),
(133, 15, '2025-11-03', 'morning', 5.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:11:17'),
(134, 15, '2025-11-03', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-05 14:11:39'),
(135, 16, '2025-11-04', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:47:25'),
(136, 16, '2025-11-04', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:47:45'),
(137, 18, '2025-11-04', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:48:10'),
(138, 18, '2025-11-04', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:48:33'),
(139, 15, '2025-11-04', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:48:50'),
(140, 15, '2025-11-04', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:49:09'),
(141, 16, '2025-11-05', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:49:31'),
(142, 16, '2025-11-05', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:49:49'),
(143, 18, '2025-11-05', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:50:09'),
(144, 18, '2025-11-05', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:50:31'),
(145, 15, '2025-11-05', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:50:59'),
(146, 15, '2025-11-05', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:51:17'),
(147, 16, '2025-11-06', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:51:39'),
(148, 16, '2025-11-06', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:51:59'),
(149, 18, '2025-11-06', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:52:21'),
(150, 18, '2025-11-06', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:52:40'),
(151, 15, '2025-11-06', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:53:05'),
(152, 15, '2025-11-06', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:53:23'),
(153, 16, '2025-11-07', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:53:51'),
(154, 16, '2025-11-07', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:54:09'),
(155, 18, '2025-11-07', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:54:38'),
(156, 18, '2025-11-07', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:55:00'),
(157, 18, '2025-11-07', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:55:25'),
(158, 15, '2025-11-07', 'evening', 4.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:55:47'),
(159, 15, '2025-11-07', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-08 11:56:13'),
(160, 16, '2025-11-08', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:52:37'),
(161, 16, '2025-11-08', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:52:57'),
(162, 18, '2025-11-08', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:53:14'),
(163, 18, '2025-11-08', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:53:34'),
(164, 15, '2025-11-08', 'morning', 5.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:53:53'),
(165, 15, '2025-11-08', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:54:11'),
(166, 16, '2025-11-09', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:54:35'),
(167, 16, '2025-11-09', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:54:51'),
(168, 18, '2025-11-09', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:55:13'),
(169, 18, '2025-11-09', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:55:33'),
(170, 15, '2025-11-09', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:55:56'),
(171, 15, '2025-11-09', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:56:13'),
(172, 16, '2025-11-10', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:56:32'),
(173, 16, '2025-11-10', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:56:48'),
(174, 18, '2025-11-10', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:57:02'),
(175, 18, '2025-11-10', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:57:21'),
(176, 15, '2025-11-10', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:57:36'),
(177, 15, '2025-11-10', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-10 07:57:49'),
(178, 16, '2025-11-11', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:34:49'),
(179, 16, '2025-11-11', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:35:05'),
(180, 18, '2025-11-11', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:35:25'),
(181, 18, '2025-11-11', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:35:42'),
(182, 15, '2025-11-11', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:35:59'),
(183, 15, '2025-11-11', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:36:14'),
(184, 16, '2025-11-12', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:36:37'),
(185, 16, '2025-11-12', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:36:54'),
(186, 18, '2025-11-12', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:37:11'),
(187, 18, '2025-11-12', 'evening', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:37:27'),
(188, 15, '2025-11-12', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:37:52'),
(189, 15, '2025-11-12', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:38:11'),
(190, 16, '2025-11-13', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:38:35'),
(191, 16, '2025-11-13', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:38:53'),
(192, 18, '2025-11-13', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:39:15'),
(193, 18, '2025-11-13', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:39:33'),
(194, 15, '2025-11-13', 'morning', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:39:57'),
(195, 15, '2025-11-13', 'evening', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:40:14'),
(196, 16, '2025-11-14', 'morning', 2.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:40:34'),
(197, 16, '2025-11-14', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:40:50'),
(198, 18, '2025-11-14', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:41:07'),
(199, 18, '2025-11-14', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:41:25'),
(200, 15, '2025-11-14', 'morning', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:41:44'),
(201, 15, '2025-11-14', 'evening', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-15 05:42:01'),
(202, 16, '2025-11-15', 'morning', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:07:09'),
(203, 16, '2025-11-15', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:07:26'),
(204, 18, '2025-11-15', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:07:45'),
(205, 18, '2025-11-15', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:08:08'),
(206, 15, '2025-11-15', 'morning', 3.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:08:33'),
(207, 15, '2025-11-15', 'evening', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:08:56'),
(208, 16, '2025-11-16', 'morning', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:09:17'),
(209, 16, '2025-11-16', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:09:35'),
(210, 18, '2025-11-16', 'morning', 8.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:09:55'),
(211, 18, '2025-11-16', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:10:15'),
(212, 15, '2025-11-16', 'morning', 2.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:10:35'),
(213, 15, '2025-11-16', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:10:53'),
(214, 16, '2025-11-17', 'morning', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:11:19'),
(215, 16, '2025-11-17', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:11:40'),
(216, 18, '2025-11-17', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:12:02'),
(217, 18, '2025-11-17', 'evening', 3.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:12:24'),
(218, 15, '2025-11-17', 'morning', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:12:44'),
(219, 15, '2025-11-17', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:13:08'),
(220, 16, '2025-11-18', 'morning', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:13:39'),
(221, 16, '2025-11-18', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:13:53'),
(222, 18, '2025-11-18', 'morning', 7.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:14:09'),
(223, 18, '2025-11-18', 'evening', 4.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:14:28'),
(224, 15, '2025-11-18', 'morning', 1.50, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:14:45'),
(225, 15, '2025-11-18', 'evening', 1.00, 0.00, 0.00, NULL, 'moderate_quality', '', 9, '2025-11-18 15:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `milk_production_edit_history`
--

CREATE TABLE `milk_production_edit_history` (
  `id` int(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `milk_production_edit_history`
--

INSERT INTO `milk_production_edit_history` (`id`, `production_id`, `field_name`, `old_value`, `new_value`, `edited_by`, `edited_at`) VALUES
(1, 26, 'milk_quantity', '10.00', '9', 9, '2025-10-13 05:48:54'),
(2, 26, 'fat_percentage', '5.00', '5', 9, '2025-10-13 05:48:54'),
(3, 26, 'protein_percentage', '5.00', '5', 9, '2025-10-13 05:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `milk_sales_usage`
--

CREATE TABLE `milk_sales_usage` (
  `id` int(11) NOT NULL,
  `transaction_type` enum('sale','usage') NOT NULL,
  `transaction_date` date NOT NULL,
  `buyer` varchar(255) DEFAULT NULL,
  `quantity_sold` decimal(10,2) DEFAULT NULL,
  `price_per_liter` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `quantity_used` decimal(10,2) DEFAULT NULL,
  `purpose_of_use` enum('calf_feeding','home_consumption','processing','wastage_spoiled') DEFAULT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `milk_sales_usage`
--

INSERT INTO `milk_sales_usage` (`id`, `transaction_type`, `transaction_date`, `buyer`, `quantity_sold`, `price_per_liter`, `total_amount`, `quantity_used`, `purpose_of_use`, `recorded_by`, `created_at`) VALUES
(1, 'sale', '2025-10-26', 'Meru', 0.00, 0.00, 0.00, 0.00, '', 10, '2025-10-13 16:32:37'),
(2, 'sale', '2025-10-13', 'DAIRY', 4.50, 50.00, 225.00, 0.00, '', 9, '2025-10-17 04:38:44'),
(3, 'sale', '2025-10-13', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-17 04:39:14'),
(4, 'sale', '2025-10-14', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-10-17 04:39:38'),
(5, 'sale', '2025-10-14', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-10-17 04:40:03'),
(6, 'sale', '2025-10-15', 'DAIRY', 0.00, 50.00, 0.00, 0.00, '', 9, '2025-10-17 04:40:25'),
(7, 'sale', '2025-10-15', 'HOTEL ', 20.00, 60.00, 1200.00, 0.00, '', 9, '2025-10-17 04:40:46'),
(8, 'sale', '2025-10-16', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-10-17 04:41:11'),
(9, 'sale', '2025-10-16', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-17 04:41:38'),
(10, 'sale', '2025-10-17', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-17 04:42:31'),
(11, 'sale', '2025-10-17', 'DAIRY', 4.50, 50.00, 225.00, 0.00, '', 9, '2025-10-19 05:01:33'),
(12, 'sale', '2025-10-17', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-19 05:01:59'),
(13, 'sale', '2025-10-18', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-10-19 05:03:46'),
(14, 'sale', '2025-10-18', 'HOTEL ', 16.50, 60.00, 990.00, 0.00, '', 9, '2025-10-19 05:04:21'),
(15, 'usage', '2025-10-15', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-19 05:05:33'),
(16, 'usage', '2025-10-16', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-19 05:05:53'),
(17, 'usage', '2025-10-17', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-19 05:06:07'),
(18, 'usage', '2025-10-18', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-19 05:06:27'),
(19, 'usage', '2025-10-19', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-19 05:06:43'),
(20, 'sale', '2025-10-19', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-10-21 05:35:23'),
(21, 'sale', '2025-10-19', 'HOTEL ', 16.00, 60.00, 960.00, 0.00, '', 9, '2025-10-21 05:35:47'),
(22, 'sale', '2025-10-20', 'DAIRY', 4.00, 50.00, 200.00, 0.00, '', 9, '2025-10-21 05:36:22'),
(23, 'sale', '2025-10-20', 'HOTEL ', 60.00, 0.00, 0.00, 0.00, '', 9, '2025-10-21 05:36:49'),
(24, 'usage', '2025-10-19', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-21 05:37:26'),
(25, 'usage', '2025-10-20', '', 0.00, 0.00, 0.00, 0.50, 'calf_feeding', 9, '2025-10-21 05:38:08'),
(26, 'sale', '2025-10-27', 'HOTEL ', 16.00, 60.00, 960.00, 0.00, '', 9, '2025-10-31 15:47:02'),
(27, 'sale', '2025-10-27', 'DAIRY', 5.30, 0.00, 0.00, 0.00, '', 9, '2025-10-31 15:47:36'),
(28, 'sale', '2025-10-26', 'HOTEL ', 15.50, 60.00, 930.00, 0.00, '', 9, '2025-10-31 15:48:45'),
(29, 'sale', '2025-10-26', 'DAIRY', 50.00, 0.00, 0.00, 0.00, '', 9, '2025-10-31 15:49:14'),
(30, 'sale', '2025-10-28', 'HOTEL ', 15.50, 60.00, 930.00, 0.00, '', 9, '2025-10-31 15:50:10'),
(31, 'sale', '2025-10-28', 'DAIRY', 5.50, 50.00, 275.00, 0.00, '', 9, '2025-10-31 15:50:33'),
(32, 'sale', '2025-10-29', 'HOTEL ', 15.50, 60.00, 930.00, 0.00, '', 9, '2025-10-31 15:51:02'),
(33, 'sale', '2025-10-29', 'DAIRY', 5.50, 50.00, 275.00, 0.00, '', 9, '2025-10-31 15:51:27'),
(34, 'sale', '2025-10-30', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-31 15:52:04'),
(35, 'sale', '2025-10-30', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-10-31 15:52:27'),
(36, 'sale', '2025-10-31', 'HOTEL ', 15.00, 60.00, 900.00, 0.00, '', 9, '2025-10-31 15:52:50'),
(37, 'usage', '2025-10-31', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:07:34'),
(38, 'usage', '2025-10-30', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:07:50'),
(39, 'usage', '2025-10-30', '', 0.00, 0.00, 0.00, 1.00, 'calf_feeding', 9, '2025-10-31 16:08:12'),
(40, 'usage', '2025-10-29', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:08:44'),
(41, 'usage', '2025-10-28', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:08:58'),
(42, 'usage', '2025-10-28', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:09:11'),
(43, 'usage', '2025-10-27', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:09:25'),
(44, 'usage', '2025-10-26', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-10-31 16:09:42'),
(45, 'sale', '2025-10-31', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-11-05 13:56:30'),
(46, 'sale', '2025-11-01', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-11-05 13:57:09'),
(47, 'sale', '2025-11-01', 'DAIRY', 6.30, 50.00, 315.00, 0.00, '', 9, '2025-11-05 13:57:38'),
(48, 'sale', '2025-11-02', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-11-05 13:58:01'),
(49, 'sale', '2025-11-02', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-11-05 13:58:24'),
(50, 'sale', '2025-11-03', 'HOTEL ', 16.00, 60.00, 960.00, 0.00, '', 9, '2025-11-05 13:58:46'),
(51, 'sale', '2025-11-03', 'DAIRY', 0.00, 0.00, 0.00, 0.00, '', 9, '2025-11-05 13:59:18'),
(52, 'usage', '2025-11-03', '', 0.00, 0.00, 0.00, 8.50, 'home_consumption', 9, '2025-11-05 14:00:00'),
(53, 'usage', '2025-11-02', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-05 14:00:22'),
(54, 'usage', '2025-11-01', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-05 14:00:48'),
(55, 'usage', '2025-11-04', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-05 14:01:13'),
(56, 'usage', '2025-11-04', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-08 11:57:03'),
(57, 'usage', '2025-11-05', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-08 11:57:18'),
(58, 'usage', '2025-11-06', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-08 11:57:42'),
(59, 'usage', '2025-11-07', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-08 11:58:02'),
(60, 'usage', '2025-11-08', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-08 11:58:21'),
(61, 'sale', '2025-11-04', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-11-08 11:58:48'),
(62, 'sale', '2025-11-04', 'DAIRY', 6.30, 50.00, 315.00, 0.00, '', 9, '2025-11-08 11:59:12'),
(63, 'sale', '2025-11-05', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-11-08 11:59:36'),
(64, 'sale', '2025-11-05', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-11-08 12:00:12'),
(65, 'sale', '2025-11-06', 'HOTEL ', 16.00, 60.00, 960.00, 0.00, '', 9, '2025-11-08 12:00:37'),
(66, 'usage', '2025-11-06', '', 0.00, 0.00, 0.00, 5.80, 'home_consumption', 9, '2025-11-08 12:01:10'),
(67, 'sale', '2025-11-07', 'HOTEL ', 14.50, 60.00, 870.00, 0.00, '', 9, '2025-11-08 12:01:40'),
(68, 'sale', '2025-11-07', 'DAIRY', 5.30, 50.00, 265.00, 0.00, '', 9, '2025-11-08 12:02:13'),
(69, 'sale', '2025-11-08', 'HOTEL ', 14.00, 60.00, 840.00, 0.00, '', 9, '2025-11-10 07:58:26'),
(70, 'sale', '2025-11-08', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-10 07:58:45'),
(71, 'sale', '2025-11-09', 'HOTEL ', 14.00, 60.00, 840.00, 0.00, '', 9, '2025-11-10 07:59:13'),
(72, 'sale', '2025-11-09', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-10 07:59:34'),
(73, 'sale', '2025-11-10', 'HOTEL ', 14.00, 60.00, 840.00, 0.00, '', 9, '2025-11-10 07:59:52'),
(74, 'sale', '2025-11-10', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-10 08:00:16'),
(75, 'usage', '2025-11-10', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-10 08:00:30'),
(76, 'usage', '2025-11-09', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-10 08:00:44'),
(77, 'sale', '2025-11-11', 'HOTEL ', 12.00, 60.00, 720.00, 0.00, '', 9, '2025-11-15 05:42:36'),
(78, 'sale', '2025-11-11', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-15 05:42:53'),
(79, 'sale', '2025-11-12', 'HOTEL ', 14.00, 60.00, 840.00, 0.00, '', 9, '2025-11-15 05:43:12'),
(80, 'sale', '2025-11-12', 'DAIRY', 5.00, 60.00, 300.00, 0.00, '', 9, '2025-11-15 05:43:29'),
(81, 'sale', '2025-11-13', 'HOTEL ', 14.00, 60.00, 840.00, 0.00, '', 9, '2025-11-15 05:44:04'),
(82, 'sale', '2025-11-13', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-15 05:44:23'),
(83, 'sale', '2025-11-14', 'HOTEL ', 12.50, 60.00, 750.00, 0.00, '', 9, '2025-11-15 05:44:57'),
(84, 'sale', '2025-11-14', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-15 05:45:25'),
(85, 'usage', '2025-11-15', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-15 05:45:52'),
(86, 'usage', '2025-11-14', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-15 05:46:05'),
(87, 'usage', '2025-11-12', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-15 05:46:31'),
(88, 'usage', '2025-11-11', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-15 05:46:46'),
(89, 'usage', '2025-11-13', '', 0.00, 0.00, 0.00, 3.00, 'home_consumption', 9, '2025-11-15 05:47:02'),
(90, 'sale', '2025-11-15', 'HOTEL ', 12.00, 60.00, 720.00, 0.00, '', 9, '2025-11-18 15:04:10'),
(91, 'sale', '2025-11-15', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-18 15:04:31'),
(92, 'sale', '2025-11-16', 'DAIRY', 5.00, 50.00, 250.00, 0.00, '', 9, '2025-11-18 15:04:48'),
(93, 'sale', '2025-11-16', 'HOTEL ', 12.00, 60.00, 720.00, 0.00, '', 9, '2025-11-18 15:05:09'),
(94, 'sale', '2025-11-17', 'DAIRY', 4.00, 50.00, 200.00, 0.00, '', 9, '2025-11-18 15:05:30'),
(95, 'sale', '2025-11-17', 'HOTEL ', 10.00, 60.00, 600.00, 0.00, '', 9, '2025-11-18 15:05:50'),
(96, 'sale', '2025-11-18', 'HOTEL ', 10.00, 60.00, 600.00, 0.00, '', 9, '2025-11-18 15:06:15'),
(97, 'sale', '2025-11-18', 'DAIRY', 4.00, 50.00, 200.00, 0.00, '', 9, '2025-11-18 15:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `pigs`
--

CREATE TABLE `pigs` (
  `id` int(11) NOT NULL,
  `tag_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `farm_id` int(11) NOT NULL,
  `pig_type` enum('grown_pig','piglet','litter','batch') NOT NULL,
  `pig_source` enum('born','purchased') NOT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `purpose` enum('breeding','meat') DEFAULT NULL,
  `breeding_status` enum('young','available','served','pregnant','farrowed') DEFAULT 'young',
  `birth_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `age_days` int(11) DEFAULT NULL,
  `registered_by` int(11) NOT NULL,
  `status` enum('active','sold','deceased','transferred','dead','slaughtered') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_edited` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pigs`
--

INSERT INTO `pigs` (`id`, `tag_id`, `name`, `farm_id`, `pig_type`, `pig_source`, `breed`, `gender`, `purpose`, `breeding_status`, `birth_date`, `purchase_date`, `age_days`, `registered_by`, `status`, `created_at`, `updated_at`, `is_edited`) VALUES
(107, 'P001', NULL, 2, 'grown_pig', 'born', 'LANDRACE', 'male', 'breeding', 'young', '2025-10-05', NULL, 45, 9, 'active', '2025-10-24 06:52:43', '2025-11-19 08:31:23', 0),
(108, 'EP037', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:23:23', '2025-11-19 08:31:23', 1),
(109, 'EP032', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:29:52', '2025-11-19 08:31:23', 1),
(110, 'EP045', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2022-10-29', NULL, 1117, 9, 'active', '2025-10-29 08:31:01', '2025-11-19 08:31:23', 1),
(111, 'P005', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:37:26', '2025-11-19 08:31:23', 0),
(112, 'EP003', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:38:07', '2025-11-19 08:31:23', 1),
(113, 'EP002', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:38:53', '2025-11-19 08:31:23', 1),
(114, 'EP004', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:40:25', '2025-11-19 08:31:23', 1),
(115, 'EP062', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:41:10', '2025-11-19 08:31:23', 1),
(116, 'EP049', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:42:09', '2025-11-19 08:31:23', 1),
(117, 'EP029', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:42:42', '2025-11-19 08:31:23', 1),
(118, 'EP056', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:43:19', '2025-11-19 08:31:23', 1),
(119, 'EP077', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:43:53', '2025-11-19 08:31:23', 1),
(120, 'EP048', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:44:44', '2025-11-19 08:31:23', 1),
(121, 'EP099', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:45:19', '2025-11-19 08:31:23', 1),
(122, 'P016', NULL, 2, 'grown_pig', 'purchased', 'Large white ', 'male', 'breeding', 'available', '2022-10-29', '2023-10-29', 1117, 9, 'active', '2025-10-29 08:48:43', '2025-11-19 08:31:23', 0),
(123, 'EP093', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:50:55', '2025-11-19 08:31:23', 1),
(124, 'EP031', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:51:37', '2025-11-19 08:31:23', 1),
(125, 'EP021', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-29', NULL, 386, 9, 'active', '2025-10-29 08:52:25', '2025-11-19 08:31:23', 1),
(126, 'P020', NULL, 2, 'grown_pig', 'purchased', 'Duroc', 'male', 'breeding', 'available', '2023-10-29', '2023-10-29', 752, 9, 'active', '2025-10-29 08:53:53', '2025-11-19 08:31:23', 0),
(127, 'EP080', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:55:49', '2025-11-19 08:31:23', 1),
(128, 'EP026', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:55:50', '2025-11-19 08:31:23', 1),
(131, 'EP076', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:55:51', '2025-11-19 08:31:23', 1),
(132, 'EP091', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-29', NULL, 752, 9, 'active', '2025-10-29 08:55:51', '2025-11-19 08:31:23', 1),
(133, 'EP071', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 04:58:42', '2025-11-19 08:31:23', 1),
(134, 'P026', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:00:40', '2025-11-19 08:31:23', 0),
(135, 'EP025', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:02:06', '2025-11-19 08:31:23', 1),
(136, 'EP082', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:04:13', '2025-11-19 08:31:23', 1),
(137, 'EP011', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:06:30', '2025-11-19 08:31:23', 1),
(138, 'EP020', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:07:42', '2025-11-19 08:31:23', 1),
(139, 'EP079', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:08:11', '2025-11-19 08:31:23', 1),
(140, 'EP081', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:09:59', '2025-11-19 08:31:23', 1),
(141, 'EP086', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:10:38', '2025-11-19 08:31:23', 1),
(142, 'EP087', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:11:08', '2025-11-19 08:31:23', 1),
(143, 'P035', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:12:35', '2025-11-19 08:31:23', 1),
(144, 'EP636', NULL, 2, 'grown_pig', 'born', 'Maxgrox', 'male', 'breeding', 'available', '2023-10-31', NULL, 750, 9, 'active', '2025-10-31 05:13:30', '2025-11-19 08:31:23', 1),
(145, 'EP030', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:15:20', '2025-11-19 08:31:23', 1),
(146, 'EP034', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:15:54', '2025-11-19 08:31:23', 1),
(147, 'EP014', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:17:51', '2025-11-19 08:31:23', 1),
(148, 'EP044', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:17:59', '2025-11-19 08:31:23', 1),
(150, 'EP015', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:18:00', '2025-11-19 08:31:23', 1),
(151, 'EP016', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:19:39', '2025-11-19 08:31:23', 1),
(152, 'EP094', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:20:40', '2025-11-19 08:31:23', 1),
(153, 'EP033', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:21:17', '2025-11-19 08:31:23', 1),
(154, 'P045', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:22:13', '2025-11-19 08:31:23', 0),
(155, 'EP010', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:22:54', '2025-11-19 08:31:23', 1),
(156, 'EP013', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:23:25', '2025-11-19 08:31:23', 1),
(157, 'EP024', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:24:54', '2025-11-19 08:31:23', 1),
(158, 'EP078', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:25:29', '2025-11-19 08:31:23', 1),
(159, 'EP083', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:26:10', '2025-11-19 08:31:23', 1),
(160, 'EP085', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:27:08', '2025-11-19 08:31:23', 1),
(161, 'EP060', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-31', NULL, 750, 9, 'active', '2025-10-31 05:28:59', '2025-11-19 08:31:23', 1),
(162, 'EP007', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:31:58', '2025-11-19 08:31:23', 1),
(163, 'EP018', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:32:40', '2025-11-19 08:31:23', 1),
(164, 'EP012', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:34:01', '2025-11-19 08:31:23', 1),
(165, 'EP075', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2023-10-31', NULL, 750, 9, 'active', '2025-10-31 05:35:19', '2025-11-19 08:31:23', 1),
(166, 'EP022', NULL, 2, 'grown_pig', 'born', 'Duroc', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:36:01', '2025-11-19 08:31:23', 1),
(167, 'EP084', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:37:35', '2025-11-19 08:31:23', 1),
(168, 'EP088', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2023-10-31', NULL, 750, 9, 'active', '2025-10-31 05:38:39', '2025-11-19 08:31:23', 1),
(169, 'EP063', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:46:39', '2025-11-19 08:31:23', 1),
(170, 'EP064', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:51:26', '2025-11-19 08:31:23', 1),
(171, 'EP065', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:51:53', '2025-11-19 08:31:23', 1),
(172, 'EP066', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 05:54:09', '2025-11-19 08:31:23', 1),
(173, 'EP067', NULL, 2, 'grown_pig', 'born', 'Large white ', 'female', 'breeding', 'available', '2024-10-31', NULL, 384, 9, 'active', '2025-10-31 06:14:07', '2025-11-19 08:31:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale_records`
--

CREATE TABLE `sale_records` (
  `id` int(11) NOT NULL,
  `pig_id` int(11) DEFAULT NULL,
  `litter_id` int(11) DEFAULT NULL,
  `pig_type` enum('grown_pig','litter') NOT NULL,
  `sale_date` date NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_contact` varchar(50) DEFAULT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `total_revenue` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `pigs_count` int(11) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_records_edit_history`
--

CREATE TABLE `sale_records_edit_history` (
  `id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slaughter_records`
--

CREATE TABLE `slaughter_records` (
  `id` int(11) NOT NULL,
  `pig_id` int(11) DEFAULT NULL,
  `litter_id` int(11) DEFAULT NULL,
  `pig_type` enum('grown_pig','litter') NOT NULL,
  `slaughter_date` date NOT NULL,
  `live_weight` decimal(8,2) NOT NULL,
  `carcass_weight` decimal(8,2) NOT NULL,
  `dressing_percentage` decimal(5,2) NOT NULL,
  `meat_grade` enum('premium','grade_a','grade_b','grade_c','standard') NOT NULL,
  `price_per_kg` decimal(8,2) NOT NULL,
  `total_revenue` decimal(10,2) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `pigs_count` int(11) DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slaughter_records_edit_history`
--

CREATE TABLE `slaughter_records_edit_history` (
  `id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_records`
--

CREATE TABLE `vaccination_records` (
  `id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `animal_type` enum('pig','litter') NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `completed_date` date NOT NULL,
  `completion_notes` text DEFAULT NULL,
  `completed_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_schedule`
--

CREATE TABLE `vaccination_schedule` (
  `id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `day_description` varchar(100) DEFAULT NULL,
  `reason` text NOT NULL,
  `medicine_activity` text NOT NULL,
  `dosage_amount` varchar(100) DEFAULT NULL,
  `interval_duration` varchar(100) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `medicine_image` varchar(255) DEFAULT NULL,
  `animal_image` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vaccination_schedule`
--

INSERT INTO `vaccination_schedule` (`id`, `day_number`, `day_description`, `reason`, `medicine_activity`, `dosage_amount`, `interval_duration`, `additional_notes`, `medicine_image`, `animal_image`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 0, 'Birth', 'Prevent anemia, boost immunity. Iron deficiency is common in piglets and can lead to poor growth and development.', 'Iron injection; ensure colostrum intake. Administer 200mg iron dextran injection intramuscularly.', '200mg', 'Single dose', 'Critical for piglet survival. Monitor for injection site reactions.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(2, 3, 'Early development', 'Early disease protection. Young piglets are highly susceptible to respiratory diseases.', 'Mycoplasma hyopneumoniae (optional), PCV2 (some products). Administer according to farm-specific protocols.', '2ml', 'Single dose or as per protocol', 'Optional based on farm disease history and veterinary recommendation.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(3, 14, '2 weeks', 'Build early immunity. This is the optimal time to establish immunity against common pig diseases.', 'PCV2 (circovirus) - 1st dose; Mycoplasma - 1st dose. Administer 2ml intramuscularly in the neck region.', '2ml', 'First of two doses', 'Ensure piglets are healthy before vaccination. Monitor for any adverse reactions.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(4, 21, '3 weeks', 'Boost immunity at weaning. Weaning is a stressful period that can compromise immunity.', 'PRRS (if farm affected), Erysipelas (optional start). Administer according to farm PRRS status.', '2ml', 'As per farm protocol', 'PRRS vaccination depends on farm status. Consult with veterinarian for specific recommendations.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(5, 28, '4 weeks', 'Reinforce protection. Booster vaccinations ensure adequate immunity levels are maintained.', 'Booster: PCV2, Mycoplasma. Second dose of PCV2 and Mycoplasma vaccines to ensure complete immunity.', '2ml', 'Booster dose', 'Complete the vaccination series started at 2 weeks of age.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(6, 35, '5 weeks', 'Respiratory & gut disease prevention. Growing pigs are susceptible to respiratory and gastrointestinal diseases.', 'Swine influenza, Salmonella, Glässer\'s disease (risk-based). Administer based on farm disease history.', '2ml', 'Single dose or as needed', 'Risk-based vaccination. Consider farm history and seasonal disease patterns.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(7, 56, '8 weeks', 'Maintain health as pigs grow. Continued protection against diseases that can affect growing pigs.', 'Erysipelas booster, influenza booster (if needed). Administer 2ml intramuscularly in the neck region.', '2ml', 'Booster doses', 'Monitor for any signs of disease before vaccination.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(8, 90, '12 weeks', 'Grower stage - finishers. Protection during the finishing phase to ensure optimal growth.', 'Optional boosters (farm dependent). Administer based on farm-specific protocols and disease pressure.', '2ml', 'As needed', 'Farm-dependent vaccination. Consult with veterinarian for specific recommendations.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(9, 150, '5 months', 'Slaughter age - keep pigs healthy. Final protection before slaughter to ensure food safety.', 'Optional: Erysipelas / Salmonella booster (if outbreaks). Administer only if disease outbreaks occur.', '2ml', 'Emergency vaccination', 'Only if disease outbreaks occur. Consult with veterinarian immediately.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(10, 180, '6 months (Breeding)', 'Protect fertility & reproduction. Breeding animals require specific vaccinations.', 'Parvovirus, Leptospira, Erysipelas (before mating). Administer 2-4 weeks before breeding.', '2ml', 'Pre-breeding vaccination', 'Critical for reproductive health. Ensure vaccination before first breeding.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17'),
(11, 240, 'Pregnancy (3-5 weeks before farrowing)', 'Protect piglets via colostrum. Maternal vaccination provides passive immunity to piglets.', 'Vaccinate against E. coli, Clostridium perfringens, Rotavirus. Administer 3-5 weeks before expected farrowing.', '2ml', 'Pre-farrowing vaccination', 'Critical for piglet survival. Ensure adequate time for immunity development before farrowing.', NULL, NULL, 7, '2025-10-04 04:40:17', '2025-10-04 04:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `weight_categories`
--

CREATE TABLE `weight_categories` (
  `id` int(11) NOT NULL,
  `start_age` int(11) NOT NULL,
  `end_age` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `min_weight` decimal(5,2) NOT NULL,
  `max_weight` decimal(5,2) NOT NULL,
  `daily_gain` decimal(4,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weight_categories`
--

INSERT INTO `weight_categories` (`id`, `start_age`, `end_age`, `category_name`, `min_weight`, `max_weight`, `daily_gain`, `created_by`, `created_at`, `updated_at`) VALUES
(85, 1, 7, 'Neonatal', 1.50, 2.00, 0.09, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39'),
(86, 8, 28, 'Pre-weaning', 2.20, 8.50, 0.31, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39'),
(87, 29, 56, 'Nursery', 9.10, 25.00, 0.59, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39'),
(88, 57, 84, 'Grower', 25.70, 45.00, 0.71, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39'),
(89, 85, 140, 'Finisher', 45.70, 85.00, 0.71, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39'),
(90, 141, 180, 'Late Finisher', 85.50, 110.00, 0.63, 7, '2025-09-24 10:25:39', '2025-09-24 10:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `weight_records`
--

CREATE TABLE `weight_records` (
  `id` int(11) NOT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `litter_id` int(11) DEFAULT NULL,
  `weight` decimal(8,2) NOT NULL,
  `expected_weight` decimal(8,2) DEFAULT NULL,
  `weight_type` enum('actual','expected') DEFAULT 'actual',
  `weighing_date` date NOT NULL,
  `weighing_time` time DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weight_settings`
--

CREATE TABLE `weight_settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` enum('text','number','boolean','json') DEFAULT 'text',
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weight_settings`
--

INSERT INTO `weight_settings` (`id`, `setting_name`, `setting_value`, `setting_type`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'weight_unit', 'kg', 'text', 'Default weight unit for tracking', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12'),
(2, 'weighing_frequency', 'biweekly', 'text', 'How often pigs should be weighed', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12'),
(3, 'alert_threshold', '10', 'number', 'Weight change threshold for alerts (%)', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12'),
(4, 'auto_calculate', 'true', 'boolean', 'Automatically calculate growth rates', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12'),
(5, 'weight_loss_alerts', 'true', 'boolean', 'Send alerts for weight loss', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12'),
(6, 'data_export', 'false', 'boolean', 'Enable automatic data export', 9, '2025-09-24 10:02:55', '2025-10-13 08:29:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `breeding_records`
--
ALTER TABLE `breeding_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`sow_id`),
  ADD KEY `boar_id` (`boar_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `calves`
--
ALTER TABLE `calves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `calf_id` (`calf_id`),
  ADD KEY `dam_id` (`dam_id`),
  ADD KEY `sire_id` (`sire_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `chickens`
--
ALTER TABLE `chickens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chicken_id` (`chicken_id`),
  ADD KEY `idx_chicken_id` (`chicken_id`),
  ADD KEY `idx_chicken_type` (`chicken_type`),
  ADD KEY `idx_batch_name` (`batch_name`),
  ADD KEY `idx_coop_number` (`coop_number`),
  ADD KEY `idx_current_status` (`current_status`);

--
-- Indexes for table `chicken_meat_production`
--
ALTER TABLE `chicken_meat_production`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_id` (`production_id`);

--
-- Indexes for table `chicken_medications`
--
ALTER TABLE `chicken_medications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_medication_name` (`medication_name`);

--
-- Indexes for table `chicken_medication_tracking`
--
ALTER TABLE `chicken_medication_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chicken_id` (`chicken_id`),
  ADD KEY `idx_medication_id` (`medication_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_scheduled_date` (`scheduled_date`);

--
-- Indexes for table `chicken_production`
--
ALTER TABLE `chicken_production`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chicken_id` (`chicken_id`),
  ADD KEY `idx_production_date` (`production_date`),
  ADD KEY `idx_production_type` (`production_type`);

--
-- Indexes for table `chicken_production_audit`
--
ALTER TABLE `chicken_production_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_production_id` (`production_id`),
  ADD KEY `idx_chicken_id` (`chicken_id`),
  ADD KEY `idx_edited_at` (`edited_at`);

--
-- Indexes for table `chicken_stages`
--
ALTER TABLE `chicken_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_stage_name` (`stage_name`);

--
-- Indexes for table `chicken_weight_standards`
--
ALTER TABLE `chicken_weight_standards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_category_age` (`category`,`age_days`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_age_days` (`age_days`);

--
-- Indexes for table `chicken_weight_tracking`
--
ALTER TABLE `chicken_weight_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chicken_id` (`chicken_id`),
  ADD KEY `idx_weight_standard_id` (`weight_standard_id`),
  ADD KEY `idx_checked_at` (`checked_at`);

--
-- Indexes for table `cows`
--
ALTER TABLE `cows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ear_tag` (`ear_tag`),
  ADD KEY `registered_by` (`registered_by`);

--
-- Indexes for table `cow_breeding`
--
ALTER TABLE `cow_breeding`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dam_id` (`dam_id`),
  ADD KEY `sire_id` (`sire_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `cow_edit_history`
--
ALTER TABLE `cow_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cow_id` (`cow_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `dead_pigs`
--
ALTER TABLE `dead_pigs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pig_id` (`pig_id`),
  ADD KEY `litter_id` (`litter_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `death_records_edit_history`
--
ALTER TABLE `death_records_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD KEY `idx_employees_code` (`employee_code`),
  ADD KEY `idx_employees_email` (`email`),
  ADD KEY `idx_employees_status` (`status`),
  ADD KEY `idx_employees_role` (`role`);

--
-- Indexes for table `failed_conceptions`
--
ALTER TABLE `failed_conceptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sow_id` (`sow_id`),
  ADD KEY `boar_id` (`boar_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `farm_name` (`farm_name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `farrowing_activities`
--
ALTER TABLE `farrowing_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farrowing_record_id` (`farrowing_record_id`),
  ADD KEY `fk_farrowing_activities_completed_by` (`completed_by`);

--
-- Indexes for table `farrowing_records`
--
ALTER TABLE `farrowing_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breeding_id` (`breeding_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `farrowing_records_edit_history`
--
ALTER TABLE `farrowing_records_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `litters`
--
ALTER TABLE `litters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `litter_id` (`litter_id`),
  ADD KEY `farrowing_record_id` (`farrowing_record_id`),
  ADD KEY `sow_id` (`sow_id`),
  ADD KEY `boar_id` (`boar_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `milk_production`
--
ALTER TABLE `milk_production`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cow_id` (`cow_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `milk_production_edit_history`
--
ALTER TABLE `milk_production_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_id` (`production_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `milk_sales_usage`
--
ALTER TABLE `milk_sales_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `pigs`
--
ALTER TABLE `pigs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_id` (`tag_id`),
  ADD KEY `farm_id` (`farm_id`),
  ADD KEY `registered_by` (`registered_by`);

--
-- Indexes for table `sale_records`
--
ALTER TABLE `sale_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pig_id` (`pig_id`),
  ADD KEY `litter_id` (`litter_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `sale_records_edit_history`
--
ALTER TABLE `sale_records_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `slaughter_records`
--
ALTER TABLE `slaughter_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pig_id` (`pig_id`),
  ADD KEY `litter_id` (`litter_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `slaughter_records_edit_history`
--
ALTER TABLE `slaughter_records_edit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `vaccination_records`
--
ALTER TABLE `vaccination_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `completed_by` (`completed_by`);

--
-- Indexes for table `vaccination_schedule`
--
ALTER TABLE `vaccination_schedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `day_number` (`day_number`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `weight_categories`
--
ALTER TABLE `weight_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `weight_records`
--
ALTER TABLE `weight_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `litter_id` (`litter_id`);

--
-- Indexes for table `weight_settings`
--
ALTER TABLE `weight_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_setting` (`setting_name`),
  ADD KEY `created_by` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT for table `breeding_records`
--
ALTER TABLE `breeding_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `calves`
--
ALTER TABLE `calves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chickens`
--
ALTER TABLE `chickens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chicken_meat_production`
--
ALTER TABLE `chicken_meat_production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chicken_medications`
--
ALTER TABLE `chicken_medications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chicken_medication_tracking`
--
ALTER TABLE `chicken_medication_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chicken_production`
--
ALTER TABLE `chicken_production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chicken_production_audit`
--
ALTER TABLE `chicken_production_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chicken_stages`
--
ALTER TABLE `chicken_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chicken_weight_standards`
--
ALTER TABLE `chicken_weight_standards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chicken_weight_tracking`
--
ALTER TABLE `chicken_weight_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cows`
--
ALTER TABLE `cows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cow_breeding`
--
ALTER TABLE `cow_breeding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cow_edit_history`
--
ALTER TABLE `cow_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dead_pigs`
--
ALTER TABLE `dead_pigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `death_records_edit_history`
--
ALTER TABLE `death_records_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_conceptions`
--
ALTER TABLE `failed_conceptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `farms`
--
ALTER TABLE `farms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `farrowing_activities`
--
ALTER TABLE `farrowing_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=559;

--
-- AUTO_INCREMENT for table `farrowing_records`
--
ALTER TABLE `farrowing_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `farrowing_records_edit_history`
--
ALTER TABLE `farrowing_records_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `litters`
--
ALTER TABLE `litters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `milk_production`
--
ALTER TABLE `milk_production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `milk_production_edit_history`
--
ALTER TABLE `milk_production_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `milk_sales_usage`
--
ALTER TABLE `milk_sales_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `pigs`
--
ALTER TABLE `pigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `sale_records`
--
ALTER TABLE `sale_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_records_edit_history`
--
ALTER TABLE `sale_records_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slaughter_records`
--
ALTER TABLE `slaughter_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slaughter_records_edit_history`
--
ALTER TABLE `slaughter_records_edit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vaccination_records`
--
ALTER TABLE `vaccination_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccination_schedule`
--
ALTER TABLE `vaccination_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `weight_categories`
--
ALTER TABLE `weight_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `weight_records`
--
ALTER TABLE `weight_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weight_settings`
--
ALTER TABLE `weight_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `breeding_records`
--
ALTER TABLE `breeding_records`
  ADD CONSTRAINT `breeding_records_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `breeding_records_ibfk_2` FOREIGN KEY (`boar_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `breeding_records_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `chicken_meat_production`
--
ALTER TABLE `chicken_meat_production`
  ADD CONSTRAINT `chicken_meat_production_ibfk_1` FOREIGN KEY (`production_id`) REFERENCES `chicken_production` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chicken_medication_tracking`
--
ALTER TABLE `chicken_medication_tracking`
  ADD CONSTRAINT `chicken_medication_tracking_ibfk_1` FOREIGN KEY (`medication_id`) REFERENCES `chicken_medications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dead_pigs`
--
ALTER TABLE `dead_pigs`
  ADD CONSTRAINT `dead_pigs_ibfk_1` FOREIGN KEY (`pig_id`) REFERENCES `pigs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dead_pigs_ibfk_2` FOREIGN KEY (`litter_id`) REFERENCES `litters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dead_pigs_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `death_records_edit_history`
--
ALTER TABLE `death_records_edit_history`
  ADD CONSTRAINT `death_records_edit_history_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `dead_pigs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `death_records_edit_history_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `failed_conceptions`
--
ALTER TABLE `failed_conceptions`
  ADD CONSTRAINT `failed_conceptions_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `failed_conceptions_ibfk_2` FOREIGN KEY (`boar_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `failed_conceptions_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `farms`
--
ALTER TABLE `farms`
  ADD CONSTRAINT `farms_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `farrowing_records`
--
ALTER TABLE `farrowing_records`
  ADD CONSTRAINT `farrowing_records_ibfk_1` FOREIGN KEY (`breeding_id`) REFERENCES `breeding_records` (`id`),
  ADD CONSTRAINT `farrowing_records_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `farrowing_records_edit_history`
--
ALTER TABLE `farrowing_records_edit_history`
  ADD CONSTRAINT `farrowing_records_edit_history_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `farrowing_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `farrowing_records_edit_history_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `litters`
--
ALTER TABLE `litters`
  ADD CONSTRAINT `litters_ibfk_1` FOREIGN KEY (`farrowing_record_id`) REFERENCES `farrowing_records` (`id`),
  ADD CONSTRAINT `litters_ibfk_2` FOREIGN KEY (`sow_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `litters_ibfk_3` FOREIGN KEY (`boar_id`) REFERENCES `pigs` (`id`),
  ADD CONSTRAINT `litters_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `milk_production_edit_history`
--
ALTER TABLE `milk_production_edit_history`
  ADD CONSTRAINT `milk_production_edit_history_ibfk_1` FOREIGN KEY (`production_id`) REFERENCES `milk_production` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `milk_production_edit_history_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `pigs`
--
ALTER TABLE `pigs`
  ADD CONSTRAINT `pigs_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`),
  ADD CONSTRAINT `pigs_ibfk_2` FOREIGN KEY (`registered_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `sale_records`
--
ALTER TABLE `sale_records`
  ADD CONSTRAINT `sale_records_ibfk_1` FOREIGN KEY (`pig_id`) REFERENCES `pigs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_records_ibfk_2` FOREIGN KEY (`litter_id`) REFERENCES `litters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_records_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `sale_records_edit_history`
--
ALTER TABLE `sale_records_edit_history`
  ADD CONSTRAINT `sale_records_edit_history_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `sale_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_records_edit_history_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `slaughter_records`
--
ALTER TABLE `slaughter_records`
  ADD CONSTRAINT `slaughter_records_ibfk_1` FOREIGN KEY (`pig_id`) REFERENCES `pigs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `slaughter_records_ibfk_2` FOREIGN KEY (`litter_id`) REFERENCES `litters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `slaughter_records_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `slaughter_records_edit_history`
--
ALTER TABLE `slaughter_records_edit_history`
  ADD CONSTRAINT `slaughter_records_edit_history_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `slaughter_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `slaughter_records_edit_history_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `weight_categories`
--
ALTER TABLE `weight_categories`
  ADD CONSTRAINT `weight_categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `weight_records`
--
ALTER TABLE `weight_records`
  ADD CONSTRAINT `weight_records_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `pigs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `weight_records_ibfk_2` FOREIGN KEY (`litter_id`) REFERENCES `litters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weight_settings`
--
ALTER TABLE `weight_settings`
  ADD CONSTRAINT `weight_settings_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
