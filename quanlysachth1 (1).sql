-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th10 26, 2021 lúc 08:28 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlysachth1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `ID_item` int(11) NOT NULL,
  `SoDH` varchar(10) DEFAULT NULL,
  `MaSach` varchar(10) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaTien` float DEFAULT NULL,
  `GiamGia` float DEFAULT NULL,
  PRIMARY KEY (`ID_item`),
  KEY `SoDH` (`SoDH`),
  KEY `MaSach` (`MaSach`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`ID_item`, `SoDH`, `MaSach`, `SoLuong`, `GiaTien`, `GiamGia`) VALUES
(1, '001', 'KTDC', 10, 30000, 0.1),
(2, '001', 'QTKDTLKD', 5, 20000, 0.2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
CREATE TABLE IF NOT EXISTS `dondathang` (
  `SoDH` varchar(10) NOT NULL,
  `NgayDH` datetime DEFAULT NULL,
  `TrangThaiDH` int(11) DEFAULT NULL,
  `MaKH` varchar(10) DEFAULT NULL,
  `NgayDuKienGiao` datetime DEFAULT NULL,
  `NgayThucTeGiao` datetime DEFAULT NULL,
  `MaNV` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SoDH`),
  KEY `MaKH` (`MaKH`),
  KEY `MaNV` (`MaNV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`SoDH`, `NgayDH`, `TrangThaiDH`, `MaKH`, `NgayDuKienGiao`, `NgayThucTeGiao`, `MaNV`) VALUES
('001', '2020-10-20 09:00:00', 1, '001', '2020-10-20 09:00:00', NULL, NULL),
('002', '2020-12-20 09:00:00', 0, '002', '2020-12-20 09:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `HoKH` varchar(100) DEFAULT NULL,
  `TenKH` varchar(100) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `HoKH`, `TenKH`, `Phone`, `Email`) VALUES
('001', 'Nguyễn Văn', 'An', '098899999', 'an@gmail.com'),
('002', 'Lưu Bình', 'Nguyên', '0978977777', 'nguyen@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` varchar(10) NOT NULL,
  `HotenNV` varchar(50) DEFAULT NULL,
  `GT` varchar(5) DEFAULT NULL,
  `NS` date DEFAULT NULL,
  `MaNVQL` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaNV`),
  KEY `MaNVQL` (`MaNVQL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaxb`
--

DROP TABLE IF EXISTS `nhaxb`;
CREATE TABLE IF NOT EXISTS `nhaxb` (
  `MaXB` varchar(20) NOT NULL,
  `TenXB` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaXB`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhaxb`
--

INSERT INTO `nhaxb` (`MaXB`, `TenXB`, `DiaChi`, `SDT`, `email`) VALUES
('NXBTH', 'Nhà xuất bản tổng hợp', '12 Hai Bà \r\nTrưng. Hà Nội', '0245678612', 'nxbtonghop@gmail.com'),
('NXBGD', 'Nhà xuất bản giáo dục', '14 Đống Đa. \r\nHà Nội', '0247646786', 'nxbgiaoduc@gmail.com'),
('NXBTK', 'Nhà xuất bản thống kê', '1 Bình Trị\r\nĐông. TPHCM', '0285638613', 'nxbthongke@gmail.com'),
('NXBKHKT', 'Nhà xuất bản khoa học kỹ thuật', '13 \r\nVõ Văn Tần, TPHCM', '0285678614', 'nxbkhkt@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

DROP TABLE IF EXISTS `sach`;
CREATE TABLE IF NOT EXISTS `sach` (
  `MaSach` varchar(10) NOT NULL,
  `TenSach` varchar(100) DEFAULT NULL,
  `SoTrang` int(11) DEFAULT NULL,
  `NgayXB` date DEFAULT NULL,
  `MaTL` varchar(10) DEFAULT NULL,
  `MaXB` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaTL` (`MaTL`),
  KEY `MaXB` (`MaXB`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`MaSach`, `TenSach`, `SoTrang`, `NgayXB`, `MaTL`, `MaXB`) VALUES
('THDC', 'Tin học đại cương', 20, '0000-00-00', 'TH', 'NXBTH'),
('THVP', 'Tin học văn phòng', 50, '0000-00-00', 'TH', 'NXBTH'),
('THKT', 'Tin học văn phòng cho kế toán', 60, '0000-00-00', 'TH', 'NXBGD'),
('THCT', 'Tin học văn phòng cho công trình', 30, '0000-00-00', 'TH', 'NXBGD'),
('KTDC', 'kế toán đại cương', 40, '0000-00-00', 'KT', 'NXBGD'),
('QTKDNLKD', 'Nguyên lý kinh doanh', 90, '0000-00-00', 'QTKD', 'NXBTH'),
('QTKDTLKD', 'Triết lý kinh doanh', 90, '0000-00-00', 'QTKD', 'NXBTK'),
('TNNCTN', 'Cấp thoát nước', 40, '0000-00-00', 'TNN', 'NXBTK'),
('KTMTCB', 'Kỹ thuật môi trường cơ bản', 20, '0000-00-00', 'KTMT', 'NXBKHKT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach_tacgia`
--

DROP TABLE IF EXISTS `sach_tacgia`;
CREATE TABLE IF NOT EXISTS `sach_tacgia` (
  `MaTG` varchar(20) NOT NULL,
  `MaSach` varchar(10) NOT NULL,
  PRIMARY KEY (`MaTG`,`MaSach`),
  KEY `MaSach` (`MaSach`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sach_tacgia`
--

INSERT INTO `sach_tacgia` (`MaTG`, `MaSach`) VALUES
('001', 'KTDC'),
('001', 'QTKDNLKD'),
('001', 'THDC'),
('001', 'THVP'),
('001', 'TNNCTN'),
('002', 'KTMTCB'),
('002', 'QTKDNLKD'),
('002', 'THDC'),
('002', 'THVP'),
('002', 'TNNCTN'),
('003', 'THKT'),
('004', 'KTDC'),
('004', 'THKT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
CREATE TABLE IF NOT EXISTS `tacgia` (
  `MaTG` varchar(20) NOT NULL,
  `TenTG` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MaTG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`MaTG`, `TenTG`, `DiaChi`, `SDT`, `email`) VALUES
('001', 'Phạm Hữu Độ', 'Hà Nội', '0988888888', 'huudo@gmail.com'),
('002', 'Phạm An Bình', 'HCM', '0988675555', 'anbinh@gmail.com'),
('003', 'Viên An', 'HCM', '098122211', 'anvien@gmail.com'),
('004', 'Viên Thanh Nhã', 'CT', '093122221', 'nhavien@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

DROP TABLE IF EXISTS `theloai`;
CREATE TABLE IF NOT EXISTS `theloai` (
  `MaTL` varchar(10) NOT NULL,
  `TenTL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaTL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`MaTL`, `TenTL`) VALUES
('TH', 'Tin học đại cương fsdf'),
('KT', 'Kế toán'),
('QTKD', 'Quản trị Kinh Doanh'),
('TNN', 'Tài Nguyên Nước'),
('KTMT', 'Kỹ thuật môi trường');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
