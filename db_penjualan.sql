-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 12:28 PM
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
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barkode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'makanan ringan'),
(2, 'minuman'),
(3, 'sembako'),
(4, 'obat'),
(5, 'perabot'),
(8, 'atk'),
(9, 'kain');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `member` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `member`) VALUES
(2, 2147483647, 'Siti Rahayu', '08765432100', 'sitirahayu@gmail.com', 'Jl. Jenderal Sudirman No. 25', 'yes'),
(3, 2147483647, 'Ahmad Yani', '08543210987', 'ahmadyani@gmail.com', 'Jl. Diponegoro No. 15', 'yes'),
(5, 2147483647, 'Dewi Putri', '08901234567', 'dewiputri@gmail.com', 'Jl. Gajah Mada No. 5', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `tanggal`, `diskripsi`, `supplier_id`, `user_id`) VALUES
(1, 2024001, 1500000, 1000000, '2024-06-30', 'Pembelian berbagai bahan pokok seperti beras, gula, minyak goreng', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` char(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'pc', 'pieces'),
(2, 'dus', 'dus'),
(3, 'kg', 'kilogram'),
(5, 'box', 'box'),
(6, 'gr', 'gram');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, 1234567890, 'PT ABC Sentosa', '08123456789', 'abc@sentosa.com', 'Jl. Raya No. 10', 'ABC Sentosa', 'Bank Mandiri', 'PT ABC Sentosa', '1234567890'),
(2, 2147483647, 'PT Mega Jaya Abadi', '08765432100', 'megajaya@abadi.com', 'Jl. Merdeka No. 25', 'Mega Jaya Abadi', 'Bank BCA', 'PT Mega Jaya Abadi', '2345678901'),
(3, 2147483647, 'CV Cahaya Bersama', '08543210987', 'cahaya@bersama.com', 'Jl. Diponegoro No. 15', 'Cahaya Bersama', 'Bank BNI', 'CV Cahaya Bersama', '3456789012'),
(4, 2147483647, 'UD Sejahtera Jaya', '08234567890', 'sejahtera@jaya.com', 'Jl. Gatot Subroto No. 30', 'Sejahtera Jaya', 'Bank BRI', 'UD Sejahtera Jaya', '4567890123'),
(5, 2147483647, 'PT Indah Makmur', '08901234567', 'indah@makmur.com', 'Jl. Gajah Mada No. 5', 'Indah Makmur', 'Bank Mandiri', 'PT Indah Makmur', '5678901234');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipe` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `alamat` char(20) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `telp`, `alamat`, `is_active`) VALUES
(1, 1234567890, 'agus_wijaya', 'Agus Wijaya', '123', 'user', 'agus.wijaya@gmail.com', '08123456789', 'Jl. Merdeka No. 10', '1'),
(2, 2147483647, 'siti_rahayu', 'Siti Rahayu', '456', 'user', 'siti.rahayu@gmail.com', '08765432100', 'Jl. Sudirman No. 25', '1'),
(3, 2147483647, 'budi_santoso', 'Budi Santoso', '789', 'user', 'budi.santoso@gmail.com', '08543210987', 'Jl. Diponegoro No. 1', '1'),
(4, 2147483647, 'lisa_kurniawan', 'Lisa Kurniawan', '231', 'user', 'lisa.kurniawan@gmail.com', '08234567890', 'Jl. Gatot Subroto No', '1'),
(5, 2147483647, 'eko_putra', 'Eko Putra', '434', 'user', 'eko.putra@gmail.com', '08901234567', 'Jl. Gajah Mada No. 5', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `satuan_id` (`satuan_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_id` (`pembelian_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kustomer_id` (`kustomer_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `barang_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `pembelian_detail_ibfk_1` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`id`);

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `penjualan_detail_ibfk_1` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`),
  ADD CONSTRAINT `penjualan_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
