-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jun 2023 pada 17.49
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

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `id_user`, `id_product`, `id_service`, `Rating`, `Comment`, `createdAt`, `updatedAt`) VALUES
(1, 25, NULL, 2, 5, 'Mantap, sesuai harapan', '2023-06-02 10:58:37', '2023-06-02 10:58:37');

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
(2, 2, 'Sewa baju pengantin', 200000, 0, '2023-06-02 10:57:40', '2023-06-02 10:57:40');

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
(2, 24, 'Ojek', 'Ojek', 'Lain-Lain', '08535721902', 1.26306, 124.788, '2023-06-02 10:18:17', '2023-06-02 10:18:17'),
(3, 24, 'Ojek', 'Ojek', 'Lain-Lain', '08535721902', 1.26306, 124.788, '2023-06-02 14:29:12', '2023-06-02 14:29:12');

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
(24, 'Ari Mulyanto', 'ari123@example.com', '$2b$10$FjXmsYvH40uA3.VymAsa3uS18gS3trw8jc0BGWL2J8Mfw2Rj8CKcO', '2023-06-02T07-53-06.208Z-IMG20230530114319.jpg', '2023-06-02 07:51:02', '2023-06-02 07:53:06', 'Sellers', 'Jl Priksan, Gg Bengkel'),
(25, 'Ilham Andre', 'antibegal87@gmail.com', '$2b$10$CXzs3axjH1yThB2vlrpifuPsi.PGuXCESPIU8lEg.QJ0s9kVgSu2W', NULL, '2023-06-02 10:15:08', '2023-06-02 10:15:08', 'Customers', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `umkms`
--
ALTER TABLE `umkms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
