-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 03:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cafe_bethesda`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `absen_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_pulang` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`absen_id`, `karyawan_id`, `waktu_masuk`, `waktu_pulang`) VALUES
(1, 2, '2025-06-26 01:00:00', '2025-06-26 10:00:00'),
(2, 3, '2025-06-26 01:05:00', '2025-06-26 10:02:00'),
(3, 2, '2025-06-27 01:02:00', '2025-07-10 06:12:30'),
(4, 3, '2025-07-10 06:15:16', '2025-07-10 06:15:19'),
(5, 10, '2025-07-10 06:17:22', '2025-07-10 06:17:25'),
(6, 5, '2025-07-10 06:52:28', '2025-07-10 06:52:31'),
(7, 6, '2025-07-10 06:53:01', '2025-07-10 06:53:04'),
(8, 9, '2025-07-10 06:53:43', '2025-07-10 06:53:45'),
(9, 8, '2025-07-10 06:54:09', '2025-07-10 06:54:12'),
(10, 7, '2025-07-10 06:54:41', '2025-07-10 06:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `bahan_id` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`bahan_id`, `nama_bahan`, `satuan`, `supplier_id`) VALUES
(1, 'Biji Kopi Robusta', 'gram', 1),
(2, 'Susu UHT Full Cream', 'ml', 2),
(3, 'Gula Aren Cair', 'ml', 3),
(4, 'Bubuk Coklat', 'gram', 4),
(5, 'Stroberi Fresh', 'gram', 5),
(6, 'Madu Rasa', 'ml', 6),
(7, 'Bubuk Matcha', 'gram', 7),
(8, 'Es Batu', 'gram', 8),
(9, 'Lemon Segar', 'gram', 9),
(10, 'Sirup Vanila', 'ml', 10),
(11, 'Boba Tapioka', 'gram', 5);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `detail_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`detail_id`, `transaksi_id`, `menu_id`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 1, 18000.00),
(2, 1, 3, 1, 20000.00),
(3, 2, 4, 1, 25000.00),
(4, 2, 5, 2, 44000.00),
(5, 3, 1, 1, 18000.00),
(6, 3, 3, 2, 40000.00),
(7, 4, 1, 2, 36000.00),
(8, 4, 3, 1, 20000.00),
(9, 5, 3, 3, 60000.00),
(10, 5, 5, 3, 66000.00),
(11, 6, 9, 2, 32000.00),
(12, 6, 8, 2, 34000.00),
(13, 7, 3, 3, 60000.00),
(14, 7, 7, 3, 90000.00),
(15, 8, 10, 4, 84000.00),
(16, 8, 9, 1, 16000.00),
(17, 8, 2, 3, 45000.00),
(18, 9, 1, 2, 36000.00),
(19, 10, 5, 5, 110000.00),
(20, 10, 10, 5, 105000.00);

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `inventaris_id` int(11) NOT NULL,
  `bahan_id` int(11) NOT NULL,
  `jumlah_stok` decimal(10,2) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`inventaris_id`, `bahan_id`, `jumlah_stok`, `tgl_update`) VALUES
