-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Apr 2022 pada 10.57
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kendaraan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kendaraan`
--

CREATE TABLE `t_kendaraan` (
  `no_plat` varchar(12) NOT NULL,
  `id_type` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `tarif` int(11) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pelanggan`
--

CREATE TABLE `t_pelanggan` (
  `no_ktp` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sopir`
--

CREATE TABLE `t_sopir` (
  `id_sopir` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `sim` char(1) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tipe`
--

CREATE TABLE `t_tipe` (
  `id_type` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_transaksi`
--

CREATE TABLE `t_transaksi` (
  `no_transaksi` int(11) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `tanggal_pinjam_r` date NOT NULL,
  `tanggal_kembali_r` date NOT NULL,
  `tgl_kembali_real` date NOT NULL,
  `jam_kembali_real` time NOT NULL,
  `jam_kembali` time NOT NULL,
  `denda` int(11) NOT NULL,
  `km_pinjam` int(11) NOT NULL,
  `km_kembali` int(11) NOT NULL,
  `bbm_pinjam` int(11) NOT NULL,
  `bbm_kembali` int(11) NOT NULL,
  `kondisi_pinjam` text NOT NULL,
  `kondisi_kembali` text NOT NULL,
  `kerusakan` text NOT NULL,
  `biaya_rusak` int(11) NOT NULL,
  `biaya_bbm` int(11) NOT NULL,
  `id_sopir` int(11) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `no_plat` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_kendaraan`
--
ALTER TABLE `t_kendaraan`
  ADD PRIMARY KEY (`no_plat`),
  ADD KEY `id_type` (`id_type`);

--
-- Indeks untuk tabel `t_pelanggan`
--
ALTER TABLE `t_pelanggan`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indeks untuk tabel `t_sopir`
--
ALTER TABLE `t_sopir`
  ADD PRIMARY KEY (`id_sopir`);

--
-- Indeks untuk tabel `t_tipe`
--
ALTER TABLE `t_tipe`
  ADD PRIMARY KEY (`id_type`);

--
-- Indeks untuk tabel `t_transaksi`
--
ALTER TABLE `t_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `no_plat` (`no_plat`),
  ADD KEY `id_sopir` (`id_sopir`),
  ADD KEY `no_ktp` (`no_ktp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_sopir`
--
ALTER TABLE `t_sopir`
  MODIFY `id_sopir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_tipe`
--
ALTER TABLE `t_tipe`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_transaksi`
--
ALTER TABLE `t_transaksi`
  MODIFY `no_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_kendaraan`
--
ALTER TABLE `t_kendaraan`
  ADD CONSTRAINT `id_type` FOREIGN KEY (`id_type`) REFERENCES `t_tipe` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_transaksi`
--
ALTER TABLE `t_transaksi`
  ADD CONSTRAINT `id_sopir` FOREIGN KEY (`id_sopir`) REFERENCES `t_sopir` (`id_sopir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_ktp` FOREIGN KEY (`no_ktp`) REFERENCES `t_pelanggan` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `no_plat` FOREIGN KEY (`no_plat`) REFERENCES `t_kendaraan` (`no_plat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
