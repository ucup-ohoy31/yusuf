-- phpMyAdmin SQL Dump
-- version 2.6.4-pl4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Waktu pembuatan: 09. Oktober 2024 jam 15:56
-- Versi Server: 5.0.16
-- Versi PHP: 5.1.1
-- 
-- Database: `db_202104041`
-- 

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `barangg`
-- 

CREATE TABLE `barangg` (
  `id` int(10) NOT NULL auto_increment,
  `nama` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `tgl_update` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data untuk tabel `barangg`
-- 

INSERT INTO `barangg` VALUES (1, 'Deterjen Bubuk', 125, '2021-03-18', 'Erwin', 8000);
INSERT INTO `barangg` VALUES (2, 'Sabun Cuci Cair', 0, '2021-03-18', 'Erwin', 5000);
INSERT INTO `barangg` VALUES (3, 'Pewangi ', 100, '2021-03-18', 'Erwin', 10000);

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `jenis`
-- 

CREATE TABLE `jenis` (
  `id` int(10) NOT NULL auto_increment,
  `jenis` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data untuk tabel `jenis`
-- 

INSERT INTO `jenis` VALUES (1, 'Paket 1', 10000);
INSERT INTO `jenis` VALUES (2, 'Paket 2', 5000);
INSERT INTO `jenis` VALUES (3, 'Paket 3 Cuci karpet', 12000);

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `konsumen`
-- 

CREATE TABLE `konsumen` (
  `id` int(5) NOT NULL auto_increment,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data untuk tabel `konsumen`
-- 

INSERT INTO `konsumen` VALUES (1, 'Irwansyah', 'Jl. Wild West No.12', '082445129182');

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `pemakaian`
-- 

CREATE TABLE `pemakaian` (
  `id` int(10) NOT NULL auto_increment,
  `tgl_pakai` date NOT NULL,
  `barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data untuk tabel `pemakaian`
-- 

INSERT INTO `pemakaian` VALUES (1, '2016-02-23', 'Deterjen Bubuk', 10);

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `pembelian`
-- 

CREATE TABLE `pembelian` (
  `no` int(10) NOT NULL auto_increment,
  `tgl` date NOT NULL,
  `totali` int(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `barang` varchar(100) NOT NULL,
  `totalh` int(100) NOT NULL,
  PRIMARY KEY  (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Dumping data untuk tabel `pembelian`
-- 

INSERT INTO `pembelian` VALUES (1, '2016-02-23', 10, 'Erwin', 'Deterjen Bubuk', 80000);
INSERT INTO `pembelian` VALUES (2, '2016-02-23', 2, 'Erwin', 'Deterjen Bubuk', 16000);
INSERT INTO `pembelian` VALUES (3, '2021-03-18', 123, 'Erwin', 'Deterjen Bubuk', 984000);
INSERT INTO `pembelian` VALUES (4, '2021-03-18', 0, 'Erwin', 'Sabun Cuci Cair', 0);
INSERT INTO `pembelian` VALUES (5, '2021-03-18', 100, 'Erwin', 'Pewangi ', 1000000);

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `pengguna`
-- 

CREATE TABLE `pengguna` (
  `id` int(100) NOT NULL auto_increment,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('Administrator','Karyawan','Konsumen') NOT NULL,
  `nik` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `gender` enum('Laki laki','Perempuan') NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Dumping data untuk tabel `pengguna`
-- 

INSERT INTO `pengguna` VALUES (1, 'firdaus ripai', 'Admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Administrator', '123456789', 'Bogor', '0895345417756', 'Perempuan');
INSERT INTO `pengguna` VALUES (5, 'Ahmad Bagus Saputro', 'ahmad', 'dc96b97c4ffbead46ca25ef5d4b77cbe', 'Karyawan', '0153698784', 'Jl. Taruna Jaya', '082125510572', 'Laki laki');
INSERT INTO `pengguna` VALUES (6, 'Firdaus Ripai', 'Daus', '81dc9bdb52d04dc20036dbd8313ed055', 'Karyawan', '202104041', 'jl. bhakti abri', '08126765858905', 'Laki laki');

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `supplier`
-- 

CREATE TABLE `supplier` (
  `id` int(10) NOT NULL auto_increment,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data untuk tabel `supplier`
-- 

INSERT INTO `supplier` VALUES (1, 'Erwin', 'Jl. Water Park No.18', '08178171123');

-- --------------------------------------------------------

-- 
-- Struktur dari tabel `transaksi`
-- 

CREATE TABLE `transaksi` (
  `id` int(5) NOT NULL auto_increment,
  `jenis` varchar(100) NOT NULL,
  `tarif` int(100) NOT NULL,
  `diskon` int(100) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_ambil` date NOT NULL,
  `berat` int(10) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `konsumen` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data untuk tabel `transaksi`
-- 

INSERT INTO `transaksi` VALUES (1, 'Paket 1', 100000, 0, '2016-02-23', '2016-03-01', 10, 'khalid', 'Irwansyah');
INSERT INTO `transaksi` VALUES (2, 'Paket 2', 50000, 0, '2016-02-23', '2016-03-01', 10, 'khalid', 'Irwansyah');
INSERT INTO `transaksi` VALUES (3, 'Paket 1', 180000, 0, '2016-02-23', '2016-03-01', 20, 'khalid', 'Irwansyah');
INSERT INTO `transaksi` VALUES (4, 'Paket 2', 90000, 0, '2016-02-23', '2016-03-01', 20, 'khalid', 'Irwansyah');
INSERT INTO `transaksi` VALUES (5, 'Paket 1', 180000, 0, '2020-03-12', '2020-03-12', 20, 'Admin', 'Irwansyah');
INSERT INTO `transaksi` VALUES (6, 'Paket 1', 50000, 0, '2021-03-18', '2021-01-03', 5, 'Daus', 'Irwansyah');
INSERT INTO `transaksi` VALUES (7, 'Paket 1', 50000, 0, '2021-03-18', '2021-01-18', 5, 'Daus', 'Irwansyah');
