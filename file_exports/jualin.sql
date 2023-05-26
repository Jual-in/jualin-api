-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Bulan Mei 2023 pada 17.17
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
  `id_umkm` int(11) DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Diskon` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `id_umkm`, `Nama`, `Harga`, `Photo`, `createdAt`, `updatedAt`, `Diskon`) VALUES
(6, 1, 'Biji kopi luak', '12000.00', '2023-05-25T08-26-29.526Z-biji.jpeg', '2023-05-25 08:18:35', '2023-05-25 08:26:29', '0.00'),
(9, 2, 'Gelang Kaoka', '75000.00', '2023-05-25T15-16-08.284Z-3.jpg', '2023-05-25 15:16:08', '2023-05-25 15:16:08', '999.99');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `id_user`, `id_product`, `id_service`, `rating`, `comment`, `createdAt`, `updatedAt`) VALUES
(6, 18, 9, NULL, 4, 'Saya sangat suka dengan produk ini!', '2023-05-26 14:10:24', '2023-05-26 14:10:24'),
(7, 18, NULL, 3, 5, 'Mantap, sesuai harapan', '2023-05-26 14:10:53', '2023-05-26 14:10:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Diskon` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `id_umkm`, `Nama`, `Harga`, `createdAt`, `updatedAt`, `Diskon`) VALUES
(3, 8, 'Smoothing', '150000.00', '2023-05-25 08:55:48', '2023-05-25 15:19:50', '999.99'),
(5, 11, 'Sewa baju toga', '210000.00', '2023-05-25 15:02:49', '2023-05-25 15:02:49', '0.00'),
(6, 11, 'Sewa baju pengantin', '200000.00', '2023-05-26 14:42:25', '2023-05-26 14:42:25', '0.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `umkms`
--

CREATE TABLE `umkms` (
  `id` int(11) NOT NULL,
  `Nama_pemilik` varchar(255) DEFAULT NULL,
  `Nama_usaha` varchar(255) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Kategori` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_hp` varchar(20) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `umkms`
--

INSERT INTO `umkms` (`id`, `Nama_pemilik`, `Nama_usaha`, `Deskripsi`, `Kategori`, `Alamat`, `No_hp`, `latitude`, `longitude`, `createdAt`, `updatedAt`) VALUES
(1, 'Widi Widayat Y', 'DeepHert Coffee', 'Kami menjual beberapa jenis biji kopi dari beberapa daerah di Indonesia.', 'Cafe', 'Griya Safiya Blok C.5, Kel. Pakembaran, Kec. Slawi, Kab. Tegal, Jawa Tengah', '089899879900', '-6.974008', '109.123633', '2023-05-24 14:15:18', '2023-05-24 15:04:58'),
(2, 'Aditya Nugraha', 'Kedai milano', 'Usaha yang menjual berbagai jenis makanan harian', 'Katering', 'Katering', 'Katering', '0.000000', '119.884413', '2023-05-24 14:28:02', '2023-05-24 14:28:02'),
(3, 'Diki Akbar', 'Soufenir dan aksesoris', 'Usaha di bidang merchandise soufenir dan aksesoris', 'Seni Kerajinan', 'Seni Kerajinan', 'Seni Kerajinan', '0.000000', '107.612654', '2023-05-24 14:40:59', '2023-05-24 14:40:59'),
(4, 'Narwanto', 'Najune', 'Kerajinan aksesoris perhiasan dan dekoratif berbahan dasar arang kayu kombinasi bahan-bahan alam lainnya. Desain unik dan etnik dan selalu limited edition setiap desainnya.', 'Seni Kerajinan', 'Jl. Kurnia Gang Intansari No 7 Landasan Ulin, Kel. Landasan Ulin Utara, Kec. Liang Anggang, Kota Banjarbaru, Kalimantan Selatan', '0811504707', '-3.416999', '114.733504', '2023-05-24 14:47:37', '2023-05-24 14:47:37'),
(5, 'Dirman', 'PENJUAL SARUNG & PETANI', 'Bertani dan bejualan sarung keliling', 'Pertanian', 'Galesong, Kel. Boddia, Kec. Galesong, Kab. Takalar, Sulawesi Selatan', '085320078141', '-5.327856', '119.362781', '2023-05-24 14:47:37', '2023-05-24 14:47:37'),
(6, 'Hamzah Dg Lawa', 'Peternakan Karya Nur', 'Menjual telur dan bibit ayam dan itik.', 'Peternakan', 'Jl.muhayyang Desa Patani, Kel. Patani, Kec. Mappakasunggu, Kab. Takalar, Sulawesi Selatan', '082193220315', '-5.450247', '119.415030', '2023-05-24 14:47:37', '2023-05-24 14:47:37'),
(7, 'Diki Akbar', 'Perorangan', 'Menjual berbagai Merchandise soufenir dan aksesoris', 'Seni Kerajinan', 'Jl Cihamplas, Kel. Cipaganti, Kec. Coblong, Kota Bandung, Jawa Barat', '085871611877', '-6.896730', '107.604537', '2023-05-24 14:47:37', '2023-05-24 14:47:37'),
(8, 'Mirsal', 'Salon kecantikan', 'Salon kecantikan', 'Kecantikan', 'Jl Teuku Umar Penanggalan, Kel. Lae Bersih, Kec. Penanggalan, Kota Subulussalam, Aceh', '085760032848', '2.644886', '98.032882', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(9, 'Yuliana Selfi Linda Jingkang', 'Bengkel Las Inda', 'Melayani pesanan trali jendela, pintu pagar, rak bunga, meja, dll', 'Lain-Lain', 'Kampas, Kel. Golo Kantar, Kec. Borong, Kab. Manggarai Timur, Nusa Tenggara Timur', '082247081002', '-8.772712', '120.602730', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(10, 'MARTEN DAGIE', 'Kios alvino', 'Kios sembako', 'Lain-Lain', 'Tara Tara Tiga, Kel. Taratara Tiga, Kec. Tomohon Barat, Kota Tomohon, Sulawesi Utara', '081246690564', '1.326862', '124.782365', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(11, 'Nurfadillah Hasim, ST', 'Pelaminan handayani', 'Sewa pelaminan dan baju pengantin ', 'Tata Rias', 'Tanetea, Kel. Bonto Tangnga, Kec. Tamalatea, Kab. Jeneponto, Sulawesi Selatan', '085756140291', '-5.447370', '120.360846', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(12, 'Darsono Hasudungan', 'Ladang Bang Juntak', 'Menanam padi dan jagung', 'Pertanian', 'Lumban Suhi, Kel. Lumban Ss Dolok, Kec. Pangururan, Kab. Samosir, Sumatera Utara', NULL, '0.000000', '0.000000', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(13, 'Fendy Mardycho', 'Tempe kedelai', 'Usaha tempe kedelai daun pisang', 'Warung Makan', 'Jalan Masjid No 151 A Karang Rena, Kel. Karangrena, Kec. Maos, Kab. Cilacap, Jawa Tengah', '085741748374', '-7.610036', '109.131520', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(14, 'Gabriel poen', 'Restoran sentosa live seafood ', 'Modal sendiri', 'Restoran', 'Kelapa Gading , Kel. Pegangsaan Dua, Kec. Kelapa Gading, Kota Adm. Jakarta Utara, Dki Jakarta', NULL, '-6.165828', '106.915202', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(15, 'Sri Meliana Saragih', 'Melyana Berbelanja', 'Menjual barang - barang', 'Lain-Lain', 'Jl. Fl. Tobing, Kel. Parsaoran I, Kec. Pangururan, Kab. Samosir, Sumatera Utara', NULL, '2.621938', '98.702699', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(16, 'MULYADI', 'Memelihara ayam potong', 'Mohon bantuan pertenakan ayam potong', 'Peternakan', 'Keh Nibong, Kel. Keh Nibong, Kec. Nibong, Kab. Aceh Utara, Aceh', '085260437763', '5.071903', '97.252475', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(17, 'Nindi Kumalaning Tiyas', 'Ndoro Bei', 'Usaha olahan makanan daging ayam, diolah menjadi makanan siap saji berupa pentol, sempol, siomay.', 'Warung Makan', 'Dusun Jagalan Rt 8 Rw 4 Desa Kanigoro Kec Kras Kab Kediri, Kel. Kanigoro, Kec. Kras, Kab. Kediri, Jawa Timur', '085606947957', '0.000000', '0.000000', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(18, 'Ahsan Khodri', 'Cahaya Jasmine', 'Mengumpulkan limbah minyak goreng bekas dari rumah-rumah dan industri makanan, agar tidak di buang sembarangan yg dapat berdampak buruk mencemari lingkungan.', 'Lain-Lain', 'Jl. Pemuda No 85 Rt 02 Rw 04 Kranji, Kel. Kranji, Kec. Bekasi Barat, Kota Bekasi, Jawa Barat', '08813021065', '-6.226028', '106.976164', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(19, 'Lexi Kembuan', 'Petanian', 'Lahan', 'Pertanian', 'Kaayuran Atas, Kel. Kaayuran Atas, Kec. Langowan Selatan, Kab. Minahasa, Sulawesi Utara', '085241513089', '1.122359', '124.841721', '2023-05-24 14:50:09', '2023-05-24 14:50:09'),
(20, 'Tineke Korompis', 'Menjahit', 'Baju', 'Aksesoris Fashion', 'Tounelet, Kel. Tounelet, Kec. Langowan Barat, Kab. Minahasa, Sulawesi Utara', '08535721902', '1.263056', '124.787888', '2023-05-24 14:50:09', '2023-05-24 14:50:09');

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
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `photo`, `createdAt`, `updatedAt`) VALUES
(18, 'Ari Mulyanto', 'ari123@example.com', '$2b$10$gJJr3zdDPR16CbOYUfk2H.0jeNTjCL22mH6MN3a2AkJ3TTaZsqkPG', '2023-05-26T14-27-37.637Z-1.jpg', '2023-05-26 13:40:33', '2023-05-26 14:28:02');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `umkms`
--
ALTER TABLE `umkms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkms` (`Id`);

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
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkms` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
