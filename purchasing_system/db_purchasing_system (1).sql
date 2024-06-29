-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2024 pada 10.00
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_purchasing_system`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_m_dept`
--

CREATE TABLE `tbl_m_dept` (
  `fld_id_dept` int(11) NOT NULL,
  `fld_nama_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_m_dept`
--

INSERT INTO `tbl_m_dept` (`fld_id_dept`, `fld_nama_dept`) VALUES
(1, 'IT'),
(2, 'Building Service'),
(3, 'Accounting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_m_items`
--

CREATE TABLE `tbl_m_items` (
  `fld_id_items` int(11) NOT NULL,
  `fld_id_supplier` int(11) NOT NULL,
  `fld_id_kategori` int(11) NOT NULL,
  `fld_nama_items` varchar(50) NOT NULL,
  `fld_satuan_items` varchar(15) NOT NULL,
  `fld_merk_items` varchar(50) NOT NULL,
  `fld_tipe_items` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_m_items`
--

INSERT INTO `tbl_m_items` (`fld_id_items`, `fld_id_supplier`, `fld_id_kategori`, `fld_nama_items`, `fld_satuan_items`, `fld_merk_items`, `fld_tipe_items`) VALUES
(1, 2, 3, 'Kertas A4', 'Rim', 'Sinar Dunia', '80 grm'),
(2, 3, 2, 'Kursi Bakso', 'pcs', 'Nasional', 'Kursi Plastik'),
(3, 1, 1, 'Keyboard', 'pcs', 'Logitech', 'LG210');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_m_kategori`
--

CREATE TABLE `tbl_m_kategori` (
  `fld_id_kategori` int(11) NOT NULL,
  `fld_nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_m_kategori`
--

INSERT INTO `tbl_m_kategori` (`fld_id_kategori`, `fld_nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Furniture'),
(3, 'ATK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_m_supplier`
--

CREATE TABLE `tbl_m_supplier` (
  `fld_id_supplier` int(11) NOT NULL,
  `fld_nama_supplier` varchar(50) NOT NULL,
  `fld_alamat_supplier` varchar(250) NOT NULL,
  `fld_telp_supplier` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_m_supplier`
--

INSERT INTO `tbl_m_supplier` (`fld_id_supplier`, `fld_nama_supplier`, `fld_alamat_supplier`, `fld_telp_supplier`) VALUES
(1, 'Toko Komputer', 'Jl. A.Yani', '0813'),
(2, 'Toko Alat Tulis', 'Jl. Pangeran', '0812'),
(3, 'Toko Furniture', 'Jl. Seberang', '0811');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_t_po`
--

CREATE TABLE `tbl_t_po` (
  `fld_id_po` int(11) NOT NULL,
  `fld_no_po` varchar(30) NOT NULL,
  `fld_id_supplier` int(11) NOT NULL,
  `fld_tgl_po` date NOT NULL,
  `fld_termin_po` int(11) NOT NULL,
  `fld_delivery_via` varchar(50) NOT NULL COMMENT 'tgl perkiraan barang datang',
  `fld_tgl_perkiraan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_t_po`
--

INSERT INTO `tbl_t_po` (`fld_id_po`, `fld_no_po`, `fld_id_supplier`, `fld_tgl_po`, `fld_termin_po`, `fld_delivery_via`, `fld_tgl_perkiraan`) VALUES
(1, 'PO/2400001', 1, '2024-06-25', 2, 'antar langsung', '2024-06-28'),
(2, 'PO/2400002', 2, '2024-06-25', 2, 'antar langsung', '2024-06-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_t_po_detail`
--

CREATE TABLE `tbl_t_po_detail` (
  `fld_id_po_detail` int(11) NOT NULL,
  `fld_id_po` int(11) NOT NULL,
  `fld_id_spb_detail` int(11) NOT NULL,
  `fld_harga_items` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_t_po_detail`
--

INSERT INTO `tbl_t_po_detail` (`fld_id_po_detail`, `fld_id_po`, `fld_id_spb_detail`, `fld_harga_items`) VALUES
(1, 1, 1, '230000'),
(2, 2, 2, '56000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_t_spb`
--

CREATE TABLE `tbl_t_spb` (
  `fld_id_spb` int(11) NOT NULL,
  `fld_no_spb` varchar(30) NOT NULL,
  `fld_id_dept` int(11) NOT NULL,
  `fld_tgl_spb` date NOT NULL,
  `fld_approval` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_t_spb`
--

INSERT INTO `tbl_t_spb` (`fld_id_spb`, `fld_no_spb`, `fld_id_dept`, `fld_tgl_spb`, `fld_approval`) VALUES
(1, 'SPB-IT/0001', 1, '2024-06-25', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_t_spb_detail`
--

CREATE TABLE `tbl_t_spb_detail` (
  `fld_id_spb_detail` int(11) NOT NULL,
  `fld_id_spb` int(11) NOT NULL,
  `fld_id_items` int(11) NOT NULL,
  `fld_qty` int(11) NOT NULL,
  `fld_ket` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_t_spb_detail`
--

INSERT INTO `tbl_t_spb_detail` (`fld_id_spb_detail`, `fld_id_spb`, `fld_id_items`, `fld_qty`, `fld_ket`) VALUES
(1, 1, 3, 2, 'mengganti keyboard yang rusak'),
(2, 1, 1, 2, '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_m_dept`
--
ALTER TABLE `tbl_m_dept`
  ADD PRIMARY KEY (`fld_id_dept`);

--
-- Indeks untuk tabel `tbl_m_items`
--
ALTER TABLE `tbl_m_items`
  ADD PRIMARY KEY (`fld_id_items`),
  ADD KEY `fld_id_supplier` (`fld_id_supplier`),
  ADD KEY `fld_id_kategori` (`fld_id_kategori`);

--
-- Indeks untuk tabel `tbl_m_kategori`
--
ALTER TABLE `tbl_m_kategori`
  ADD PRIMARY KEY (`fld_id_kategori`);

--
-- Indeks untuk tabel `tbl_m_supplier`
--
ALTER TABLE `tbl_m_supplier`
  ADD PRIMARY KEY (`fld_id_supplier`);

--
-- Indeks untuk tabel `tbl_t_po`
--
ALTER TABLE `tbl_t_po`
  ADD PRIMARY KEY (`fld_id_po`),
  ADD KEY `fld_id_supplier` (`fld_id_supplier`);

--
-- Indeks untuk tabel `tbl_t_po_detail`
--
ALTER TABLE `tbl_t_po_detail`
  ADD PRIMARY KEY (`fld_id_po_detail`),
  ADD KEY `fld_id_po` (`fld_id_po`),
  ADD KEY `fld_id_spb_detail` (`fld_id_spb_detail`);

--
-- Indeks untuk tabel `tbl_t_spb`
--
ALTER TABLE `tbl_t_spb`
  ADD PRIMARY KEY (`fld_id_spb`),
  ADD UNIQUE KEY `fld_no_spb` (`fld_no_spb`),
  ADD KEY `fld_id_dept` (`fld_id_dept`);

--
-- Indeks untuk tabel `tbl_t_spb_detail`
--
ALTER TABLE `tbl_t_spb_detail`
  ADD PRIMARY KEY (`fld_id_spb_detail`),
  ADD KEY `fld_id_spb` (`fld_id_spb`),
  ADD KEY `fld_id_items` (`fld_id_items`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_m_dept`
--
ALTER TABLE `tbl_m_dept`
  MODIFY `fld_id_dept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_m_items`
--
ALTER TABLE `tbl_m_items`
  MODIFY `fld_id_items` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_m_kategori`
--
ALTER TABLE `tbl_m_kategori`
  MODIFY `fld_id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_m_supplier`
--
ALTER TABLE `tbl_m_supplier`
  MODIFY `fld_id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_t_po`
--
ALTER TABLE `tbl_t_po`
  MODIFY `fld_id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_t_po_detail`
--
ALTER TABLE `tbl_t_po_detail`
  MODIFY `fld_id_po_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_t_spb`
--
ALTER TABLE `tbl_t_spb`
  MODIFY `fld_id_spb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_t_spb_detail`
--
ALTER TABLE `tbl_t_spb_detail`
  MODIFY `fld_id_spb_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_m_items`
--
ALTER TABLE `tbl_m_items`
  ADD CONSTRAINT `tbl_m_items_ibfk_1` FOREIGN KEY (`fld_id_kategori`) REFERENCES `tbl_m_kategori` (`fld_id_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_m_items_ibfk_2` FOREIGN KEY (`fld_id_supplier`) REFERENCES `tbl_m_supplier` (`fld_id_supplier`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_t_po`
--
ALTER TABLE `tbl_t_po`
  ADD CONSTRAINT `tbl_t_po_ibfk_1` FOREIGN KEY (`fld_id_supplier`) REFERENCES `tbl_m_supplier` (`fld_id_supplier`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_t_po_detail`
--
ALTER TABLE `tbl_t_po_detail`
  ADD CONSTRAINT `tbl_t_po_detail_ibfk_1` FOREIGN KEY (`fld_id_po`) REFERENCES `tbl_t_po` (`fld_id_po`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_t_po_detail_ibfk_2` FOREIGN KEY (`fld_id_spb_detail`) REFERENCES `tbl_t_spb_detail` (`fld_id_spb_detail`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_t_spb`
--
ALTER TABLE `tbl_t_spb`
  ADD CONSTRAINT `tbl_t_spb_ibfk_1` FOREIGN KEY (`fld_id_dept`) REFERENCES `tbl_m_dept` (`fld_id_dept`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_t_spb_detail`
--
ALTER TABLE `tbl_t_spb_detail`
  ADD CONSTRAINT `tbl_t_spb_detail_ibfk_2` FOREIGN KEY (`fld_id_items`) REFERENCES `tbl_m_items` (`fld_id_items`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_t_spb_detail_ibfk_3` FOREIGN KEY (`fld_id_spb`) REFERENCES `tbl_t_spb` (`fld_id_spb`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
