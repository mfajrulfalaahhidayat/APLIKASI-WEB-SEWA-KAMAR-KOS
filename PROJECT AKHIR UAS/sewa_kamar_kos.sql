-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2021 at 05:03 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewa_kamar_kos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(5) NOT NULL,
  `id_tipe` int(5) NOT NULL,
  `nama_kamar` varchar(35) NOT NULL,
  `no_kamar` int(5) NOT NULL,
  `tipe_kasur` enum('Single Bed','Twin Bed','Double Bed') NOT NULL,
  `lokasi` enum('Lantai 1','Lantai 2','Lantai 3') NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_kamar` int(20) NOT NULL,
  `status_kamar` enum('1','0') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `id_tipe`, `nama_kamar`, `no_kamar`, `tipe_kasur`, `lokasi`, `gambar`, `tgl_input`, `harga_kamar`, `status_kamar`) VALUES
(1, 1, 'Adipati', 101, 'Single Bed', 'Lantai 1', 'gambar1544332691.jpg', '2018-12-11', 400000, '1'),
(2, 3, 'Kanjeng', 301, 'Double Bed', 'Lantai 3', 'gambar1544332354.jpg', '2018-12-11', 1000000, '1'),
(6, 2, 'Raden', 201, 'Twin Bed', 'Lantai 2', 'gambar1544514756.jpg', '0000-00-00', 700000, '1'),
(5, 3, 'Kanjeng', 302, 'Double Bed', 'Lantai 3', 'gambar1544363768.jpg', '0000-00-00', 1000000, '1'),
(7, 2, 'Patih', 303, 'Twin Bed', 'Lantai 3', 'gambar1544529342.jpg', '2018-12-11', 800000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(5) NOT NULL,
  `nama_pelanggan` varchar(45) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `gender`, `no_telp`, `alamat`, `email`) VALUES
(1, 'Firman Rosadi', 'Laki-Laki', '081344556678', 'Cilincing', 'firman@gmail.com'),
(2, 'Joko Kriswanto', 'Laki-Laki', '081233336789', 'Pasar Minggu', 'joko@gmail.com'),
(3, 'Febby Triadi', 'Laki-Laki', '081154662344', 'Rusia', 'kangfeb@gmail.com'),
(4, 'Zaenuddin', 'Laki-Laki', '081599870090', 'Cengkareng', 'nuding@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `id_sewa` int(5) NOT NULL,
  `tgl_sewa` datetime NOT NULL,
  `id_pelanggan` int(5) NOT NULL,
  `tgl_cekin` date NOT NULL,
  `tgl_cekout` date NOT NULL,
  `total_extend` double NOT NULL DEFAULT 0,
  `status_bayar` enum('0','1') DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`id_sewa`, `tgl_sewa`, `id_pelanggan`, `tgl_cekin`, `tgl_cekout`, `total_extend`, `status_bayar`) VALUES
(1, '2018-12-05 13:00:00', 1, '2018-12-06', '2018-12-07', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tipekamar`
--

CREATE TABLE `tipekamar` (
  `id_tipe` int(5) NOT NULL,
  `tipe_kamar` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipekamar`
--

INSERT INTO `tipekamar` (`id_tipe`, `tipe_kamar`) VALUES
(1, 'Standar'),
(2, 'Deluxe'),
(3, 'Premium Suite');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_sewa` int(11) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `id_pelanggan` int(4) NOT NULL,
  `id_kamar` int(4) NOT NULL,
  `tgl_cekin` date NOT NULL,
  `tgl_cekout` date NOT NULL,
  `extend` double NOT NULL,
  `tgl_extend` date NOT NULL,
  `total_extend` double NOT NULL,
  `status_penyewaan` varchar(15) NOT NULL,
  `status_pembayaran` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_sewa`, `tgl_bayar`, `id_pelanggan`, `id_kamar`, `tgl_cekin`, `tgl_cekout`, `extend`, `tgl_extend`, `total_extend`, `status_penyewaan`, `status_pembayaran`) VALUES
(1, '2018-12-10 00:00:00', 1, 3, '2018-12-08', '2018-12-09', 1000000, '2018-12-10', 3000000, '1', '1'),
(16, '2018-12-10 14:14:50', 4, 2, '2018-12-08', '2018-12-09', 1000000, '2018-12-10', 0, '1', '1'),
(17, '2018-12-10 14:32:41', 2, 1, '2018-12-07', '2018-12-09', 400000, '2018-12-10', 7149983333.3333, '1', '1'),
(18, '2018-12-11 08:17:15', 5, 1, '2018-12-09', '2018-12-10', 400000, '2018-12-11', 800000, '1', '1'),
(19, '2018-12-11 08:31:32', 10, 2, '2018-12-09', '2018-12-10', 1000000, '2018-12-11', 3000000, '1', '1'),
(20, '2018-12-11 08:33:09', 3, 2, '2018-12-06', '2018-12-10', 1000000, '2021-06-30', 936958333.33333, '1', '1'),
(21, '2018-12-11 12:58:24', 12, 7, '2018-12-11', '2018-12-13', 800000, '2018-12-13', 2400000, '1', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`id_sewa`);

--
-- Indexes for table `tipekamar`
--
ALTER TABLE `tipekamar`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_sewa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `id_sewa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipekamar`
--
ALTER TABLE `tipekamar`
  MODIFY `id_tipe` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
