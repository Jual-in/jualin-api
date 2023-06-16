-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2023 pada 16.57
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jualin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Diskon` int(11) NOT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `id_umkm`, `Nama`, `Harga`, `Diskon`, `Photo`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'Nasi Goreng Telur Dadar', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Nasi%20Goreng%20Telur%20Dadar.jpg', '2023-06-09 13:08:34', '2023-06-09 13:14:27'),
(2, 2, 'Nasi Kuning', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Nasi%20Kuning.jpg', '2023-06-09 13:08:34', '2023-06-09 13:14:44'),
(3, 2, 'Lontong Opor', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Lontong%20Opor.jpg', '2023-06-09 13:08:34', '2023-06-09 13:14:11'),
(4, 2, 'Thai Tea Milk', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Thai%20Tea%20Milk.jpg', '2023-06-09 13:08:34', '2023-06-09 13:14:59'),
(5, 2, 'Chocolate Milk', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Chocolate%20Milk.jpg', '2023-06-09 13:08:34', '2023-06-09 13:13:55'),
(6, 3, 'Gelang', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Gelang.jpg', '2023-06-09 13:27:16', '2023-06-09 13:36:54'),
(7, 3, 'Kalung', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Kalung.jpg', '2023-06-09 13:27:16', '2023-06-09 13:37:10'),
(8, 3, 'Gantungan Kunci', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Gantungan%20Kunci.jpg', '2023-06-09 13:27:16', '2023-06-09 13:36:15'),
(9, 3, 'Angklung Mini', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Angklung%20Mini.jpg', '2023-06-09 13:27:16', '2023-06-09 13:35:37'),
(10, 3, 'Celengan', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Celengan.jpg', '2023-06-09 13:27:16', '2023-06-09 13:35:53'),
(11, 8, 'Gula 1kg', 13000, 0, 'https://storage.googleapis.com/storage-api-jualin/Gula%201kg.png', '2023-06-09 13:30:29', '2023-06-09 13:38:25'),
(12, 8, 'Minyak Goreng 1L', 23000, 0, 'https://storage.googleapis.com/storage-api-jualin/Minyak%20Goreng%201L.jpg', '2023-06-09 13:30:29', '2023-06-09 13:38:41'),
(13, 8, 'Telor Ayam 1kg', 29000, 0, 'https://storage.googleapis.com/storage-api-jualin/Telor%20Ayam%201kg.jpg', '2023-06-09 13:30:29', '2023-06-09 13:38:53'),
(14, 8, 'Kopi Kapal Api', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Kopi%20Kapal%20Api.jpg', '2023-06-09 13:30:29', '2023-06-09 13:39:08'),
(15, 8, 'Garam 250gr', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Garam%20250gr.jpg', '2023-06-09 13:30:29', '2023-06-09 13:39:23'),
(16, 5, 'Telur Ayam 1kg', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Telor%20Ayam%201kg.jpg', '2023-06-09 13:30:29', '2023-06-09 13:45:34'),
(17, 5, 'Bibit Ayam Boiler Doc', 7000, 0, 'https://storage.googleapis.com/storage-api-jualin/Bibit%20Ayam%20Boiler%20Doc.jpg', '2023-06-09 13:30:29', '2023-06-09 13:45:54'),
(18, 5, 'Bibit Ayam Kalkun', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Bibit%20Ayam%20Kalkun.jpg', '2023-06-09 13:30:29', '2023-06-09 13:46:10'),
(19, 5, 'Bibit Itik', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Bibit%20Itik.jpg', '2023-06-09 13:30:29', '2023-06-09 13:46:19'),
(20, 5, 'Bibit Bebek Hibrida', 9500, 0, 'https://storage.googleapis.com/storage-api-jualin/Bibit%20Bebek%20Hibrida.jpg', '2023-06-09 13:30:29', '2023-06-09 13:46:35'),
(21, 13, 'Pensil Fabercastell 2b', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Pensil%20Fabercastell%202b.jpg', '2023-06-09 13:30:29', '2023-06-09 13:48:01'),
(22, 13, 'Penggaris Butterfly 30cm', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Penggaris%20Butterfly%2030cm.jpg', '2023-06-09 13:30:29', '2023-06-09 13:48:14'),
(23, 13, 'Pulpen Standard AE7', 2000, 0, 'https://storage.googleapis.com/storage-api-jualin/Pulpen%20Standard%20AE7.jpg', '2023-06-09 13:30:29', '2023-06-09 13:48:38'),
(24, 13, 'Pulpen Faster C600', 2500, 0, 'https://storage.googleapis.com/storage-api-jualin/Pulpen%20Faster%20C600.jpg', '2023-06-09 13:30:29', '2023-06-09 13:48:48'),
(25, 13, 'Pensil Staedtler 2b', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Pensil%20Staedtler%202b.jpg', '2023-06-09 13:30:29', '2023-06-09 13:49:19'),
(26, 28, 'Ayam Goreng Tepung Krispy', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kempot%20resto%20and%20cafe/Ayam%20Goreng%20Tepung%20Krispy.jpg', '2023-06-10 17:49:15', '2023-06-10 19:15:04'),
(27, 28, 'Nasi Goreng Special', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kempot%20resto%20and%20cafe/Nasi%20Goreng%20Special.jpg', '2023-06-10 17:49:15', '2023-06-10 19:15:19'),
(28, 28, 'Mie Goreng Special', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kempot%20resto%20and%20cafe/Mie%20Goreng%20Special.jpg', '2023-06-10 17:49:15', '2023-06-10 19:15:32'),
(29, 28, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kempot%20resto%20and%20cafe/Es%20Teh%20Manis.png', '2023-06-10 17:49:15', '2023-06-10 19:15:40'),
(30, 28, 'Es Jeruk', 8000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kempot%20resto%20and%20cafe/Es%20Jeruk.png', '2023-06-10 17:49:15', '2023-06-10 19:15:51'),
(31, 29, 'Baju Polos Putih', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Rumah%20Jahit%20Muqbil/Baju%20Polos%20Putih.jpg', '2023-06-10 17:53:16', '2023-06-11 04:03:14'),
(32, 29, 'Kemeja Pria Polos', 150000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Rumah%20Jahit%20Muqbil/Kemeja%20Pria%20Polos.jpg', '2023-06-10 17:53:16', '2023-06-11 04:03:14'),
(33, 29, 'Batik Lengan Panjang', 125000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Rumah%20Jahit%20Muqbil/Batik%20Lengan%20Panjang.jpg', '2023-06-10 17:53:16', '2023-06-11 04:03:14'),
(34, 29, 'Polo Shirt', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Rumah%20Jahit%20Muqbil/Polo%20Shirt.jpg', '2023-06-10 17:53:16', '2023-06-11 04:03:14'),
(35, 29, 'Gaun Pesta', 150000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Rumah%20Jahit%20Muqbil/Gaun%20Pesta.jpg', '2023-06-10 17:53:16', '2023-06-11 04:03:14'),
(36, 30, 'Mascara Body Shop', 130000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Menjual%20alat%20kosmetik%20online/Mascara%20Body%20Shop.jpg', '2023-06-10 17:58:56', '2023-06-11 04:06:51'),
(37, 30, 'Make Over Lip Matte', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Menjual%20alat%20kosmetik%20online/Make%20Over%20Lip%20Matte.jpg', '2023-06-10 17:58:56', '2023-06-11 04:06:51'),
(38, 30, 'Eyeshadow Pallate', 40000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Menjual%20alat%20kosmetik%20online/Eyeshadow%20Pallate.jpg', '2023-06-10 17:58:56', '2023-06-11 04:06:51'),
(39, 30, 'Pensil Alis Luxcrime', 65000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Menjual%20alat%20kosmetik%20online/Pensil%20Alis%20Luxcrime.jpg', '2023-06-10 17:58:56', '2023-06-11 04:06:51'),
(40, 30, 'Blash On Esqa', 70000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Menjual%20alat%20kosmetik%20online/Blash%20On%20Esqa.jpg', '2023-06-10 17:58:56', '2023-06-11 04:06:51'),
(41, 31, 'Gaun Anak', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anaila%20shop/Gaun%20Anak.jpg', '2023-06-10 17:58:56', '2023-06-11 04:09:22'),
(42, 31, 'Baju Daster', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Nasi%20Goreng.jpg', '2023-06-10 17:58:56', '2023-06-11 04:36:03'),
(43, 31, 'Celana Panjang Wanita', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anaila%20shop/Celana%20Panjang%20Wanita.jpg', '2023-06-10 17:58:56', '2023-06-11 04:09:22'),
(44, 31, 'Baju Garis-Garis', 55000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anaila%20shop/Baju%20Garis-Garis.jpg', '2023-06-10 17:58:56', '2023-06-11 04:09:22'),
(45, 31, 'Baju Distro', 65000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anaila%20shop/Baju%20Distro.jpg', '2023-06-10 17:58:56', '2023-06-11 04:09:22'),
(46, 32, 'Jaket Rajut Wanita', 65000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Queenza_Craft/Jaket%20Rajut%20Wanita.jpg', '2023-06-10 17:58:56', '2023-06-11 04:10:52'),
(47, 32, 'Baju Rajut', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Queenza_Craft/Baju%20Rajut.jpg', '2023-06-10 17:58:56', '2023-06-11 04:10:52'),
(48, 32, 'Baju Rajut Wanita', 70000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Queenza_Craft/Baju%20Rajut%20Wanita.jpg', '2023-06-10 17:58:56', '2023-06-11 04:10:52'),
(49, 32, 'Kupluk Rajut', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Queenza_Craft/Kupluk%20Rajut.jpg', '2023-06-10 17:58:56', '2023-06-11 04:10:52'),
(50, 32, 'Rompi Rajut', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Queenza_Craft/Rompi%20Rajut.jpg', '2023-06-10 17:58:56', '2023-06-11 04:10:52'),
(51, 33, 'Kopi Hitam', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Angkringanpedia%20Tasikmalaya/Kopi%20Hitam.jpg', '2023-06-10 17:58:56', '2023-06-11 04:12:38'),
(52, 33, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Angkringanpedia%20Tasikmalaya/Es%20Teh%20Manis.jpg', '2023-06-10 17:58:56', '2023-06-11 04:12:38'),
(53, 33, 'Nasi Kucing', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Angkringanpedia%20Tasikmalaya/Nasi%20Kucing.jpg', '2023-06-10 17:58:56', '2023-06-11 04:12:38'),
(54, 33, 'Sate Usus', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Angkringanpedia%20Tasikmalaya/Sate%20Usus.jpg', '2023-06-10 17:58:56', '2023-06-11 04:12:38'),
(55, 33, 'Sate Telor Puyuh', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Angkringanpedia%20Tasikmalaya/Sate%20Telor%20Puyuh.jpg', '2023-06-10 17:58:56', '2023-06-11 04:12:38'),
(56, 34, 'Paket Nasi Ayam Kremes', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ayam%20Kremes%20Makwo/Paket%20Nasi%20Ayam%20Kremes.jpg', '2023-06-10 18:08:48', '2023-06-11 04:14:12'),
(57, 34, 'Paket Nasi Ayam Bakar', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ayam%20Kremes%20Makwo/Paket%20Nasi%20Ayam%20Bakar.jpg', '2023-06-10 18:08:48', '2023-06-11 04:14:12'),
(58, 34, 'Paket Nasi Ayam Crispy', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ayam%20Kremes%20Makwo/Paket%20Nasi%20Ayam%20Crispy.jpg', '2023-06-10 18:08:48', '2023-06-11 04:14:12'),
(59, 34, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ayam%20Kremes%20Makwo/Es%20Teh%20Manis.jpg', '2023-06-10 18:08:48', '2023-06-11 04:14:12'),
(60, 34, 'Es Jeruk', 8000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ayam%20Kremes%20Makwo/Es%20Jeruk.jpg', '2023-06-10 18:08:48', '2023-06-11 04:14:12'),
(61, 35, 'Putu Ayu', 2500, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Usaha%20Jajanan%20Kue/Putu%20Ayu.jpg', '2023-06-10 18:08:48', '2023-06-11 04:15:51'),
(62, 35, 'Roti Goreng Ayam', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Usaha%20Jajanan%20Kue/Roti%20Goreng%20Ayam.jpg', '2023-06-10 18:08:48', '2023-06-11 04:15:51'),
(63, 35, 'Lumpia Bengkoang Ubi', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Usaha%20Jajanan%20Kue/Lumpia%20Bengkoang%20Ubi.jpg', '2023-06-10 18:08:48', '2023-06-11 04:15:51'),
(64, 35, 'Pisang Goreng', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Usaha%20Jajanan%20Kue/Pisang%20Goreng.jpg', '2023-06-10 18:08:48', '2023-06-11 04:15:51'),
(65, 35, 'Risol Sayur', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Usaha%20Jajanan%20Kue/Risol%20Sayur.jpg', '2023-06-10 18:08:48', '2023-06-11 04:15:51'),
(66, 36, 'Tas Corduroy', 120000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ladymar/Tas%20Corduroy.jpg', '2023-06-10 18:08:48', '2023-06-11 04:23:06'),
(67, 36, 'Tas Gunung', 300000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ladymar/Tas%20Gunung.jpg', '2023-06-10 18:08:48', '2023-06-11 04:23:06'),
(68, 36, 'Tas Backpack Hitam', 100000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ladymar/Tas%20Backpack%20Hitam.jpg', '2023-06-10 18:08:48', '2023-06-11 04:23:06'),
(69, 36, 'Kaos Band', 80000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ladymar/Kaos%20Band.jpg', '2023-06-10 18:08:48', '2023-06-11 04:23:06'),
(70, 36, 'Kaos Lengan Panjang', 90000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Ladymar/Kaos%20Lengan%20Panjang.jpg', '2023-06-10 18:08:48', '2023-06-11 04:23:06'),
(71, 37, 'Ramen Kuah Pedas', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/ramen%2044/Ramen%20Kuah%20Pedas.jpg', '2023-06-10 18:08:48', '2023-06-11 04:24:15'),
(72, 37, 'Ramen Kuah Seafood', 35000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/ramen%2044/Ramen%20Kuah%20Seafood.jpg', '2023-06-10 18:08:48', '2023-06-11 04:24:15'),
(73, 37, 'Ramen Kuah Kari', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/ramen%2044/Ramen%20Kuah%20Kari.jpg', '2023-06-10 18:08:48', '2023-06-11 04:24:15'),
(74, 37, 'Ramen Goreng Pedas', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/ramen%2044/Ramen%20Goreng%20Pedas.jpg', '2023-06-10 18:08:48', '2023-06-11 04:24:15'),
(75, 37, 'Ramen Goreng Mozarella', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/ramen%2044/Ramen%20Goreng%20Mozarella.jpg', '2023-06-10 18:08:48', '2023-06-11 04:24:15'),
(76, 38, 'Gaun Lengan Panjang Hijau', 125000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Simplyy2syarii/Gaun%20Lengan%20Panjang%20Hijau.jpg', '2023-06-10 18:08:48', '2023-06-11 04:36:03'),
(77, 38, 'Gaun Lengan Panjang Putih Hitam', 130000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Simplyy2syarii/Gaun%20Lengan%20Panjang%20Putih%20Hitam.jpg', '2023-06-10 18:08:48', '2023-06-11 04:36:03'),
(78, 38, 'Gaun Lengan Panjang Putih Pink', 130000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Simplyy2syarii/Gaun%20Lengan%20Panjang%20Putih%20Pink.jpg', '2023-06-10 18:08:48', '2023-06-11 04:36:03'),
(79, 38, 'Kerudung Bergo Panjang', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Simplyy2syarii/Kerudung%20Bergo%20Panjang.jpg', '2023-06-10 18:08:48', '2023-06-11 04:36:03'),
(80, 38, 'Kerudung Pasmina Khalisa', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Simplyy2syarii/Kerudung%20Pasmina%20Khalisa.jpg', '2023-06-10 18:08:48', '2023-06-11 04:36:03'),
(81, 39, 'Ayam Goreng Tepung', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20Dhyo/Ayam%20Goreng%20Tepung.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(82, 39, 'Mie Goreng', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20Dhyo/Mie%20Goreng.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(83, 39, 'Nasi Goreng', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20Dhyo/Nasi%20Goreng.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(84, 39, 'Mie Ayam', 13000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20Dhyo/Mie%20Ayam.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(85, 39, 'Roti Bakar', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20Dhyo/Roti%20Bakar.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(86, 40, 'Ayam Broiler Utuh', 60000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jual%20Daging%20Ayam/Ayam%20Broiler%20Utuh.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(87, 40, 'Sayap Ayam 1 kg', 40000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jual%20Daging%20Ayam/Sayap%20Ayam%201kg.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(88, 41, 'Beef Pastry', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Cathy%20Dessert_Pastry%20%20%20M2%20Cafe%20pulisan/Beef%20Pastry.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(89, 41, 'Apple Pastry', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Cathy%20Dessert_Pastry%20%20%20M2%20Cafe%20pulisan/Apple%20Pastry.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(90, 41, 'Chicken Samosa Pastry', 18000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Cathy%20Dessert_Pastry%20%20%20M2%20Cafe%20pulisan/Chicken%20Samosa%20Pastry.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(91, 41, 'Brownies Pastry', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Cathy%20Dessert_Pastry%20%20%20M2%20Cafe%20pulisan/Brownies%20Pastry.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(92, 41, 'Sweetcorn Pastry', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Cathy%20Dessert_Pastry%20%20%20M2%20Cafe%20pulisan/Sweetcorn%20Pastry.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(93, 42, 'Ayam Goreng Tepung', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Ayam%20Goreng%20Tepung.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(94, 42, 'Mie Goreng', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Mie%20Goreng.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(95, 42, 'Nasi Goreng', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Nasi%20Goreng.jpg', '2023-06-10 18:15:08', '2023-06-11 04:37:39'),
(96, 42, 'Mie Ayam', 13000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Mie%20Ayam.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(97, 42, 'Roti Bakar', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kedai%20Azka/Roti%20Bakar.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(98, 43, 'Parfum 25ml', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Zea%20shop/Parfum%2025ml.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(99, 43, 'Kacamata Hitam Minimalis', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Zea%20shop/Kacamata%20Hitam%20Minimalis.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(100, 43, 'Gaun Panjang Hitam', 100000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Zea%20shop/Gaun%20Panjang%20Hitam.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(101, 43, 'Daster Motif Bunga', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Zea%20shop/Daster%20Motif%20Bunga.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(102, 43, 'Baju Putih Polos', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Zea%20shop/Baju%20Putih%20Polos.jpg', '2023-06-10 18:15:08', '2023-06-11 04:36:03'),
(103, 44, 'Pisang Goreng', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/HR%20Food%20Sentul/Pisang%20Goreng.jpg', '2023-06-10 18:15:08', '2023-06-11 04:48:47'),
(104, 44, 'Pisang Goreng Keju', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/HR%20Food%20Sentul/Pisang%20Goreng%20Keju.jpg', '2023-06-10 18:15:08', '2023-06-11 04:48:47'),
(105, 44, 'Mie Goreng Telur', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/HR%20Food%20Sentul/Mie%20Goreng%20Telur.jpg', '2023-06-10 18:15:08', '2023-06-11 04:48:47'),
(106, 44, 'Roti Bakar', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/HR%20Food%20Sentul/Roti%20Bakar.jpg', '2023-06-10 18:15:08', '2023-06-11 04:48:47'),
(107, 44, 'Jus Alpukat', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/HR%20Food%20Sentul/Jus%20Alpukat.jpg', '2023-06-10 18:15:08', '2023-06-11 04:48:47'),
(108, 45, 'Aneka Jus', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Ngebul%20Kang%20Asep/Aneka%20Jus.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(109, 45, 'Bakso Halus', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Ngebul%20Kang%20Asep/Bakso%20Halus.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(110, 45, 'Bakso Urat', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Ngebul%20Kang%20Asep/Bakso%20Urat.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(111, 45, 'Sate Ayam', 18000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Ngebul%20Kang%20Asep/Sate%20Ayam.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(112, 45, 'Roti Bakar', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Ngebul%20Kang%20Asep/Roti%20Bakar.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(113, 46, 'Roti Bakar Coklat', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Mama%20Hasby/Roti%20Bakar%20Coklat.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(114, 46, 'Jus Alpukat', 13000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Mama%20Hasby/Jus%20Alpukat.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(115, 46, 'Ayam Goreng Tepung', 12000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Mama%20Hasby/Ayam%20Goreng%20Tepung.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(116, 46, 'Nasi Goreng', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Mama%20Hasby/Nasi%20Goreng.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(117, 46, 'Mie Goreng', 14000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Dapur%20Mama%20Hasby/Mie%20Goreng.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(118, 47, 'Pisang Goreng', 2000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jualan%20Gorengan/Pisang%20Goreng.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(119, 47, 'Bakwan Sayur', 2000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jualan%20Gorengan/Bakwan%20Sayur.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(120, 47, 'Bakwan Jagung', 2000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jualan%20Gorengan/Bakwan%20Jagung.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(121, 47, 'Risol', 2000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jualan%20Gorengan/Risol.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(122, 47, 'Tahu Isi', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Jualan%20Gorengan/Tahu%20Isi.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(123, 48, 'Kartu Perdana Sim Card', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Basri%20cell%20_%20parfum/Kartu%20Perdana%20Sim%20Card.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(124, 48, 'Earphone Spectrum', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Basri%20cell%20_%20parfum/Earphone%20Spectrum.png', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(125, 48, 'Parfum Jayrose', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Basri%20cell%20_%20parfum/Parfum%20Jayrose.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(126, 48, 'Parfum Oud', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Basri%20cell%20_%20parfum/Parfum%20Oud.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(127, 48, 'Parfum Body Shop', 65000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Basri%20cell%20_%20parfum/Parfum%20Body%20Shop.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(128, 49, 'Paket Nasi Ayam Kremes', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kayla%20kitchen/Paket%20Nasi%20Ayam%20Kremes.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(129, 49, 'Paket Nasi Ayam Bakar', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kayla%20kitchen/Paket%20Nasi%20Ayam%20Bakar.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(130, 49, 'Paket Nasi Ayam Crispy', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kayla%20kitchen/Paket%20Nasi%20Ayam%20Crispy.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(131, 49, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kayla%20kitchen/Es%20Teh%20Manis.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(132, 49, 'Es Jeruk', 8000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Kayla%20kitchen/Es%20Jeruk.jpg', '2023-06-10 18:33:45', '2023-06-11 04:48:47'),
(133, 50, 'Pisang Goreng Special', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/WARKOP/Pisang%20Goreng%20Special.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(134, 50, 'Mie Goreng', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/WARKOP/Mie%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(135, 50, 'Nasi Goreng', 17000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/WARKOP/Nasi%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(136, 50, 'Kopi Hitam', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/WARKOP/Kopi%20Hitam.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(137, 50, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/WARKOP/Es%20Teh%20Manis.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(138, 51, 'Mie Ayam Biasa', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Mie%20Ayam%20dan%20Krispy%20Campurejo/Mie%20Ayam%20Biasa.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(139, 51, 'Mie Ayam Baso', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Mie%20Ayam%20dan%20Krispy%20Campurejo/Mie%20Ayam%20Baso.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(140, 51, 'Mie Ayam Special', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Mie%20Ayam%20dan%20Krispy%20Campurejo/Mie%20Ayam%20Special.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(141, 51, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Mie%20Ayam%20dan%20Krispy%20Campurejo/Es%20Teh%20Manis.jpg', '2023-06-10 18:34:57', '2023-06-11 04:57:07'),
(142, 51, 'Pangsit Goreng', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Mie%20Ayam%20dan%20Krispy%20Campurejo/Pangsit%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(143, 52, 'Putu Ayu', 2500, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Snack%20dan%20jajan%20pasar%20assyifa/Putu%20Ayu.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(144, 52, 'Roti Goreng Ayam', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Snack%20dan%20jajan%20pasar%20assyifa/Roti%20Goreng%20Ayam.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(145, 52, 'Lumpia Bengkoang Ubi', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Snack%20dan%20jajan%20pasar%20assyifa/Lumpia%20Bengkoang%20Ubi.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(146, 52, 'Pisang Goreng', 3000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Snack%20dan%20jajan%20pasar%20assyifa/Pisang%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(147, 52, 'Risol Sayur', 4000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Snack%20dan%20jajan%20pasar%20assyifa/Risol%20Sayur.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(148, 53, 'Pisang Goreng Special', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/kedai%2099%20ketanon/Pisang%20Goreng%20Special.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(149, 53, 'Mie Goreng', 10000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/kedai%2099%20ketanon/Mie%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(150, 53, 'Nasi Goreng', 17000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/kedai%2099%20ketanon/Nasi%20Goreng.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(151, 53, 'Kopi Hitam', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/kedai%2099%20ketanon/Kopi%20Hitam.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(152, 53, 'Es Teh Manis', 5000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/kedai%2099%20ketanon/Es%20Teh%20Manis.jpg', '2023-06-10 18:34:57', '2023-06-11 04:56:18'),
(153, 54, 'Dompet Wanita', 60000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anna%20tas%20collection/Dompet%20Wanita.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(154, 54, 'Dompet Pria', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anna%20tas%20collection/Dompet%20Pria.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(155, 54, 'Tas Mini Guess', 115000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anna%20tas%20collection/Tas%20Mini%20Guess.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(156, 54, 'Tas David Jones', 150000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anna%20tas%20collection/Tas%20David%20Jones.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(157, 54, 'Totebag Agatha', 100000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Anna%20tas%20collection/Totebag%20Agatha.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(158, 55, 'Kacamata Hitam Merah', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Optic%20yoel/Kacamata%20Hitam%20Merah.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(159, 55, 'Kacamata Hitam Minimalis', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Optic%20yoel/Kacamata%20Hitam%20Minimalis.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(160, 55, 'Kacamata Retro', 35000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Optic%20yoel/Kacamata%20Retro.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(161, 55, 'Kacamata Baca Bulat', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Optic%20yoel/Kacamata%20Baca%20Bulat.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(162, 55, 'Kacamata Baca Oval', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Optic%20yoel/Kacamata%20Baca%20Oval.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(163, 56, 'Bakso Halus Komplit', 20000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20bakso%20indah%20decha/Bakso%20Halus%20Komplit.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(164, 56, 'Bakso Urat Komplit', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20bakso%20indah%20decha/Bakso%20Urat%20Komplit.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(165, 56, 'Bakso Bakar', 8000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Warung%20bakso%20indah%20decha/Bakso%20Bakar.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(166, 57, 'Celana Hitam', 125000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/SistaStoreSMD/Celana%20Hitam.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(167, 57, 'Celana Jeans', 120000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/SistaStoreSMD/Celana%20Jeans.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(168, 57, 'Celana Pendek', 90000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/SistaStoreSMD/Celana%20Pendek.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(169, 57, 'Sendal Slipon', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/SistaStoreSMD/Sendal%20Slipon.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(170, 57, 'Sendal Jepit', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/SistaStoreSMD/Sendal%20Jepit.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(171, 58, 'Sendal Slipon', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/INALORE/Sendal%20Slipon.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(172, 58, 'Sendal Jepit', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/INALORE/Sendal%20Jepit.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(173, 58, 'Sendal Pantai', 25000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/INALORE/Sendal%20Pantai.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(174, 58, 'Celana Chino Cream', 90000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/INALORE/Celana%20Chino%20Cream.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(175, 58, 'Celana Pendek', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/INALORE/Celana%20Pendek.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(176, 59, 'Topi Polo Putih', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/DEKA_store14/Topi%20Polo%20Putih.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(177, 59, 'Topi Los Angeles', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/DEKA_store14/Topi%20Los%20Angeles.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(178, 59, 'Topi NYC', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/DEKA_store14/Topi%20NYC.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(179, 59, 'Polo Shirt', 75000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/DEKA_store14/Polo%20Shirt.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(180, 59, 'Kaos Band', 70000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/DEKA_store14/Kaos%20Band.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(181, 60, 'Sepatu Geoffmax', 150000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Toko%20sepatu%20Hercules/Sepatu%20Geoffmax.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(182, 60, 'Sepatu New Balance', 250000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Toko%20sepatu%20Hercules/Sepatu%20New%20Balance.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(183, 60, 'Sepatu Nike', 350000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Toko%20sepatu%20Hercules/Sepatu%20Nike.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(184, 60, 'Sepatu Vans', 210000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Toko%20sepatu%20Hercules/Sepatu%20Vans.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(185, 60, 'Sepatu Ventella', 150000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Toko%20sepatu%20Hercules/Sepatu%20Ventella.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(186, 61, 'Kaos Kaki Skecher', 15000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Only%20Socks%20-%20Mitra%20Kaos%20Kaki%20Bogor/Kaos%20Kaki%20Skecher.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(187, 61, 'Kaos Kaki Uniqlo', 100000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Only%20Socks%20-%20Mitra%20Kaos%20Kaki%20Bogor/Kaos%20Kaki%20Uniqlo.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(188, 61, 'Kaos Kaki Adidas', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Only%20Socks%20-%20Mitra%20Kaos%20Kaki%20Bogor/Kaos%20Kaki%20Adidas.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(189, 61, 'Kaos Kaki Nike', 50000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Only%20Socks%20-%20Mitra%20Kaos%20Kaki%20Bogor/Kaos%20Kaki%20Nike.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46'),
(190, 61, 'Kaos Kaki Motif', 30000, 0, 'https://storage.googleapis.com/storage-api-jualin/Product/Only%20Socks%20-%20Mitra%20Kaos%20Kaki%20Bogor/Kaos%20Kaki%20Motif.jpg', '2023-06-11 05:27:48', '2023-06-11 05:47:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Diskon` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `id_umkm`, `Nama`, `Harga`, `Diskon`, `createdAt`, `updatedAt`) VALUES
(1, 6, 'Gunting + Blow', 100000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(2, 6, 'Blow Biasa', 50000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(3, 6, 'Coloring', 150000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(4, 6, 'Creambath', 75000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(5, 6, 'Blow Variasi / Catok', 61000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(6, 27, 'Jasa angkutan hasil pertanian per 10 kg', 30000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(7, 27, 'Jasa Penggilingan Bahan Baku Pakan ternak per kg', 2500, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(8, 27, 'Jasa bajak sawah', 150000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(9, 27, 'Jasa Poles Shorter Beras Premium per Liter', 500, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(10, 9, 'Sewa Busana Resepsi Simple', 3000000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(11, 9, 'Sewa Busana Resepsi Elegant', 4500000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(12, 9, 'Sewa Busana Akad', 2000000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(13, 9, 'Tenda Plafon', 15000000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(14, 9, 'Tenda Plafon VIP', 17500000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(15, 7, 'Pagar Minimalis/m2', 325000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(16, 7, 'Relling/m2', 325000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(17, 7, 'Canopy/m2', 325000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(18, 7, 'Tralis', 250000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(19, 7, 'Harmonika/m2', 750000, 0, '2023-06-09 13:59:19', '2023-06-09 13:59:19'),
(20, 13, 'Jilid Buku Mika Tipis', 2500, 0, '2023-06-09 14:02:59', '2023-06-09 14:02:59'),
(21, 13, 'Jilid Buku Mika Tebal', 3000, 0, '2023-06-09 14:02:59', '2023-06-09 14:02:59'),
(22, 13, 'Fotokopi Tulisan/Lembar', 500, 0, '2023-06-09 14:02:59', '2023-06-09 14:02:59'),
(23, 13, 'Fotokopi Gambar', 1000, 0, '2023-06-09 14:02:59', '2023-06-09 14:02:59'),
(24, 13, 'Jasa Pengetikan Tulisan/Lembar', 1000, 0, '2023-06-09 14:02:59', '2023-06-09 14:02:59'),
(25, 62, 'Servis Lengkap', 50000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(26, 62, 'Ganti Rantai & Gear Set', 20000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(27, 62, 'Ganti Van Belt', 10000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(28, 62, 'Ganti Breake Shoe', 8000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(29, 62, 'Ganti Kabel Rem', 7000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(30, 63, 'Servis Mesin Cuci', 70000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(31, 63, 'Tambah Freon', 150000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(32, 63, 'Isi Freon', 250000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(33, 63, 'Bongkar Pasang AC', 350000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(34, 63, 'Service TV', 75000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(35, 64, 'Cuci Kering Lipat/Kg', 4000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(36, 64, 'Cuci Kering Setrika/Kg', 6000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(37, 64, 'Cuci Bed Cover/Item', 25000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(38, 64, 'Cuci Selimut/Item', 20000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(39, 64, 'Cuci Sprei/Item', 20000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(40, 65, 'Cuci AC', 70000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(41, 65, 'Pasang AC', 250000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(42, 65, 'Remote Baru', 85000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(43, 65, 'Isi Freon', 225000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(44, 65, 'Tambah Freon', 150000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(45, 66, 'MakeUp untuk Wisuda', 250000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(46, 66, 'MakeUp untuk Pernikahan', 300000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(47, 66, 'Hijab Styling', 50000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(48, 66, 'Hair Styling', 75000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(49, 66, 'Pasang Aksesoris', 50000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(50, 67, 'Cuci Kering', 4000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(51, 67, 'Cuci Setrika', 6000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(52, 67, 'Gorden', 8000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(53, 67, 'Sepatu', 15000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(54, 67, 'Jaket', 5000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(55, 68, 'Service Rutin', 25000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(56, 68, 'Service CVT', 30000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(57, 68, 'Service Besar', 75000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(58, 68, 'Ganti Oli', 5000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29'),
(59, 68, 'Turun Mesin', 140000, 0, '2023-06-11 12:29:29', '2023-06-11 12:29:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `umkms`
--

CREATE TABLE `umkms` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `Nama_usaha` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Kategori` varchar(255) NOT NULL,
  `No_hp` varchar(255) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `umkms`
--

INSERT INTO `umkms` (`id`, `id_user`, `Nama_usaha`, `Deskripsi`, `Kategori`, `No_hp`, `latitude`, `longitude`, `createdAt`, `updatedAt`) VALUES
(2, 2, 'Kedai milano', 'Usaha yang menjual berbagai jenis makanan harian', 'Kuliner', '082136971788', -0.91165, 119.884, '2023-06-04 16:16:14', '2023-06-10 09:10:07'),
(3, 3, 'Soufenir dan aksesoris', 'Usaha di bidang merchandise soufenir dan aksesoris', 'Seni ', '085871611877', -6.85863, 107.613, '2023-06-04 16:16:14', '2023-06-10 09:10:24'),
(5, 5, 'Peternakan Karya Nur', 'Menjual telur dan bibit ayam dan itik.', 'Peternakan', '082193220315', -5.45025, 119.415, '2023-06-04 16:16:14', '2023-06-04 16:16:14'),
(6, 6, 'Salon kecantikan', 'Salon kecantikan', 'Kecantikan', '085760032848', 2.64489, 98.0329, '2023-06-04 16:20:46', '2023-06-04 16:20:46'),
(7, 7, 'Bengkel Las Inda', 'Melayani pesanan trali jendela, pintu pagar, rak bunga, meja, dll', 'Lain-Lain', '082247081002', -8.77271, 120.603, '2023-06-04 16:20:46', '2023-06-04 16:20:46'),
(8, 8, 'Kios alvino', 'Kios sembako', 'Lain-Lain', '081246690564', 1.32686, 124.782, '2023-06-04 16:20:46', '2023-06-04 16:20:46'),
(9, 9, 'Pelaminan handayani', 'Sewa pelaminan dan baju pengantin ', 'Kecantikan', '085756140291', -5.44737, 120.361, '2023-06-04 16:20:46', '2023-06-10 09:11:27'),
(13, 13, 'Foto copy dan atk', 'Melayani foto copy, jilid, scan, cetak foto dll', 'Percetakan', '082269605754', -3.91739, 104.112, '2023-06-04 16:23:31', '2023-06-04 16:23:31'),
(27, 27, 'Yakin Business', 'YAKIN BUSINESS ADALAH UMKM YANG MENJUAL PRODUK BARANG DAN JASA HASIL PETANI UNTUK MENINGKATKAN PEREKONOMIAN MASYARAKAT SEKITAR,', 'Kelontong', '082280279143', -3.16279, 102.924, '2023-06-05 16:57:25', '2023-06-10 09:16:09'),
(28, 30, 'Kempot resto and cafe', 'Cafe angkringan dan rental PS3', 'Kuliner', '083867000795', -7.8369, 110.181, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(29, 31, 'Rumah Jahit Muqbil', 'Menjahit Pakaian jadi sesuai pesanan', 'Fashion', '082216152764', 0.125213, 117.482, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(30, 32, 'Menjual alat kosmetik online', 'Menjual alat kosmetik secara online. Penghasilan kadang kurang dari 100.000', 'Kecantikan', '082113297342', -0.89476, 100.648, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(31, 33, 'Anaila shop', 'Pakaian anak2 dan barang2 plastik.', 'Fashion', '085343978072', 0.590554, 122.907, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(32, 34, 'Queenza_Craft', 'Usaha bergerak di bidang rajutan handmade.', 'Seni', '081382270337', -5.40318, 105.294, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(33, 35, 'Angkringanpedia Tasikmalaya', 'menjual berbagai macam makanan dan minuman, aneka sate satean wedang ,jahe, kopi renceng', 'Kuliner', '089663875186', -7.32361, 108.226, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(34, 36, 'Ayam Kremes Makwo', 'Usaha saya bernama ayam kremes makwo yang sudah hampir 2 tahun saya jalankan, untuk pemasaran produk yang saya jual saya menggunakan jasa perusahaan grab dan gojek, saya pun membuka kedai sendiri dirumah apabila ada pesanan offline dari tetangga ataupun orang yang memang ingin membeli langsung, produk yang saya jual antara lain ayam goreng kremes, lele goreng kremes, dan bandenv presto kremes', 'Kuliner', '082181678993', -2.91134, 104.715, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(35, 37, 'Usaha jajan kue', 'Usaha mikro..\nMenjual usaha kecil-kecilan', 'Kuliner', '085256850320', 0.510252, 123.025, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(36, 38, 'Ladymar', 'Membuat tas handmade, produk baju', 'Seni', '089516762997', -6.90594, 107.637, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(37, 39, 'ramen 44', 'dimulai sejak tahun 2013 dengan konsep kakilima dengan harga yang terjangkau', 'Kuliner', '081380003993', -7.32209, 108.214, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(38, 40, 'Simply2syarii', 'Jualan pakaian wanita online shop', 'Lain-Lain', '089627215921', -2.95761, 104.74, '2023-06-10 17:13:52', '2023-06-10 17:13:52'),
(39, 41, 'Warung Dhyo', 'Menjual berbagai macam makanan dan minuman', 'Kelontong', '085722421977', -6.31147, 108.296, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(40, 42, 'Jual daging ayam', 'Jual daging ayam potong eceran', 'Kelontong', '082313521239', -7.9069, 110.414, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(41, 43, 'Cathy Dessert&Pastry / M2 Cafe pulisan', 'Harga murah meriah, tapi Rasa tidak murahan.\nEnak, bersih dan halal', 'Kuliner', '081244487667', 1.67185, 125.155, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(42, 44, 'Kedai Azka', 'Jual sarapan pagi dan nasi goreng juga mie goreng', 'Kuliner', '082288150176', -1.81826, 100.837, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(43, 45, 'Zea shop', 'Jualan pakaian anak dan dewasa secara kredit di kampung\nJualan sandal juga', 'Fashion', '082119852292', -7.30215, 108.184, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(44, 46, 'HR FOOD sentul', 'HR FOOD adalah usaha mikro bergerak di bidang jasa penyedia Makanan atau kuliner  berdiri tahun 2014', 'Kuliner', '081382278006', -6.55535, 106.842, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(45, 47, 'Dapur Ngebul Kang Asep', 'Catering Ayam Penyet\nCatering Nasi Uduk/Kuning\nTumpeng komplit\nTumpeng mini\nTumpeng pudding\nBanana Strudel\nPizza Strudel\nPie cake\nBronis kukus keju+Coklat', 'Kuliner', '085778330054', -6.2018, 106.79, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(46, 48, 'Dapur Mama Habsyi', 'Banana strudel\nBolen pisang\nPizza strudel\nPie susu\nPie nanas\nNasiBok Ayam penyet\nNasiBok Kuning/Uduk\nTumpeng sedang komplit\nTumpeng mini kuning/uduk\nTumpeng Pudding\nDonut bomboloni\nBronis kukus keju+coklat', 'Kuliner', '085778330052', -6.20894, 106.782, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(47, 49, 'JUALAN GORENGAN', 'MENJUAL ANEKA GORENGAN', 'Kuliner', '085784607806', -7.99762, 111.899, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(48, 50, 'Basri cell & parfum', 'Jual pulsa, kartu data dan parfum', 'Elektronik', '081340363264', -5.68829, 119.69, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(49, 51, 'Kayla kitchen', 'Berbagai macam masakan nusantara dengan cita rasa tersendiri. Dengan rasa yang oriental yang pas di lidah para penikmat.', 'Kuliner', '081331319577', -7.50152, 112.411, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(50, 52, 'WARKOP', 'membuka usaha warung kopi', 'Lain-Lain', '0895335510314', -7.41647, 112.622, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(51, 53, 'Mie Ayam dan Krispy Campurejo', 'Sejenis snack dan bakmi', 'Kuliner', '082131020848', -7.79769, 111.985, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(52, 54, 'Snack dan jajan pasar assyifa', 'Jasa pembuatan snack dan jajan pasar', 'Kuliner', '081808612175', -7.77159, 110.309, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(53, 55, 'kedai 99 ketanon', 'warung makan', 'Kuliner', '087851486444', -8.04878, 111.906, '2023-06-10 17:16:06', '2023-06-10 17:16:06'),
(54, 56, 'Anna tas collection', 'Usaha mikro produksi tas spunbound/goodiebag/reusable bag/tas sablon yang berdiri sejak 2012', 'Desain', '081232422620', -7.26185, 112.663, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(55, 57, 'Optic yoel', 'Keliling periksa mata', 'Fashion', '08563058213', -7.78792, 112.185, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(56, 58, 'Warung bakso indah decha', 'Usaha saya sudah berdiri sejak tahun 2017\nMenu di warung saya\n-bakso\n-mie ayam\n-miesop\n-mie goreng\n-indomi goreng\n-kopi\n-aneka minuman lainnya', 'Kuliner', '082275847450', 3.49999, 98.2943, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(57, 59, 'SistaStoreSMD', 'Menjual Pakaian, sepatu, sandal, celana, parfum, skincare', 'Fashion', '082154818137', -0.507407, 117.116, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(58, 60, 'INALORE', 'Menjual Pakaian Jadi, dengan Desain bertemakan Pengetahuan Indonesia', 'Fashion', '081210841083', -6.262, 106.72, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(59, 61, 'DEKA\'store14', 'Saya memulai bisnis usaha online sejak 2 tahun silam, berjualan aksesoris PlayStation dan frozen food', 'Elektronik', '0895326127869', -6.1442, 106.787, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(60, 62, 'Toko sepatu Hercules', 'Toko dan Pembuatan sepatu / sendal', 'Fashion', '085753366904', -7.99319, 112.632, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(61, 63, 'Only Socks - Mitra Kaos Kaki Bogor', 'Menjual Aneka macam kaos kaki seperi Kaos Kaki Kantor, Anak-anak sampai Kaos Kaki Muslimah', 'Fashion', '085930421351', -6.65297, 106.87, '2023-06-11 05:13:55', '2023-06-11 05:13:55'),
(62, 64, 'ZAFIRA MOTOR', 'BENGKEL & ONDERDIL MOTOR', 'Otomotif', '085341062286', 1.4297, 124.838, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(63, 65, 'Perorangan', 'Jasa servis elektronik', 'Elektronik', '085363145111', -0.272709, 100.489, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(64, 66, 'Rama laundry House', 'usaha dibidang jasa', 'Lain-Lain', '085247099908', -5.52063, 120.162, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(65, 67, 'Sahabat AC', 'Jasa servis elektronik dan mesin pendingin\nServis AC\nServis Kulkas\nServis Mesin Cuci', 'Elektronik', '081934691189', -7.4864, 112.202, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(66, 68, 'Anny make up', 'Jasa make up panggilan', 'Kecantikan', '089658427743', -6.88701, 107.587, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(67, 69, 'Aninda laundry', 'Menerima jasa cuci laundry', 'Lain-Lain', '082375006640', -2.98258, 104.727, '2023-06-11 12:15:05', '2023-06-11 12:15:05'),
(68, 70, 'Bengkel', 'Menjual jasa dan alat alat motor/sparepart', 'Otomotif', '082344852541', -3.78364, 3361.96, '2023-06-11 12:15:05', '2023-06-11 12:15:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('Customers','Sellers') DEFAULT 'Customers',
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `photo`, `createdAt`, `updatedAt`, `role`, `alamat`) VALUES
(2, 'Aditya Nugraha', 'Aditya123@gmail.com', 'password', NULL, '2023-06-04 22:27:49', '2023-06-04 22:27:49', 'Sellers', 'Jl. Anoa Satu, Kel. Tatura Utara, Kec. Palu Selatan, Kota Palu, Sulawesi Tengah'),
(3, 'Diki Akbar', 'Diki123@gmail.com', 'password', NULL, '2023-06-04 22:27:49', '2023-06-04 22:27:49', 'Sellers', 'Jl Cihamplas, Kel. Ciumbuleuit, Kec. Cidadap, Kota Bandung, Jawa Barat'),
(5, 'Hamzah Dg Lawa', 'Hamzahl123@gmail.com', 'password', NULL, '2023-06-04 22:27:49', '2023-06-04 22:27:49', 'Sellers', 'Jl.muhayyang Desa Patani, Kel. Patani, Kec. Mappakasunggu, Kab. Takalar, Sulawesi Selatan'),
(6, 'Mirsal', 'Mirsal123@gmail.com', 'password', NULL, '2023-06-04 22:42:32', '2023-06-04 22:42:32', 'Sellers', 'Jl Teuku Umar Penanggalan, Kel. Lae Bersih, Kec. Penanggalan, Kota Subulussalam, Aceh'),
(7, 'Yuliana Selfi Linda Jingkang', 'Yuliana123@gmail.com', 'password', NULL, '2023-06-04 22:42:32', '2023-06-04 22:42:32', 'Sellers', 'Kampas, Kel. Golo Kantar, Kec. Borong, Kab. Manggarai Timur, Nusa Tenggara Timur'),
(8, 'MARTEN DAGIE', 'MARTEN123@gmail.com', 'password', NULL, '2023-06-04 22:42:32', '2023-06-04 22:42:32', 'Sellers', 'Tara Tara Tiga, Kel. Taratara Tiga, Kec. Tomohon Barat, Kota Tomohon, Sulawesi Utara'),
(9, 'Nurfadillah Hasim, ST', 'Nurfadillah123@gmail.com', 'password', NULL, '2023-06-04 22:42:32', '2023-06-04 22:42:32', 'Sellers', 'Tanetea, Kel. Bonto Tangnga, Kec. Tamalatea, Kab. Jeneponto, Sulawesi Selatan'),
(13, 'Lisna hendayani', 'Lisnahendayani@gmail.com', 'password', NULL, '2023-06-04 22:50:41', '2023-06-04 22:53:18', 'Sellers', 'Desa Gunung Meraksa , Kel. Gunung Meraksa, Kec. Lubuk Batang, Kab. Ogan Komering Ulu, Sumatera Selatan'),
(27, 'Asep Irama', 'asep10@gmail.com', '$2b$10$SxXjOFR4WFoNpCiMB4Y6ruKfCK71gvr8k2YASwcEVFlL2S3SoD.9y', NULL, '2023-06-05 16:43:00', '2023-06-05 17:01:30', 'Sellers', 'Dusun Iv Desa Sukorejo, Kel. Suko Rejo, Kec. Stl Ulu Terawas, Kab. Musi Rawas, Sumatera Selatan'),
(28, 'habib', 'adasda@gmail.com', '$2b$10$JBTfUVjkSKgIvfw5ftq/L.p/N2xTi5iVasi3Sa8KMSEgl6wMPOaXC', NULL, '2023-06-09 21:28:36', '2023-06-09 21:28:36', 'Sellers', NULL),
(29, 'habib', 'habib@gmail.com', '$2b$10$OiFGQRDO4Xqv0XZvGDM4l.vVej3NAFz17zQ8NiS6V6NvtG5aVUWMu', NULL, '2023-06-09 21:29:57', '2023-06-09 21:29:57', 'Customers', NULL),
(30, 'Mario himawan', 'Mariohimawan123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Lengkong, Donomulyo, Kel. Donomulyo, Kec. Nanggulan, Kab. Kulon Progo, Daerah Istimewa Yogyakarta'),
(31, 'Dina Yulianti', 'DinaYulianti123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jalan A Yani, Gang Selat Bali No 07 , Kel. Tanjung Laut, Kec. Bontang Selatan, Kota Bontang, Kalimantan Timur'),
(32, 'Sarilis Warni', 'SarilisWarni123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jorong Aro Kecamatan Gunung Talang, Kel. Talang, Kec. Gunung Talang, Kab. Solok, Sumatera Barat'),
(33, 'Nirda A. Dai', 'NirdaADai123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Tabongo Barat Kec. Tabongo, Kel. Tabongo Barat, Kec. Tabongo, Kab. Gorontalo, Gorontalo'),
(34, 'Meirina Indri Hapsari', 'MeirinaIndriHapsari123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jl.melati Raya Blok. J.9 No.1, Kel. Sukabumi Indah, Kec. Sukabumi, Kota Bandar Lampung, Lampung'),
(35, 'Ariyana Rizky Tresna', 'AriyanaRizkyTresna123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jl Letkol Komir Kartaman No 18 Kelurahan Lengkongsari Kecamatan Tawang, Kel. Lengkongsari, Kec. Tawang, Kota Tasikmalaya, Jawa Barat'),
(36, 'Yuniarti', 'Yuniarti123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jalan  Delima Putih Komplek Sukarami Indah Block D1 No 1, Kel. Kebun Bunga, Kec. Sukarami, Kota Palembang, Sumatera Selatan'),
(37, 'Sri Amsah', 'SriAmsah123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Dusun Barat, Desa Bongo, Kel. Bongo, Kec. Batudaa Pantai, Kab. Gorontalo, Gorontalo'),
(38, 'Maritania Hidayani', 'MaritaniaHidayani123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Perumahan Griya Curug Permai Blok B5 Jl Cikampak Raya, Kel. Cicadas, Kec. Ciampea, Kab. Bogor, Jawa Barat'),
(39, 'Ilham Retno Sulistyo', 'IlhamRetnoSulistyo123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jl. Ampera 26, Kel. Panglayungan, Kec. Cipedes, Kota Tasikmalaya, Jawa Barat'),
(40, 'Nyimas Sandra Aprilia', 'NyimasSandraAprilia123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jalan Balayudha No.982 Rt.010/004, Kel. Ario Kemuning, Kec. Kemuning, Kota Palembang, Sumatera Selatan'),
(41, 'Dedi Sunendi', 'DediSunendi123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Desa Wanantara Rt 020 Rw 005, Kel. Wanantara, Kec. Sindang, Kab. Indramayu, Jawa Barat'),
(42, 'Achmad romdi', 'Achmadromdi123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Imogiri Bantul Yogyakarta, Kel. Wukirsari, Kec. Imogiri, Kab. Bantul, Daerah Istimewa Yogyakarta'),
(43, 'Debora Ryani Marthin', 'DeboraRyaniMarthin123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Desa Pulisan- Likupang Timur, Kel. Pulisan, Kec. Likupang Timur, Kab. Minahasa Utara, Sulawesi Utara'),
(44, 'Putri Rosita Andani', 'PutriRositaAndani123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Koto Gadang, Kel. Sungai Tunu Utara, Kec. Ranah Pesisir, Kab. Pesisir Selatan, Sumatera Barat'),
(45, 'Ariz Rizaludin', 'ArizRizaludin123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Sukasari, Kel. Sukarindik, Kec. Bungursari, Kota Tasikmalaya, Jawa Barat'),
(46, 'Sri rahmawati', 'Srirahmawati123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Perum Bukit Azzikra Jl Tawakal 2 No 9, Kel. Cipambuan, Kec. Babakan Madang, Kab. Bogor, Jawa Barat'),
(47, 'Asep Jayadi', 'AsepJayadi123@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jalan Kyai Haji Djunaidi Rt.007 Rw.011 No.48, Kel. Palmerah, Kec. Pal Merah, Kota Adm. Jakarta Barat, Dki Jakarta'),
(48, 'Siti Syafitri', 'sitisyafitri@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jalan Haji Djunaidi Kemanggisan Ilir 3 Rt.7 Rw.011 No.48, Kel. Palmerah, Kec. Pal Merah, Kota Adm. Jakarta Barat, Dki Jakarta'),
(49, 'SITI KARIMAH', 'sitikarimah@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jln.masjid No 521, Kel. Karangrejo, Kec. Ngasem, Kab. Kediri, Jawa Timur'),
(50, 'Basri', 'basri@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Manyumbeng, Kel. Biring Kassi, Kec. Binamu, Kab. Jeneponto, Sulawesi Selatan'),
(51, 'Rinta Agustina', 'rintaagustina@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Sooko Gang 8 No 15 , Kel. Sooko, Kec. Sooko, Kab. Mojokerto, Jawa Timur'),
(52, 'M.bagas Ardiansyah', 'mbagasardiansyah@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Dsn. Kemalangan, Rt. 002/rw.003, Ds. Plaosan, Kel. Plaosan, Kec. Wonoayu, Kab. Sidoarjo, Jawa Timur'),
(53, 'Nur Imtihanah', 'nurimtihanah@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jl.olahraga 23 Campurejo-panceng.gresik, Kel. Campurejo, Kec. Panceng, Kab. Gresik, Jawa Timur'),
(54, 'Kusuma Putri Wijayanti', 'kusumaputriwijayanti@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Semarangan 004/009,sidokarto,godean,sleman, Kel. Sidokarto, Kec. Godean, Kab. Sleman, Daerah Istimewa Yogyakarta'),
(55, 'Moch. Heru Ripangi', 'mochheruripangi@gmail.com', 'password', NULL, '2023-06-11 00:02:17', '2023-06-11 00:02:17', 'Sellers', 'Jl. Pahlawan, Gg3, No71, Ketanon, Kedungwaru, Tulungagung, Kel. Ketanon, Kec. Kedungwaru, Kab. Tulungagung, Jawa Timur'),
(56, 'Mujiana', 'Mujiana@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 12:07:16', 'Sellers', 'Jl Wonorejo 4c No.5, Kel. Manukan Kulon, Kec. Tandes, Kota Surabaya, Jawa Timur'),
(57, 'Fitri Agustina', 'FitriAgustina@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:13:00', 'Sellers', 'Jln Singkep No 7, Kel. Gedangsewu, Kec. Pare, Kab. Kediri, Jawa Timur'),
(58, 'Indah decha ramadhani', 'Indahdecharamadhani@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:12:15', 'Sellers', 'Dusun Namo Uncim B, Kel. Naman Jahe, Kec. Salapian, Kab. Langkat, Sumatera Utara'),
(59, 'Nur Badriyah', 'NurBadriyah@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:12:31', 'Sellers', 'Jalan Ulin Gg9 No43 Rt26, Kel. Karang Anyar, Kec. Sungai Kunjang, Kota Samarinda, Kalimantan Timur'),
(60, 'Gias Salim', 'GiasSalim@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:11:58', 'Sellers', 'Jl. Raya Pd. Aren No.16f, Pd. Aren, Kec. Pd. Aren, Kota Tangerang Selatan, Banten 15224, Kel. Pondok Aren, Kec. Pondok Aren, Kota Tangerang Selatan, Banten'),
(61, 'Munasavitri fauziyyah', 'Munasavitrifauziyyah@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:10:54', 'Sellers', 'Komplek Indoruko 34 Al Sebelum Rumah Duka Jelambar, Kel. Jelambar, Kec. Grogol Petamburan, Kota Adm. Jakarta Barat, Dki Jakarta'),
(62, 'Shara Mega Agustina', 'SharaMegaAgustina@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:11:33', 'Sellers', 'Jl Sartono Sh, Kel. Sukun, Kec. Sukun, Kota Malang, Jawa Timur'),
(63, 'Muhamad Rafliansyah', 'MuhamadRafliansyah@gmail.com', 'password', NULL, '2023-06-11 12:07:16', '2023-06-11 19:11:17', 'Sellers', 'Jl. Raya Puncak Gg. Gadog Leles Kp. Cibogo Ii No. 25 Rt05/06 Ds. Cipayung Datar, Megamendung, Bogor 16770, Kel. Cipayung Datar, Kec. Megamendung, Kab. Bogor, Jawa Barat'),
(64, 'Yuriska Tiara Gessoh', 'yuriskatiaragessoh@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Jaga Iii, Kel. Pineleng I, Kec. Pineleng, Kab. Minahasa, Sulawesi Utara'),
(65, 'Ardy Mu\'tamar', 'ardymutamar@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Jl Raya Bukittinggi-payakumbuh Km14 Sungai Cubadak, Kel. Tabek Panjang, Kec. Baso, Kab. Agam, Sumatera Barat'),
(66, 'fitriani', 'fitriani@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Btn Green Valley Blok E17, Sasayya, Bantaeng, Kel. Bonto Sunggu, Kec. Bissappu, Kab. Bantaeng, Sulawesi Selatan'),
(67, 'Achmad Aris Purnomo', 'achmadarispurnomo@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Dusun Mireng Rt 03 Rw 03, Kel. Sumberagung, Kec. Megaluh, Kab. Jombang, Jawa Timur'),
(68, 'Siti. Rohaeni', 'sitirohaeni@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Jl Babakan Jeruk 1 , Kel. Sukagalih, Kec. Sukajadi, Kota Bandung, Jawa Barat'),
(69, 'Mellurinda', 'mellurinda@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Jalan Lunjuk Jaya No 60b Samping Masjid Al-hidayah Lorok Pakjo Ilir Barat I, Kel. Lorok Pakjo, Kec. Ilir Barat I, Kota Palembang, Sumatera Selatan'),
(70, 'Erik Heniker', 'erikheniker@gmail.com', 'password', NULL, '2023-06-11 19:09:58', '2023-06-11 19:09:58', 'Sellers', 'Desa Walay Kecamatan Abuki Kabupaten Konawe, Kel. Walay, Kec. Abuki, Kab. Konawe, Sulawesi Tenggara');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_umkm` (`id_umkm`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_service` (`id_service`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_umkm` (`id_umkm`);

--
-- Indeks untuk tabel `umkms`
--
ALTER TABLE `umkms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `umkms`
--
ALTER TABLE `umkms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkms` (`id`);

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);

--
-- Ketidakleluasaan untuk tabel `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkms` (`id`);

--
-- Ketidakleluasaan untuk tabel `umkms`
--
ALTER TABLE `umkms`
  ADD CONSTRAINT `umkms_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