(1, 1, 500.00, '2025-07-10 11:16:33'),
(2, 2, 5000.00, '2025-06-26 00:29:00'),
(3, 3, 2000.00, '2025-06-26 00:29:00'),
(4, 4, 800.00, '2025-06-26 00:29:00'),
(5, 5, 1500.00, '2025-06-26 00:29:00'),
(6, 6, 1000.00, '2025-07-10 11:33:02'),
(7, 7, 100.00, '2025-07-10 11:32:19'),
(8, 8, 5000.00, '2025-07-10 11:32:41'),
(9, 9, 6000.00, '2025-07-10 11:32:50'),
(10, 10, 1000.00, '2025-07-10 11:33:09'),
(11, 11, 700.00, '2025-07-10 13:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','owner','kasir','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `gaji`, `username`, `password`, `role`) VALUES
(1, 'Della Via Yora', '1985-05-15', 'Laki-laki', 10000000.00, 'owner', '$2a$10$Sp/5Ns5XsYhVwpiyg2qzxe5Fs9oDZKP/ypiP6NBbyWjA2EjFpXbQu', 'owner'),
(2, 'Ignatius Lucky', '2002-09-17', 'Laki-laki', 10000000.00, 'admin', '$2a$10$PpOP5IUluvbuWCP/w5zCfuLJd/Ko4JcvTgAVZY4rvvQNpM1IWmWuG', 'admin'),
(3, 'Dzaky Rofyan', '2003-01-20', 'Laki-laki', 4500000.00, 'dzaky', '$2a$10$kfAKOkFJLQaGOLVFg44TFeG9.UXSRQ7qBM6kzObRrnItIJtIhEqxW', 'kasir'),
(4, 'Syanie Nur\'aini Azis', '2004-01-01', 'Laki-laki', 4500000.00, 'sya', '$2a$10$/diO3fZwBTb906nVVdfspujUvm5VYzQx6Y3d/3egEeEQhEeTArC4y', 'staff'),
(5, 'Nata Michiko', '2004-01-01', 'Perempuan', 2000000.00, 'nata', '$2a$10$hgTEhwm1HSV7mZb8SO2dWu/Pn./SuTnIPqXFTfeFgm2QN80e/CmeS', 'staff'),
(6, 'Apat Yasser', '2004-01-01', 'Laki-laki', 2000000.00, 'apat', '$2a$10$F7pvAw517CAPhI9BxxgvR.5pBqZ9Molee1zSwDYTGnkdoqwjV0Jh2', 'staff'),
(7, 'Talia Ita', '2004-01-01', 'Perempuan', 2000000.00, 'talia', '$2a$10$HMyEK3MxkuC3IYP1HpNcX.YUiR9njztrr4vOoUcHNxXLYtyVlvoLm', 'staff'),
(8, 'Fani Aja', '2004-01-01', 'Perempuan', 200000.00, 'fani', '$2a$10$SiQ1LWNHT8wOaITdxLK83ulMM9RrsF57JpksNuNLdPLdlquJWKNi6', 'staff'),
(9, 'Yoga Aprata', '2004-01-01', 'Laki-laki', 2000000.00, 'yoga', '$2a$10$ghqNYZJch32P65Wx051sxur.71X46jgWQeOXtZc2uCGD75YKADd7m', 'staff'),
(10, 'Tae Uyga', '2004-01-01', 'Laki-laki', 2000000.00, 'tae', '$2a$10$UsWAcV5.2y3JkLlRvaHllegg0FwfYFnuuKgi5J0C5za1oFPPIUbSu', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `konsumen_id` int(11) NOT NULL,
  `nama_konsumen` varchar(100) NOT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`konsumen_id`, `nama_konsumen`, `nomor_telepon`, `jenis_kelamin`) VALUES
(1, 'Mahasiswa Umum', '080000000000', NULL),
(2, 'Ignatius Lucky', '081111111111', 'Laki-laki'),
(3, 'Syanie Nur\'aini Azis', '082222222222', 'Perempuan'),
(4, 'Dzaky Rofian', '083333333333', 'Laki-laki'),
(5, 'Artiyail Aziz', '084444444444', 'Laki-laki'),
(6, 'Defani Mahes', '085555555555', 'Perempuan'),
(7, 'Apat Arafat', '086666666666', 'Laki-laki'),
(8, 'Nata Michiko', '087777777777', 'Perempuan'),
(9, 'Thalita ', '088888888888', 'Perempuan'),
(10, 'Aryo Panji', '089999999999', 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `nama_menu`, `harga`, `kategori`) VALUES
(1, 'Kopi Susu Gula Aren', 18000.00, 'Minuman Kopi'),
(2, 'Americano', 15000.00, 'Minuman Kopi'),
(3, 'Chocolate Latte', 20000.00, 'Minuman Non-Kopi'),
(4, 'Strawberry Smoothie', 25000.00, 'Minuman Non-Kopi'),
(5, 'Croissant Coklat', 22000.00, 'Makanan Ringan'),
(6, 'Matcha Latte', 22000.00, 'Minuman Non-Kopi'),
(7, 'Tuna Sandwich', 30000.00, 'Makanan Berat'),
(8, 'Lychee Tea', 17000.00, 'Minuman Non-Kopi'),
(9, 'Kentang Goreng', 16000.00, 'Makanan Ringan'),
(10, 'Caffe Latte', 21000.00, 'Minuman Kopi');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nama_supplier`, `nomor_telepon`, `alamat`) VALUES
(1, 'Koperasi Kopi Sejahtera', '081234567890', 'Jl. Kopi No. 1, Yogyakarta'),
(2, 'Susu Murni Boyolali', '089876543210', 'Jl. Susu No. 5, Boyolali'),
(3, 'Pasar Induk Buah', '085555554444', 'Jl. Pasar Raya, Yogyakarta'),
(4, 'Giyanti Coffee Roastery', '089571456278', 'Jl. Buaya No. 20, Surabaya'),
(5, 'PT. Kurnia Mitra Duta Sejahtera', '087141526378', 'Jl. Nangka No. 25, Surabaya'),
(6, 'Toffin Indonesia', '082167897651', 'Jl. Kebon Jeruk No. 20, Surabaya'),
(7, 'Greenfields', '089865789012', 'Jl. Pitung No. 2, Surabaya'),
(8, 'PT. Diamond Cold Storage', '081200121100', 'Jl. Kuta No. 10, Malang'),
(9, 'Dapur Coklat International', '082190162738', 'Jl. Angkasa No. 3, Lamongan'),
(10, 'Roti Cruncy Creamy', '089522338890', 'Jl. Lambe Tulah No. 9, Lamongan');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `konsumen_id` int(11) DEFAULT NULL,
  `waktu_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_bayar` decimal(10,2) NOT NULL,
  `metode_pembayaran` enum('Tunai','Debit','QRIS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `karyawan_id`, `konsumen_id`, `waktu_transaksi`, `total_bayar`, `metode_pembayaran`) VALUES
(1, 2, 1, '2025-06-26 00:29:00', 38000.00, 'QRIS'),
(2, 3, 2, '2025-06-26 00:29:00', 69000.00, 'Tunai'),
(3, 1, 3, '2025-06-29 14:39:24', 58000.00, 'Tunai'),
(4, 1, 4, '2025-07-01 06:06:35', 56000.00, 'Tunai'),
(5, 1, 5, '2025-07-01 06:06:58', 126000.00, 'Tunai'),
(6, 2, 6, '2025-07-10 05:56:21', 66000.00, 'Tunai'),
(7, 2, 7, '2025-07-10 05:58:47', 150000.00, 'Tunai'),
(8, 2, 8, '2025-07-10 05:59:41', 145000.00, 'Tunai'),
(9, 2, 9, '2025-07-10 06:00:02', 36000.00, 'Tunai'),
(10, 2, 10, '2025-07-10 06:00:27', 215000.00, 'Tunai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`absen_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`bahan_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`inventaris_id`),
  ADD UNIQUE KEY `bahan_id` (`bahan_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`konsumen_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `karyawan_id` (`karyawan_id`),
  ADD KEY `konsumen_id` (`konsumen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `bahan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `inventaris_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `konsumen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`karyawan_id`);

--
-- Constraints for table `bahan`
--
ALTER TABLE `bahan`
  ADD CONSTRAINT `bahan_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`bahan_id`) REFERENCES `bahan` (`bahan_id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`karyawan_id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`konsumen_id`) REFERENCES `konsumen` (`konsumen_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
