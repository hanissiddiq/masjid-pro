-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 10, 2024 at 05:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masjid_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel_masjid`
--

CREATE TABLE `artikel_masjid` (
  `id` int NOT NULL,
  `judul` varchar(70) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `isi_konten` text NOT NULL,
  `gambar_thumbnail` varchar(50) NOT NULL,
  `kategori_id` int NOT NULL,
  `tag` varchar(50) NOT NULL,
  `tanggal_posting` datetime NOT NULL,
  `jumlah_view` int NOT NULL,
  `jumlah_like` int NOT NULL,
  `masjid_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_banner`
--

CREATE TABLE `data_banner` (
  `id` int NOT NULL,
  `judul` varchar(30) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `link_tombol` varchar(100) NOT NULL,
  `label_tombol` varchar(20) NOT NULL,
  `masjid_id` int NOT NULL,
  `foto_banner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_masjid`
--

CREATE TABLE `data_masjid` (
  `id` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `deskripsi_profile` text NOT NULL,
  `domain_link` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_masjid`
--

INSERT INTO `data_masjid` (`id`, `nama`, `alamat`, `lokasi`, `deskripsi_profile`, `domain_link`, `status`) VALUES
(2, '', '', '', '', '', ''),
(3, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_menus`
--

CREATE TABLE `data_menus` (
  `id` int NOT NULL,
  `nama_menu` varchar(20) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `link_redirect` varchar(100) NOT NULL,
  `masjid_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `info_masjid`
--

CREATE TABLE `info_masjid` (
  `id` int NOT NULL,
  `judul` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `nama_penceramah` varchar(30) NOT NULL,
  `alamat_penceramah` varchar(30) NOT NULL,
  `jam_mulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `muadzin` varchar(30) NOT NULL,
  `imam` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `tanggal_jumat` date NOT NULL,
  `masjid_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `masjid_id` int NOT NULL,
  `foto` varchar(50) NOT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `password_expire_date` datetime DEFAULT '2024-11-06 00:00:00',
  `password_reset_key` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `masjid_id`, `foto`, `login_session_key`, `email_status`, `password_expire_date`, `password_reset_key`, `role`) VALUES
(1, 'fifi', 'fiilut5@gmail.com', '$2y$10$aMRsVN1MdWytKPdzEcNtKeNT1D0u1sAqsbHG74svhEJtfndYr.A4O', 3, '', NULL, NULL, '2024-11-06 00:00:00', NULL, 'admin'),
(3, 'tes', 'tes@gmail.com', '$2y$10$trxtePkgMuI24Qu.A2MQNe73rF5HAQMxfmBrnxhPby0CW2Pd3jvdm', 3, '', NULL, NULL, '2024-11-06 00:00:00', NULL, 'admin-masjid'),
(4, 'aji', 'aji@gmail.com', '$2y$10$IdSyElsJd4Fvb4h55VfoU.TdtW8rvHN.mmPOwNu.C8HlOl5KNqYZ6', 3, 'atw.png', NULL, '1', NULL, NULL, 'admin-masjid'),
(5, 'ica', 'ica@gmail.com', '$2y$10$JLK/MNLw53Smf/dHQ3mh2ua/Z4/5qfEt872uaTNDUvAaW2UpLpw/q', 3, 'AVATARA.png', NULL, '1', NULL, NULL, 'admin'),
(6, 'asw', 'asw@gmail.com', '$2y$10$UoDX3tv5OpiexJ0s.m6MCuGL1Fh3VEJuqDbqCRVQvpc.Fo4bOwazu', 3, 'SIMRumah_Sakita.png', NULL, '1', NULL, NULL, 'admin'),
(7, 'ida', 'ida@gmail.com', '$2y$10$5ztxO/pL6A6eOb1UhMXZYuH5Au51.Hbt07IT.Xpcu9.suMQIUnupO', 3, 'user-avatar.jpg', NULL, '1', NULL, NULL, 'admin'),
(8, 'sara', 'sara@gmail.com', '$2y$10$THb7TwqC3oZYBrOdARK6Ou.JCnGM5LofzO3MspdNTbbAE9vtfapJO', 3, 'user-avatar1.jpg', NULL, '1', NULL, NULL, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel_masjid`
--
ALTER TABLE `artikel_masjid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_banner`
--
ALTER TABLE `data_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_masjid`
--
ALTER TABLE `data_masjid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_menus`
--
ALTER TABLE `data_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_masjid`
--
ALTER TABLE `info_masjid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel_masjid`
--
ALTER TABLE `artikel_masjid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_banner`
--
ALTER TABLE `data_banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_masjid`
--
ALTER TABLE `data_masjid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_menus`
--
ALTER TABLE `data_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_masjid`
--
ALTER TABLE `info_masjid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
