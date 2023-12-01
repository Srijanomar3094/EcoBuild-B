-- phpMyAdmin SQL Dump
-- version 5.2.1-1.fc38
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2023 at 01:27 PM
-- Server version: 10.5.22-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CRP2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add doctor_ details', 7, 'add_doctor_details'),
(26, 'Can change doctor_ details', 7, 'change_doctor_details'),
(27, 'Can delete doctor_ details', 7, 'delete_doctor_details'),
(28, 'Can view doctor_ details', 7, 'view_doctor_details'),
(29, 'Can add doctor department', 8, 'add_doctordepartment'),
(30, 'Can change doctor department', 8, 'change_doctordepartment'),
(31, 'Can delete doctor department', 8, 'delete_doctordepartment'),
(32, 'Can view doctor department', 8, 'view_doctordepartment'),
(33, 'Can add home page_ fields', 9, 'add_homepage_fields'),
(34, 'Can change home page_ fields', 9, 'change_homepage_fields'),
(35, 'Can delete home page_ fields', 9, 'delete_homepage_fields'),
(36, 'Can view home page_ fields', 9, 'view_homepage_fields'),
(37, 'Can add patient_ appointments', 10, 'add_patient_appointments'),
(38, 'Can change patient_ appointments', 10, 'change_patient_appointments'),
(39, 'Can delete patient_ appointments', 10, 'delete_patient_appointments'),
(40, 'Can view patient_ appointments', 10, 'view_patient_appointments'),
(41, 'Can add patient_ details', 11, 'add_patient_details'),
(42, 'Can change patient_ details', 11, 'change_patient_details'),
(43, 'Can delete patient_ details', 11, 'delete_patient_details'),
(44, 'Can view patient_ details', 11, 'view_patient_details'),
(45, 'Can add user_ role', 12, 'add_user_role'),
(46, 'Can change user_ role', 12, 'change_user_role'),
(47, 'Can delete user_ role', 12, 'delete_user_role'),
(48, 'Can view user_ role', 12, 'view_user_role'),
(49, 'Can add receptionist', 13, 'add_receptionist'),
(50, 'Can change receptionist', 13, 'change_receptionist'),
(51, 'Can delete receptionist', 13, 'delete_receptionist'),
(52, 'Can view receptionist', 13, 'view_receptionist'),
(53, 'Can add patients_ prescriptions', 14, 'add_patients_prescriptions'),
(54, 'Can change patients_ prescriptions', 14, 'change_patients_prescriptions'),
(55, 'Can delete patients_ prescriptions', 14, 'delete_patients_prescriptions'),
(56, 'Can view patients_ prescriptions', 14, 'view_patients_prescriptions'),
(57, 'Can add patient_ payment_ history', 15, 'add_patient_payment_history'),
(58, 'Can change patient_ payment_ history', 15, 'change_patient_payment_history'),
(59, 'Can delete patient_ payment_ history', 15, 'delete_patient_payment_history'),
(60, 'Can view patient_ payment_ history', 15, 'view_patient_payment_history'),
(61, 'Can add doctor_ appointments', 16, 'add_doctor_appointments'),
(62, 'Can change doctor_ appointments', 16, 'change_doctor_appointments'),
(63, 'Can delete doctor_ appointments', 16, 'delete_doctor_appointments'),
(64, 'Can view doctor_ appointments', 16, 'view_doctor_appointments'),
(65, 'Can add architect', 17, 'add_architect'),
(66, 'Can change architect', 17, 'change_architect'),
(67, 'Can delete architect', 17, 'delete_architect'),
(68, 'Can view architect', 17, 'view_architect');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$tp5ouNjsHwrr$U4pwGxgUHyCto05Dq04PXbktMxF4zVOmxYsXJLRQAeM=', '2023-11-29 16:36:42.570773', 0, 'srijann', 'Srijan', 'Omar', 'srijanomar5840@gmail.com', 0, 1, '2023-11-28 12:04:17.033825'),
(2, 'pbkdf2_sha256$150000$Q5jI1uMmf8VG$9QMja07Okj0VMbs9VY8pRvweV4vHRxX9tsms50Q6YIM=', '2023-11-28 15:29:22.386465', 0, 'doctor22', 'Raman', 'Sharma', 'doctor@gmail.com', 0, 1, '2023-11-28 12:20:12.106399'),
(3, 'pbkdf2_sha256$150000$fSCdCStUKRzD$1UPUoFtNVUlBVS47jc+G+MTqzWJavcpeqKshJdIbWdM=', '2023-11-28 16:19:42.777443', 0, 'rachit12', 'Rachit', 'Sharma', 'rachit@gmail.com', 0, 1, '2023-11-28 12:26:25.373266'),
(4, 'pbkdf2_sha256$150000$1BMqKLaA1nwo$Taa33bezqCO+r0Y+F+19HGvwCkYmMLy/p7PJUQJoE7w=', '2023-12-01 11:43:20.785824', 0, 'client', 'Abhishek', 'Sharma', 'client@gmail.com', 0, 1, '2023-11-28 18:48:28.544785'),
(5, 'pbkdf2_sha256$150000$RPCuUW5zC0lg$2qbWJyCvtiA7gJgp29cSnsSJauDsr0HhYHnVh9SAuW4=', NULL, 0, 'swapnill', 'Swapnil', 'Agarwal', 'swapnil@gmail.com', 0, 1, '2023-11-29 20:06:21.855212'),
(6, 'pbkdf2_sha256$150000$N3YbD1A9WXq3$r7qtwtp2XHaq7RT5/vDhy4y36eJCqH38VQRt1CjmJQA=', NULL, 0, 'Keshavv', 'Keshav', 'Sharma', 'keshav@gmail.com', 0, 1, '2023-11-29 20:08:14.417873'),
(7, 'pbkdf2_sha256$150000$eLoIAyiZPqTq$8044tYJvX6msIL5QOxoIvzwACcdgWBeSpTUu0GrrItE=', NULL, 0, 'Shivammm', 'Shivam', 'Sharma', 'shivam@gmail.com', 0, 1, '2023-11-29 20:09:42.818437'),
(8, 'pbkdf2_sha256$150000$pwrmIIzYfafv$7lbaTmk7Ab/DWXW3CWNE1yRvlM/JIPNHpq1DBy3qYR4=', NULL, 0, 'Namann', 'Naman', 'Rastogi', 'naman@gmail.com', 0, 1, '2023-11-29 20:11:40.138390'),
(9, 'pbkdf2_sha256$150000$PGt3VO75uDq2$kEPspuKjS+5PBdXeS2yAP+lUcKFzj/JMRdUn5tjW6e4=', NULL, 0, 'Namann2', 'Naman', 'Rastogi', 'naman2@gmail.com', 0, 1, '2023-11-29 20:14:04.878042'),
(10, 'pbkdf2_sha256$150000$KGFsA2jiehgx$OCqUX0umG5UGzQTUZBnmopwm0Y9l/0ICQNauPAYcOL4=', NULL, 0, 'Namann3', 'Naman', 'Rastogi', 'naman3@gmail.com', 0, 1, '2023-11-29 21:18:50.916210'),
(11, 'pbkdf2_sha256$150000$pyH3tZx945uE$GZ1Lm38502MZDA++HM6SA6IaTlWpulRsiDdw6uvC+qI=', NULL, 0, 'Namann4', 'Naman', 'Rastogi', 'naman4@gmail.com', 0, 1, '2023-11-29 21:19:55.093399'),
(12, 'pbkdf2_sha256$150000$t7opIbB3wduO$zUVzft4lwnXR4Sz3VApwCH6I4rTi+wS8a93kXpiS5iI=', NULL, 0, 'Namann5', 'Naman', 'Rastogi', 'naman5@gmail.com', 0, 1, '2023-11-29 21:21:13.427355'),
(13, 'pbkdf2_sha256$150000$C54eS5NOQMLM$j0p62JRPIen4yCn8lsFix75k1GZ+3JKh6Cq5NlM7p1s=', NULL, 0, 'Namann6', 'Naman', 'Rastogi', 'naman6@gmail.com', 0, 1, '2023-11-29 21:29:25.905714'),
(14, 'pbkdf2_sha256$150000$BOiSxcdx1haS$DlgGcrJ7QNV+Jr1fqYzcb4lGzIWJujyz9zQikIItCss=', NULL, 0, 'Namann7', 'Naman', 'Rastogi', 'naman7@gmail.com', 0, 1, '2023-11-29 21:32:13.070767'),
(15, 'pbkdf2_sha256$150000$efsM6a5NBwiT$iaOiMDT3DOrN5GLc9E0Zk1f2uxqG3VChw3OOhLYIsB8=', NULL, 0, 'Namann8', 'Naman', 'Rastogi', 'naman8@gmail.com', 0, 1, '2023-11-29 21:34:29.061218'),
(16, 'pbkdf2_sha256$150000$kvJQBexxei1q$b99xb1zjwUf4A2BKQwinIMsaUNfqCBkOxtlWPJ0WRjc=', NULL, 0, 'Namann9', 'Naman', 'Rastogi', 'naman9@gmail.com', 0, 1, '2023-11-29 21:37:07.263293'),
(17, 'pbkdf2_sha256$150000$UwhZe3f7qAaP$9OKl4FPhDP8HzQrf0GgOpHtcutCV+fODgbd5Xmwmqg8=', NULL, 0, 'Namann10', 'Naman', 'Rastogi', 'naman10@gmail.com', 0, 1, '2023-11-29 21:41:16.763698'),
(18, 'pbkdf2_sha256$150000$x1ITlQAoIzAB$U3d8EcLyEKHVIQ3KyJwjYhZqyPdhIgoqZmh1qYg0gO8=', NULL, 0, 'Namann11', 'Naman', 'Rastogi', 'naman11@gmail.com', 0, 1, '2023-11-29 21:41:55.377675'),
(19, 'pbkdf2_sha256$150000$O2Hs7njnuf6p$lqBkpfo3zZKGNdHI7YqrJUjiIeOvMi8W3oKkX9r3r28=', '2023-12-01 11:49:39.423085', 0, 'Architect', 'Architect', 'Engineer', 'architect@gmail.com', 0, 1, '2023-11-29 21:43:48.382375'),
(20, 'pbkdf2_sha256$150000$A06wTUKO4UrH$wa02/tZq2kz6+gEQt9qTYp/h6mphOPoTi1xasDboMng=', NULL, 0, 'aditya', 'Aditya', 'Kanaujia', 'aditya@gmail.com', 0, 1, '2023-11-29 22:06:29.454318'),
(23, 'pbkdf2_sha256$150000$AaAEU7nkh3AC$BjzARGTb3TPH/8sccMVr+CqqvoSutgs5rYfhbGfFEjo=', NULL, 0, 'nikhil', 'Nikhil', 'Gupta', 'nikhil@gmail.com', 0, 1, '2023-11-29 22:10:47.772523'),
(24, 'pbkdf2_sha256$150000$sTWTj7FiTT5d$t8T+EKLdc0bwZM10RK4HFsQOOgG8/GfBFxlyXmUF2i8=', NULL, 0, 'userq', 'userq', 'us', 'userq@gmail.com', 0, 1, '2023-11-29 22:12:09.184533'),
(25, 'pbkdf2_sha256$150000$Wd2S1HP3nd2S$lrG8fUG/pPXij6nCP3Zk2p2iE8wLSsDVDNGKRff7pLo=', NULL, 0, 'carpenter', 'carpenter', 'wood', 'carpenter@gmail.com', 0, 1, '2023-11-29 22:13:47.206140'),
(30, 'pbkdf2_sha256$150000$X7SXVf6whMXA$llpZUAf8WV+59VUh5gJuc24M9zY/qW0epnhzoZEEFHA=', NULL, 0, 'carpenterr', 'carpenterr', 'wood', 'carpenterr@gmail.com', 0, 1, '2023-11-29 22:16:25.606845'),
(34, 'pbkdf2_sha256$150000$QXqAbIHm7Fnl$YZO7EDd48Q5vux0aoTB+2gZ7P5PejHvv4uFNxlEy04Y=', NULL, 0, 'plumberr', 'plumber', 'water', 'plumber@gmail.com', 0, 1, '2023-11-29 22:27:58.559807'),
(35, 'pbkdf2_sha256$150000$eemV8RK3QM4F$+cZk9mjiwT0xRce1RHLr5C4t0frU+l5iXEjs71owH7I=', NULL, 0, 'plumberr2', 'plumber', 'water', 'qplumber@gmail.com', 0, 1, '2023-11-29 22:28:29.133170'),
(36, 'pbkdf2_sha256$150000$BidSdN2QdJeS$7oY51vf/3JrNfa4nRfmgYDy44uXrO4nCnDwNL9+ggWQ=', NULL, 0, 'masonn', 'mason', 'cement', 'mason@gmail.com', 0, 1, '2023-11-29 22:42:39.776591'),
(37, 'pbkdf2_sha256$150000$jZayxRTuadIJ$SL0/bz86NeOoamvXIHS4f9nn82FJNviIYIFKW58XE1w=', NULL, 0, 'mason24', 'mason', 'cement', 'mason24@gmail.com', 0, 1, '2023-11-29 22:44:11.850123'),
(38, 'pbkdf2_sha256$150000$XMkqROnwSrKI$JKV5tJ3OqGu9JYesXP0AH0wJlX4GjSSuL6XOuykKnw8=', NULL, 0, 'mason245', 'mason', 'cement', 'mason245@gmail.com', 0, 1, '2023-11-29 22:45:25.302617'),
(39, 'pbkdf2_sha256$150000$Js9db0uCTVCd$i7Sc5n8wHFDW5fb2GZeoMsxO9SLibZFYkGyQ+0WOZ9w=', NULL, 0, 'shivam212', 'Shivam', 'Kumar', 'shivam212@gmail.com', 0, 1, '2023-11-29 23:02:55.165191'),
(40, 'pbkdf2_sha256$150000$Hn2yjiZt1OXJ$a4NDYpzYxmT9n7tmzL4bnUuxnJuahOy8PTQE6tzotN4=', NULL, 0, 'newclient', 'Abhi', 'Sharma', 'newclient@gmail.com', 0, 1, '2023-11-29 23:15:01.488508'),
(41, 'pbkdf2_sha256$150000$JnV4jOEfkakF$ENErR6VwxIt3xIifdp4Oiguwo3PF3dVXSaZM9TViWjA=', NULL, 0, 'newclient2', 'Abhi', 'Sharma', 'newclient2@gmail.com', 0, 1, '2023-11-29 23:15:37.510536'),
(42, 'pbkdf2_sha256$150000$BnGOny4ohf56$XnSe7mG7TV0TY6gW0UP1AOXlTL0ZrdDtZb4I+/fNMwg=', NULL, 0, 'newclient3', 'Abhi', 'Sharma', 'newclient3@gmail.com', 0, 1, '2023-11-29 23:15:57.391301'),
(43, 'pbkdf2_sha256$150000$MOnLfXbaF1Kz$ZowdqqqmkAd3FXxm+yfkc7IXhyoHqXNi6MvujCsK++4=', NULL, 0, 'newclient4', 'Abhi', 'Sharma', 'newclient4@gmail.com', 0, 1, '2023-11-29 23:16:19.783530'),
(44, 'pbkdf2_sha256$150000$Jl8MVFYFz2jI$kaB/h/GTGYBEUUwbJdkoqH9o0ciuRpJS+/xmtj/7Y2k=', NULL, 0, 'newclient5', 'Abhi', 'Sharma', 'newclient5@gmail.com', 0, 1, '2023-11-29 23:17:13.464569'),
(45, 'pbkdf2_sha256$150000$wh9kRqh4Iy0f$KpFlSgQrHyDst19B65tO94Mh4weQ8/dFo2X97Cl7lJg=', NULL, 0, 'fdghj123', 'Aroit', 'hvjb', 'ffghj123@gmail.com', 0, 1, '2023-11-29 23:33:46.129971'),
(46, 'pbkdf2_sha256$150000$V0OLnTVpCtad$9L33muLKo1lCeZyxdhP6byrmhfZY+eXJRxEXC5p59kI=', '2023-12-01 09:28:10.419600', 0, 'worker', 'Sarthak', 'Yadav', 'worker@gmail.com', 0, 1, '2023-11-29 23:45:29.563283'),
(47, 'pbkdf2_sha256$150000$WXg9abebqx6n$lZ7m4xgkLKFWzbUFeQa3GE/AONPKei/58XRoumE0/qc=', '2023-12-01 10:10:16.363121', 0, 'anant24', 'Anant', 'Rai', 'anant@gmail.com', 0, 1, '2023-12-01 10:09:59.414236'),
(48, 'pbkdf2_sha256$150000$rR1T79iKyM9T$m5mPtfB2eshBqQInXVIdmgdl37y/b+ye9iWyu8ykdk4=', NULL, 0, 'client5', 'Abhiraj', 'Sharma', 'newclient9@gmail.com', 0, 1, '2023-12-01 10:46:22.098129');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(17, 'hospital', 'architect'),
(8, 'hospital', 'doctordepartment'),
(16, 'hospital', 'doctor_appointments'),
(7, 'hospital', 'doctor_details'),
(9, 'hospital', 'homepage_fields'),
(14, 'hospital', 'patients_prescriptions'),
(10, 'hospital', 'patient_appointments'),
(11, 'hospital', 'patient_details'),
(15, 'hospital', 'patient_payment_history'),
(13, 'hospital', 'receptionist'),
(12, 'hospital', 'user_role'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-28 12:03:59.338155'),
(2, 'auth', '0001_initial', '2023-11-28 12:03:59.517548'),
(3, 'admin', '0001_initial', '2023-11-28 12:04:00.298164'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-28 12:04:00.523646'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-28 12:04:00.532542'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-28 12:04:00.625228'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-28 12:04:00.641288'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-28 12:04:00.658378'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-28 12:04:00.664673'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-28 12:04:00.713295'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-28 12:04:00.716139'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-28 12:04:00.723343'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-28 12:04:00.740074'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-28 12:04:00.756812'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-28 12:04:00.777992'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-28 12:04:00.787745'),
(17, 'hospital', '0001_initial', '2023-11-28 12:04:01.185370'),
(18, 'hospital', '0002_receptionist_doctor', '2023-11-28 12:04:02.492127'),
(19, 'hospital', '0003_auto_20230929_0025', '2023-11-28 12:04:02.659050'),
(20, 'hospital', '0004_auto_20230929_0026', '2023-11-28 12:04:02.745986'),
(21, 'hospital', '0005_auto_20230929_1803', '2023-11-28 12:04:02.814000'),
(22, 'hospital', '0006_auto_20230929_1804', '2023-11-28 12:04:02.892315'),
(23, 'hospital', '0007_patient_payment_history_doctor', '2023-11-28 12:04:02.923223'),
(24, 'sessions', '0001_initial', '2023-11-28 12:04:03.042250'),
(25, 'hospital', '0008_architect', '2023-11-29 19:47:03.517666'),
(26, 'hospital', '0009_architect_architect', '2023-11-29 19:53:34.965570'),
(27, 'hospital', '0010_auto_20231129_2316', '2023-11-29 23:17:00.394083'),
(28, 'hospital', '0011_homepage_fields_order', '2023-11-30 00:28:42.919863'),
(29, 'hospital', '0012_doctor_details_doctor_address', '2023-11-30 02:14:30.196510');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jlxj0axx72twlhz6wsupksw4h9q4m3je', 'YjlhMzQ5MTJmMTE0MTUwMDRkZDE2ZGU4NDdjZjI5ZThlMTliNGI4NTp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzY1Mjg0YzdlNThlODZiOGJiMTcyYTA2MzAzMWMzZTE2NmJlMmEzZiJ9', '2023-12-15 00:12:56.574191');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_architect`
--

CREATE TABLE `hospital_architect` (
  `id` int(11) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Qualification` varchar(100) NOT NULL,
  `Experience` int(11) NOT NULL,
  `Projects` int(11) NOT NULL,
  `architect_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_architect`
--

INSERT INTO `hospital_architect` (`id`, `Area`, `Name`, `Qualification`, `Experience`, `Projects`, `architect_id`) VALUES
(1, 'Lucknow', 'NamanRastogi', 'B.Arc.', 6, 10, 18),
(2, 'Ghaziabad', 'ArchitectEngineer', 'B.Arc.', 9, 20, 19);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctordepartment`
--

CREATE TABLE `hospital_doctordepartment` (
  `id` int(11) NOT NULL,
  `Department` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_doctordepartment`
--

INSERT INTO `hospital_doctordepartment` (`id`, `Department`, `status`) VALUES
(1, 'Sustainable architecture', 1),
(2, 'General Medicine', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctor_appointments`
--

CREATE TABLE `hospital_doctor_appointments` (
  `id` int(11) NOT NULL,
  `add_dateTime` datetime(6) DEFAULT NULL,
  `update_dateTime` datetime(6) DEFAULT NULL,
  `Doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_doctor_details`
--

CREATE TABLE `hospital_doctor_details` (
  `id` int(11) NOT NULL,
  `Qualification` varchar(500) NOT NULL,
  `Morning_Time` varchar(500) NOT NULL,
  `Evening_Time` varchar(500) NOT NULL,
  `Phone_No` bigint(20) NOT NULL,
  `Doctor_Fees` int(11) DEFAULT NULL,
  `Department_id` int(11) DEFAULT NULL,
  `Doctor_id` int(11) DEFAULT NULL,
  `Doctor_Address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_doctor_details`
--

INSERT INTO `hospital_doctor_details` (`id`, `Qualification`, `Morning_Time`, `Evening_Time`, `Phone_No`, `Doctor_Fees`, `Department_id`, `Doctor_id`, `Doctor_Address`) VALUES
(1, 'MBBS', '10-12', '5-8', 9845634588, 500, 1, 2, 'Sector-19,Noida'),
(2, 'B.Arc.', '10-12', '5-8', 9845634555, 1000, 1, 3, 'Anand Vihar'),
(3, 'B.Arc.', '10-12', '5-8', 9845634555, 1000, 1, 4, '155,Indirapuram'),
(4, '', 'NA', 'NA', 9845634552, NULL, NULL, 44, 'Mauzampur,Varanasi'),
(5, '', 'NA', 'NA', 8171700359, NULL, NULL, 45, 'Sector-66,Gurugram'),
(6, '', 'NA', 'NA', 9845634558, NULL, NULL, 48, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_homepage_fields`
--

CREATE TABLE `hospital_homepage_fields` (
  `id` int(11) NOT NULL,
  `HomePage_fields` varchar(200) NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `state` varchar(500) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_homepage_fields`
--

INSERT INTO `hospital_homepage_fields` (`id`, `HomePage_fields`, `role`, `status`, `state`, `icon`, `order`) VALUES
(5, 'Construction Plans', 'architect', 1, 'DoctDashboard.ApproveAppointment', 'fa-fa user', 5),
(6, 'Clients', 'architect', 1, 'ReceptionDashboard.Doctor', '', 2),
(7, 'Material Requests', 'architect', 1, 'ReceptionDashboard.Appoint', '', 4),
(8, 'Workers', 'architect', 1, 'ReceptionDashboard.Patient', '', 3),
(9, 'My Profile', 'architect', 0, 'DoctDashboard.Information', '', 1),
(10, 'My profile', 'worker', 1, 'Dashboard.PatientInfo', '', 1),
(11, 'New Requirements', 'worker', 1, 'Dashboard.Appointment', '', 2),
(12, 'Requirements Status', 'worker', 1, 'Dashboard.Prescriptions', '', 3),
(13, 'Construction Plan', 'worker', 1, 'Dashboard.Payement', '', 4),
(14, 'My Profile', 'client', 1, 'DoctDashboard.Information', '', 1),
(15, 'Workers', 'client', 1, 'ReceptionDashboard.Patient', '', 2),
(16, 'Construction Plan', 'client', 1, 'Dashboard.Payement', '', 4),
(17, 'Requirements', 'client', 1, 'ReceptionDashboard.Appoint', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_patients_prescriptions`
--

CREATE TABLE `hospital_patients_prescriptions` (
  `id` int(11) NOT NULL,
  `Date_of_Prescription` datetime(6) DEFAULT NULL,
  `Diagnosis` varchar(500) NOT NULL,
  `Medications` varchar(500) NOT NULL,
  `Dosage` varchar(500) NOT NULL,
  `Instructions` varchar(500) NOT NULL,
  `Doctor_id` int(11) DEFAULT NULL,
  `Patient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_patient_appointments`
--

CREATE TABLE `hospital_patient_appointments` (
  `id` int(11) NOT NULL,
  `Appointment_date` varchar(500) NOT NULL,
  `Appointment_slot` varchar(500) NOT NULL,
  `Approval_status` tinyint(1) DEFAULT NULL,
  `Visit_dateTime` datetime(6) DEFAULT NULL,
  `Patient_Medical_history` varchar(500) NOT NULL,
  `Appointment_rejection_reason` varchar(500) NOT NULL,
  `Doctor_id` int(11) DEFAULT NULL,
  `Patient_id` int(11) DEFAULT NULL,
  `Patient_Details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_patient_details`
--

CREATE TABLE `hospital_patient_details` (
  `id` int(11) NOT NULL,
  `Patient_Gender` varchar(200) NOT NULL,
  `Patient_Age` double NOT NULL,
  `Patient_Address` varchar(500) NOT NULL,
  `Patient_Weight` double NOT NULL,
  `Patient_Contact` bigint(20) NOT NULL,
  `Patient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_patient_details`
--

INSERT INTO `hospital_patient_details` (`id`, `Patient_Gender`, `Patient_Age`, `Patient_Address`, `Patient_Weight`, `Patient_Contact`, `Patient_id`) VALUES
(1, 'Male', 20, 'Shahjahanpur', 65, 9345623478, 1),
(2, '', 65, 'Bareilly', 65, 9345763456, 38),
(3, '', 34, 'Shahjahanpur', 65, 9234234567, 39),
(4, '', 55, 'Bareilly', 65, 9345234567, 46),
(5, '', 25, 'Noida', 65, 9345672345, 47);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_patient_payment_history`
--

CREATE TABLE `hospital_patient_payment_history` (
  `id` int(11) NOT NULL,
  `Payment_date` datetime(6) DEFAULT NULL,
  `Amount` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `Patient_id` int(11) DEFAULT NULL,
  `Doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_receptionist`
--

CREATE TABLE `hospital_receptionist` (
  `id` int(11) NOT NULL,
  `NewAppointment_dateTime` datetime(6) DEFAULT NULL,
  `Doctor_Approval` tinyint(1) DEFAULT NULL,
  `Receptionist_Approval` tinyint(1) DEFAULT NULL,
  `Patient_id` int(11) DEFAULT NULL,
  `Patient_Appointments_id` int(11) DEFAULT NULL,
  `Patient_Details_id` int(11) DEFAULT NULL,
  `Doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_user_role`
--

CREATE TABLE `hospital_user_role` (
  `id` int(11) NOT NULL,
  `Role` varchar(200) NOT NULL,
  `User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_user_role`
--

INSERT INTO `hospital_user_role` (`id`, `Role`, `User_id`) VALUES
(1, 'architect', 1),
(2, 'worker', 2),
(3, 'worker', 3),
(4, 'client', 4),
(5, 'architect', 5),
(6, 'architect', 6),
(7, 'architect', 7),
(8, 'architect', 12),
(9, 'architect', 15),
(10, 'architect', 16),
(11, 'architect', 17),
(12, 'architect', 18),
(13, 'architect', 19),
(14, 'worker', 20),
(15, 'worker', 23),
(16, 'worker', 24),
(17, 'worker', 25),
(18, 'worker', 30),
(19, 'worker', 34),
(20, 'worker', 35),
(21, 'worker', 36),
(22, 'worker', 37),
(23, 'worker', 38),
(24, 'worker', 39),
(25, 'client', 42),
(26, 'client', 43),
(27, 'client', 44),
(28, 'client', 45),
(29, 'worker', 46),
(30, 'worker', 47),
(31, 'client', 48);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `hospital_architect`
--
ALTER TABLE `hospital_architect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_architect_architect_id_67ace879_fk_auth_user_id` (`architect_id`);

--
-- Indexes for table `hospital_doctordepartment`
--
ALTER TABLE `hospital_doctordepartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_doctor_appointments`
--
ALTER TABLE `hospital_doctor_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_doctor_appointments_Doctor_id_f5be8d1d_fk_auth_user_id` (`Doctor_id`);

--
-- Indexes for table `hospital_doctor_details`
--
ALTER TABLE `hospital_doctor_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_doctor_deta_Department_id_ca488b80_fk_hospital_` (`Department_id`),
  ADD KEY `hospital_doctor_details_Doctor_id_7cfef195_fk_auth_user_id` (`Doctor_id`);

--
-- Indexes for table `hospital_homepage_fields`
--
ALTER TABLE `hospital_homepage_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_patients_prescriptions`
--
ALTER TABLE `hospital_patients_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_patients_pr_Doctor_id_5c7339b9_fk_auth_user` (`Doctor_id`),
  ADD KEY `hospital_patients_pr_Patient_id_c00a658c_fk_auth_user` (`Patient_id`);

--
-- Indexes for table `hospital_patient_appointments`
--
ALTER TABLE `hospital_patient_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_patient_app_Doctor_id_02253609_fk_hospital_` (`Doctor_id`),
  ADD KEY `hospital_patient_app_Patient_id_6b6db704_fk_auth_user` (`Patient_id`),
  ADD KEY `hospital_patient_app_Patient_Details_id_d169e985_fk_hospital_` (`Patient_Details_id`);

--
-- Indexes for table `hospital_patient_details`
--
ALTER TABLE `hospital_patient_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_patient_details_Patient_id_624f4bfe_fk_auth_user_id` (`Patient_id`);

--
-- Indexes for table `hospital_patient_payment_history`
--
ALTER TABLE `hospital_patient_payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_patient_pay_Patient_id_1d54a32a_fk_auth_user` (`Patient_id`),
  ADD KEY `hospital_patient_pay_Doctor_id_778c0476_fk_hospital_` (`Doctor_id`);

--
-- Indexes for table `hospital_receptionist`
--
ALTER TABLE `hospital_receptionist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_receptionist_Patient_id_43b09c72_fk_auth_user_id` (`Patient_id`),
  ADD KEY `hospital_receptionis_Patient_Appointments_3e278601_fk_hospital_` (`Patient_Appointments_id`),
  ADD KEY `hospital_receptionis_Patient_Details_id_3edfd49f_fk_hospital_` (`Patient_Details_id`),
  ADD KEY `hospital_receptionis_Doctor_id_4dd50c6c_fk_hospital_` (`Doctor_id`);

--
-- Indexes for table `hospital_user_role`
--
ALTER TABLE `hospital_user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_user_role_User_id_65eb4504_fk_auth_user_id` (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hospital_architect`
--
ALTER TABLE `hospital_architect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hospital_doctordepartment`
--
ALTER TABLE `hospital_doctordepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hospital_doctor_appointments`
--
ALTER TABLE `hospital_doctor_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_doctor_details`
--
ALTER TABLE `hospital_doctor_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hospital_homepage_fields`
--
ALTER TABLE `hospital_homepage_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `hospital_patients_prescriptions`
--
ALTER TABLE `hospital_patients_prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_patient_appointments`
--
ALTER TABLE `hospital_patient_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_patient_details`
--
ALTER TABLE `hospital_patient_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospital_patient_payment_history`
--
ALTER TABLE `hospital_patient_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_receptionist`
--
ALTER TABLE `hospital_receptionist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_user_role`
--
ALTER TABLE `hospital_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_architect`
--
ALTER TABLE `hospital_architect`
  ADD CONSTRAINT `hospital_architect_architect_id_67ace879_fk_auth_user_id` FOREIGN KEY (`architect_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_doctor_appointments`
--
ALTER TABLE `hospital_doctor_appointments`
  ADD CONSTRAINT `hospital_doctor_appointments_Doctor_id_f5be8d1d_fk_auth_user_id` FOREIGN KEY (`Doctor_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_doctor_details`
--
ALTER TABLE `hospital_doctor_details`
  ADD CONSTRAINT `hospital_doctor_deta_Department_id_ca488b80_fk_hospital_` FOREIGN KEY (`Department_id`) REFERENCES `hospital_doctordepartment` (`id`),
  ADD CONSTRAINT `hospital_doctor_details_Doctor_id_7cfef195_fk_auth_user_id` FOREIGN KEY (`Doctor_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_patients_prescriptions`
--
ALTER TABLE `hospital_patients_prescriptions`
  ADD CONSTRAINT `hospital_patients_pr_Doctor_id_5c7339b9_fk_auth_user` FOREIGN KEY (`Doctor_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `hospital_patients_pr_Patient_id_c00a658c_fk_auth_user` FOREIGN KEY (`Patient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_patient_appointments`
--
ALTER TABLE `hospital_patient_appointments`
  ADD CONSTRAINT `hospital_patient_app_Doctor_id_02253609_fk_hospital_` FOREIGN KEY (`Doctor_id`) REFERENCES `hospital_doctor_details` (`id`),
  ADD CONSTRAINT `hospital_patient_app_Patient_Details_id_d169e985_fk_hospital_` FOREIGN KEY (`Patient_Details_id`) REFERENCES `hospital_patient_details` (`id`),
  ADD CONSTRAINT `hospital_patient_app_Patient_id_6b6db704_fk_auth_user` FOREIGN KEY (`Patient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_patient_details`
--
ALTER TABLE `hospital_patient_details`
  ADD CONSTRAINT `hospital_patient_details_Patient_id_624f4bfe_fk_auth_user_id` FOREIGN KEY (`Patient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_patient_payment_history`
--
ALTER TABLE `hospital_patient_payment_history`
  ADD CONSTRAINT `hospital_patient_pay_Doctor_id_778c0476_fk_hospital_` FOREIGN KEY (`Doctor_id`) REFERENCES `hospital_doctor_details` (`id`),
  ADD CONSTRAINT `hospital_patient_pay_Patient_id_1d54a32a_fk_auth_user` FOREIGN KEY (`Patient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_receptionist`
--
ALTER TABLE `hospital_receptionist`
  ADD CONSTRAINT `hospital_receptionis_Doctor_id_4dd50c6c_fk_hospital_` FOREIGN KEY (`Doctor_id`) REFERENCES `hospital_doctor_details` (`id`),
  ADD CONSTRAINT `hospital_receptionis_Patient_Appointments_3e278601_fk_hospital_` FOREIGN KEY (`Patient_Appointments_id`) REFERENCES `hospital_patient_appointments` (`id`),
  ADD CONSTRAINT `hospital_receptionis_Patient_Details_id_3edfd49f_fk_hospital_` FOREIGN KEY (`Patient_Details_id`) REFERENCES `hospital_patient_details` (`id`),
  ADD CONSTRAINT `hospital_receptionist_Patient_id_43b09c72_fk_auth_user_id` FOREIGN KEY (`Patient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hospital_user_role`
--
ALTER TABLE `hospital_user_role`
  ADD CONSTRAINT `hospital_user_role_User_id_65eb4504_fk_auth_user_id` FOREIGN KEY (`User_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
