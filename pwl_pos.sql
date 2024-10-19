-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2024 at 04:04 PM
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
-- Database: `pwl_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_14_070135_create_m_level_table', 1),
(6, '2024_09_14_070648_create_m_kategori_table', 2),
(7, '2024_09_14_071123_create_m_supplier_table', 3),
(8, '2024_09_14_071522_create_m_user_table', 4),
(9, '2024_09_14_071845_create_m_barang_table', 5),
(10, '2024_09_14_072023_create_t_penjualan_table', 6),
(11, '2024_09_14_072531_create_t_stok_table', 7),
(12, '2024_09_14_072711_create_t_penjualan_detail_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE `m_barang` (
  `barang_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `barang_kode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_barang`
--

INSERT INTO `m_barang` (`barang_id`, `kategori_id`, `barang_kode`, `barang_nama`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG001', 'Laptop', 5000000, 7000000, NULL, NULL),
(2, 1, 'BRG002', 'Smartphone', 3000000, 4500000, NULL, NULL),
(3, 2, 'BRG003', 'Meja Kerja', 150000, 250000, NULL, NULL),
(4, 2, 'BRG004', 'Kursi Kantor', 200000, 350000, NULL, NULL),
(5, 3, 'BRG005', 'Ban Mobil', 400000, 600000, NULL, NULL),
(6, 3, 'BRG006', 'Oli Mesin', 50000, 100000, NULL, NULL),
(7, 4, 'BRG007', 'Vitamin C', 50000, 75000, NULL, NULL),
(8, 4, 'BRG008', 'Obat Batuk', 25000, 40000, NULL, NULL),
(9, 5, 'BRG009', 'Lipstik', 100000, 150000, NULL, NULL),
(10, 5, 'BRG010', 'Pelembab Wajah', 80000, 120000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `kategori_id` bigint UNSIGNED NOT NULL,
  `kategori_kode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`kategori_id`, `kategori_kode`, `kategori_nama`, `created_at`, `updated_at`) VALUES
(1, 'KTG001', 'Elektronik', NULL, NULL),
(2, 'KTG002', 'Perabotan', NULL, NULL),
(3, 'KTG003', 'Otomotif', NULL, NULL),
(4, 'KTG004', 'Kesehatan', NULL, NULL),
(5, 'KTG005', 'Kecantikan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_level`
--

CREATE TABLE `m_level` (
  `level_id` bigint UNSIGNED NOT NULL,
  `level_kode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_kode`, `level_nama`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'Administrator', NULL, NULL),
(2, 'MNG', 'Manager', NULL, NULL),
(3, 'STF', 'Staff/Kasir', NULL, NULL),
(4, 'CUS', 'Pelanggan', '2024-09-14 12:26:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_supplier`
--

CREATE TABLE `m_supplier` (
  `supplier_id` bigint UNSIGNED NOT NULL,
  `supplier_kode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_supplier`
--

INSERT INTO `m_supplier` (`supplier_id`, `supplier_kode`, `supplier_nama`, `supplier_alamat`, `created_at`, `updated_at`) VALUES
(1, 'SUP001', 'CV Elektronik Sejahtera', 'Jl. Jendral Sudirman No.100', '2024-10-15 10:30:00', '2024-10-15 10:30:00'),
(2, 'SUP002', 'PT Perabot Nusantara', 'Jl. Merdeka No.75', '2024-10-15 10:30:00', '2024-10-15 10:30:00'),
(3, 'SUP003', 'Toko Sumber Otomotif', 'Jl. Diponegoro No.45', '2024-10-15 10:30:00', '2024-10-15 10:30:00'),
(4, 'SUP004', 'Apotek Sehat Selalu', 'Jl. Kesehatan No.12', '2024-10-15 10:30:00', '2024-10-15 10:30:00'),
(5, 'SUP005', 'CV Kecantikan Alami', 'Jl. Mawar No.88', '2024-10-15 10:30:00', '2024-10-15 10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator', '$2y$12$awBV6EtU9gExYLHMylgt0eJ9ahYCwxEmCrdLh6ZmteCqgezbxxuue', '2024-10-15 08:30:00', '2024-10-15 08:30:00'),
(2, 2, 'manager', 'Manager', '$2y$12$ShFFFWeZmmtstgGbd.QdJ.Ko5KfdoHyY.YjdceQxOzfTATznNXw36', '2024-10-15 09:00:00', '2024-10-15 09:00:00'),
(3, 3, 'staff', 'Staff/Kasir', '$2y$12$kKuk1xAP68wWhzEEyVBPL.Fp5Ltrx50iFN3bDwl35AMl/XIStvnb2', '2024-10-15 09:30:00', '2024-10-15 09:30:00'),
(4, 4, 'customer-1', 'Pelanggan Pertama', '$2y$12$Ir0TSkQhX4YH1XzIL8KCq.snmGA6CDEq6eFP6aDBkS6m7nLSqzvRG', '2024-09-14 12:26:11', '2024-09-14 12:26:11'),
(7, 2, 'manager_dua', 'Manager 2', '$2y$12$XzJA9mR39HdfYty7aGGUQu4PSKlQBEyUFCPJP4ZaO6/na3Iv6GxEe', '2024-10-15 10:00:00', '2024-10-15 10:00:00'),
(8, 2, 'manager22', 'Manager Dua Dua', '$2y$12$t4soiWCcb8EY0UfLlxvrE.53lS4BUOa1DQEhG5GLbpDqQp1azsZCa', '2024-10-15 10:30:00', '2024-10-15 10:30:00'),
(9, 2, 'manager33', 'Manager Tiga Tiga', '$2y$12$zBSEMOsNoHQJe28.7V5KfeaQbfuXh8HiHHH4MMlsIheuiw7nK6GhW', '2024-10-15 11:00:00', '2024-10-15 11:00:00'),
(10, 2, 'manager56', 'Manager55', '$2y$12$jHt7s2T/eP/LJ/TWSa3pNO1WFqSjJBqHXCjeeC3WeaJVJqG/7z2lq', '2024-10-15 11:30:00', '2024-10-15 11:30:00'),
(11, 2, 'manager12', 'Manager11', '$2y$12$vUIxk5XPUheov2bFdhY1b.1tKwzgHCt0mOjW7ilFToxEF1HsnF1/i', '2024-10-15 12:00:00', '2024-10-15 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan`
--

CREATE TABLE `t_penjualan` (
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `pembeli` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_kode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_tanggal` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_penjualan`
--

INSERT INTO `t_penjualan` (`penjualan_id`, `user_id`, `pembeli`, `penjualan_kode`, `penjualan_tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 'John Lennon', 'PEN011', '2024-04-01 09:00:00', NULL, NULL),
(2, 1, 'Paul McCartney', 'PEN012', '2024-04-01 09:30:00', NULL, NULL),
(3, 1, 'Ringo Starr', 'PEN013', '2024-04-01 10:00:00', NULL, NULL),
(4, 1, 'Mick Jagger', 'PEN014', '2024-04-01 10:30:00', NULL, NULL),
(5, 2, 'David Bowie', 'PEN015', '2024-04-02 09:00:00', NULL, NULL),
(6, 2, 'Stevie Wonder', 'PEN016', '2024-04-02 09:30:00', NULL, NULL),
(7, 2, 'Elton John', 'PEN017', '2024-04-02 10:00:00', NULL, NULL),
(8, 3, 'Freddie Mercury', 'PEN018', '2024-04-02 10:30:00', NULL, NULL),
(9, 3, 'Jim Morrison', 'PEN019', '2024-04-03 08:00:00', NULL, NULL),
(10, 3, 'Kurt Cobain', 'PEN020', '2024-04-03 08:30:00', NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan_detail`
--

CREATE TABLE `t_penjualan_detail` (
  `detail_id` bigint UNSIGNED NOT NULL,
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `harga` int NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_penjualan_detail`
--

INSERT INTO `t_penjualan_detail` (`detail_id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 250000, 8, NULL, NULL),
(2, 1, 2, 180000, 1, NULL, NULL),
(3, 1, 3, 300000, 2, NULL, NULL),
(4, 2, 1, 100000, 2, NULL, NULL),
(5, 2, 2, 200000, 7, NULL, NULL),
(6, 2, 3, 150000, 3, NULL, NULL),
(7, 3, 1, 120000, 4, NULL, NULL),
(8, 3, 2, 250000, 8, NULL, NULL),
(9, 3, 3, 320000, 8, NULL, NULL),
(10, 4, 1, 210000, 1, NULL, NULL),
(11, 4, 2, 190000, 2, NULL, NULL),
(12, 4, 3, 230000, 6, NULL, NULL),
(13, 5, 1, 500000, 8, NULL, NULL),
(14, 5, 2, 320000, 3, NULL, NULL),
(15, 5, 3, 170000, 4, NULL, NULL),
(16, 6, 1, 450000, 6, NULL, NULL),
(17, 6, 2, 310000, 2, NULL, NULL),
(18, 6, 3, 60000, 3, NULL, NULL),
(19, 7, 1, 480000, 9, NULL, NULL),
(20, 7, 2, 120000, 2, NULL, NULL),
(21, 7, 3, 70000, 5, NULL, NULL),
(22, 8, 1, 430000, 8, NULL, NULL),
(23, 8, 2, 180000, 9, NULL, NULL),
(24, 8, 3, 40000, 7, NULL, NULL),
(25, 9, 1, 390000, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_stok`
--

CREATE TABLE `t_stok` (
  `stok_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stok_tanggal` datetime NOT NULL,
  `stok_jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_stok`
--

INSERT INTO `t_stok` (`stok_id`, `supplier_id`, `barang_id`, `user_id`, `stok_tanggal`, `stok_jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-09-10 09:00:00', 120, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(2, 2, 2, 2, '2024-09-14 11:00:00', 130, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(3, 3, 3, 3, '2024-09-13 09:30:00', 160, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(4, 1, 4, 1, '2024-09-12 11:30:00', 90, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(5, 2, 5, 2, '2024-09-11 08:30:00', 100, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(6, 3, 6, 3, '2024-09-10 07:30:00', 115, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(7, 1, 7, 1, '2024-09-09 09:30:00', 145, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(8, 2, 8, 2, '2024-09-08 12:00:00', 135, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(9, 3, 9, 3, '2024-09-07 08:00:00', 165, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(10, 1, 10, 1, '2024-09-06 10:30:00', 175, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(11, 2, 1, 2, '2024-09-05 09:00:00', 185, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(12, 3, 2, 3, '2024-09-04 11:30:00', 210, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(13, 1, 3, 1, '2024-09-03 10:30:00', 195, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(14, 2, 4, 2, '2024-09-02 12:00:00', 215, '2024-09-14 12:39:21', '2024-09-14 12:39:21'),
(15, 3, 5, 3, '2024-09-01 08:30:00', 225, '2024-09-14 12:39:21', '2024-09-14 12:39:21');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `m_barang_barang_kode_unique` (`barang_kode`),
  ADD KEY `m_barang_kategori_id_index` (`kategori_id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `m_kategori_kategori_kode_unique` (`kategori_kode`);

--
-- Indexes for table `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `m_level_level_kode_unique` (`level_kode`);

--
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `m_supplier_supplier_kode_unique` (`supplier_kode`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `m_user_username_unique` (`username`),
  ADD KEY `m_user_level_id_index` (`level_id`);

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
-- Indexes for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD UNIQUE KEY `t_penjualan_penjualan_kode_unique` (`penjualan_kode`),
  ADD KEY `t_penjualan_user_id_index` (`user_id`);

--
-- Indexes for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `t_penjualan_detail_penjualan_id_index` (`penjualan_id`),
  ADD KEY `t_penjualan_detail_barang_id_index` (`barang_id`);

--
-- Indexes for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD PRIMARY KEY (`stok_id`),
  ADD KEY `t_stok_supplier_id_index` (`supplier_id`),
  ADD KEY `t_stok_barang_id_index` (`barang_id`),
  ADD KEY `t_stok_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `barang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `kategori_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `supplier_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_stok`
--
ALTER TABLE `t_stok`
  MODIFY `stok_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD CONSTRAINT `m_barang_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`);

--
-- Constraints for table `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `m_level` (`level_id`);

--
-- Constraints for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD CONSTRAINT `t_penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD CONSTRAINT `t_penjualan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `t_penjualan` (`penjualan_id`);

--
-- Constraints for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_stok_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `m_supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stok_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
