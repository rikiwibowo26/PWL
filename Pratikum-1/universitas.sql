-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Apr 2022 pada 03.08
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
-- Database: `universitas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_ekonomi`
--

CREATE TABLE `mahasiswa_ekonomi` (
  `nim` char(9) DEFAULT NULL,
  `nama` char(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `tempat_lahir` char(50) DEFAULT NULL,
  `IPK` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa_ekonomi`
--

INSERT INTO `mahasiswa_ekonomi` (`nim`, `nama`, `umur`, `tempat_lahir`, `IPK`) VALUES
('089023013', 'Alex\r\nSupriyanto', 23, 'Surabaya', '2.90');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_rmik`
--

CREATE TABLE `mahasiswa_rmik` (
  `nim` char(9) DEFAULT NULL,
  `nama` char(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `tempat_lahir` char(50) DEFAULT NULL,
  `IPK` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa_rmik`
--

INSERT INTO `mahasiswa_rmik` (`nim`, `nama`, `umur`, `tempat_lahir`, `IPK`) VALUES
('089045001', 'Andi Suryo', 23, 'Jakarta', '2.70');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
