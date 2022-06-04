-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2022 at 05:25 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_kendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `merek` varchar(30) NOT NULL,
  `plat` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'ready'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `nama`, `merek`, `plat`, `harga`, `jenis`, `status`) VALUES
(1, 'mio', 'yamah', 'AB1234OPK', 80000, 'motor', 'ready'),
(2, 'Avanza', 'Toyota', 'AB4134LOA', 200000, 'mobil', 'ready'),
(3, 'Revo', 'Yamaha', 'AB7432POG', 90000, 'motor', 'ready'),
(4, 'Beat', 'Honda', 'AB5454OKS', 60000, 'motor', 'ready'),
(5, 'beat', 'honda', 'AB 1234 AB', 50000, 'motor', 'ready');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` timestamp NOT NULL DEFAULT current_timestamp(),
  `harga` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'belum selesai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_penyewa`, `id_pegawai`, `id_kendaraan`, `lama_pinjam`, `tanggal_pinjam`, `harga`, `status`) VALUES
(2, 4, 1, 2, 3, '2022-05-27 08:37:46', 600000, 'selesai'),
(3, 4, 1, 1, 2, '2022-05-27 08:37:46', 160000, 'selesai'),
(5, 6, 1, 4, 2, '2022-05-30 03:06:14', 120000, 'selesai'),
(6, 10, 9, 5, 2, '2022-06-04 01:48:19', 100000, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `username`, `password`, `alamat`, `role`) VALUES
(1, '49257197494989', 'ale', '4D5A1201A7E12FC0A6FB3A524CFFFE39FD58A47E093C005E181A7D8D15C5C651', 'Yogyakarta', 'pegawai'),
(4, '38291028472856', 'burhn', '', 'Bekasi', 'penyewa'),
(6, '6191647268217568', 'Mirza', '', 'Jakarta', 'penyewa'),
(9, '09876', 'ale', '4D5A1201A7E12FC0A6FB3A524CFFFE39FD58A47E093C005E181A7D8D15C5C651', 'yogyakarta', 'pegawai'),
(10, '09876543211', 'ale', '', 'yogyakarta', 'penyewa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `id_kendaraan` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id`),
  ADD CONSTRAINT `id_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `id_penyewa` FOREIGN KEY (`id_penyewa`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
