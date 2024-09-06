CREATE DATABASE WebThueXeMay;

CREATE TABLE LoaiXe(
	MaLoai varchar(30) not null primary key,
	LoaiXe nvarchar(50) null,
	GiaThueCoBan money null,
	MoTa nvarchar(MAX) null,
	DanhGia int null
);

CREATE TABLE DiaDiem(
	MaDiaDiem varchar(10) not null primary key,
	TenDiaDiem nvarchar(50) null,
	DiaChi nvarchar(300) null,
	SoLuong int null
);



CREATE TABLE XeMay(
	MaXe varchar(10) not null primary key,
	MaLoai varchar(30) null,
	MaDiaDiem varchar(10) null,
	BienSoXe varchar(15) null,
	TenXe nvarchar(50) null,
	GiaThue money null,
	TrangThai nvarchar(50) null,

	foreign key(MaLoai) references LoaiXe(MaLoai),
	foreign key(MaDiaDiem) references DiaDiem(MaDiaDiem)

);


CREATE TABLE KhachHang(
	MaKH varchar(10) not null primary key,
	HoTen nvarchar(50) null,
	GioiTinh nvarchar(5) null,
	DiaChi nvarchar(300) null,
	SDT varchar(10) null,
	Email varchar(50) null,
	CCCD varchar(12) null 
);

CREATE TABLE NhanVien(
	MaNV varchar(15) not null primary key,
	HoTen nvarchar(30) not null,
	DiaChi nvarchar(300) null,
	GioiTinh nvarchar(5) null,
	CaLamViec nvarchar(20) null,
	SDT varchar(10) null,
	CCCD varchar(12) null
);

CREATE TABLE HoaDon(
	MaHD varchar(10) not null,
	MaKH varchar(10) not null,
	MaNV varchar(15) not null,
	NgayTaoHD datetime null,
	TrangThai nvarchar(50) null,
	TongTien money null,
	GhiChu text null,
	

	primary key (MaHD),
	foreign key(MaKH) references KhachHang(MaKH),
	foreign key(MaNV) references NhanVien(MaNV)
);

CREATE TABLE ChiTietHD(
		MaHD varchar(10) not null,
		MaXe varchar(10) not null,
		NgayThue datetime null,
		NgayTra datetime null,
		SoLuong int null,
		DonGia money null,
		ThanhTien money null,
		GhiChu text null,

		primary key(MaHD,MaXe),
		foreign key(MaHD) references HoaDon(MaHD),
		foreign key (MaXe) references XeMay(MaXe)
);


INSERT INTO LoaiXe(MaLoai,LoaiXe,GiaThueCoBan,MoTa,DanhGia)
VALUES
('XSO',N'Xe Số',150000,N'Xe máy phổ thông, thiết kế đơn giản, dễ sử dụng và tiết kiệm nhiên liệu, phù hợp di chuyển trong thành phố hoặc trên những quãng đường ngắn',NULL),
('XTG',N'Xe Tay Ga',200000,N'Xe tự động, tiện lợi, thiết kế thời trang, lý tưởng cho di chuyển trong thành phố',NULL),
('XTC',N'Xe Tay Côn',300000,N'Xe số tay mạnh mẽ, dành cho người thích cảm giác lái thể thao',NULL),
('PKL',N'Xe Phân Khối Lớn',500000,N'Xe phân khối lớn: Xe mạnh mẽ, tốc độ cao, phù hợp với tay lái có kinh nghiệm và đam mê khám phá',NULL);


INSERT INTO DiaDiem(MaDiaDiem,TenDiaDiem,DiaChi,SoLuong)
VALUES('HN-01',N'Hồ Hoàn Kiếm',N'Số 3 Hoàn Kiếm, Hà Nội',10),
('HN-02',N'Ngã Tư Sở',N'Số 115 Ngã Tư Sở, Hà Nội',6),
('HN-03',N'Tam Trinh',N'116 Tam Trinh, Hoàng Mai, Hà Nội',15),
('HN-04',N'Bách Khoa',N'Số 1 Phường Bách Khoa, Hoàng Mai, Hà Nội',5),
('HN-05',N'Cầu Giấy',N'215 Cầu Giấy, Hà Nội',8),
('HN-06',N'Xa La',N'Ngã 3 Xa La, Hà Đông, Hà Nội',12);


INSERT INTO XeMay(MaXe,MaLoai,MaDiaDiem,BienSoXe,TenXe,GiaThue,TrangThai)
VALUES
('XM01','XSO','HN-01','29-B1 244.17','Honda Blade 110',150000,N'Chưa cho thuê'),
('XM02','XSO','HN-02','18-K4 3551','Yamaha Sirius',150000,N'Đang bảo trì'),
('XM03','XSO','HN-03','34-C9 444.43','Yamaha Jupiter',150000,N'Đang cho thuê'),
('XM04','XSO','HN-04','29-B7 090.01','Honda Wave RS110',150000,N'Đang cho thuê'),
('XM05','XTG','HN-01','29-S1 213.78','Yamaha Nouvo Automatic',200000,N'Chưa cho thuê'),
('XM06','XTG','HN-05','31-A1 417.60','Honda Vision',200000,N'Đang cho thuê'),
('XM07','XTG','HN-01','29-B1 331.43','Honda Airblade',200000,N'Chưa cho thuê'),
('XM08','XTC','HN-04','29-F1 679.80','Honda Winner 150',300000,N'Đang cho thuê'),
('XM09','XTC','HN-06','18-X3 119.17','Yamaha Exciter',300000,N'Chưa cho thuê'),
('XM10','PKL','HN-03','18-A1 288.03','Honda CB300r',500000,N'Chưa cho thuê')
;

INSERT INTO KhachHang(MaKH,HoTen,GioiTinh,DiaChi,SDT,Email,CCCD)
VALUES
('KH01',N'Nguyễn An',N'Nam',N'Hoàng Mai, Hà Nội','0987654888','ann@gmail.com','00109845532'),
('KH02',N'Nguyễn Văn Ba',N'Nam',N'Nam Từ Liêm, Hà Nội','0917655848','ba33@gmail.com','002340176521'),
('KH03',N'Trần Thị Na',N'Nữ',N'Nam Từ Liêm, Hà Nội','0901765414','natran@gmail.com','008045676542'),
('KH04',N'Nguyễn Thị Ánh',N'Nữ',N'Hà Đông, Hà Nội','0397665213','anhnguyen@gmail.com','001340567891'),
('KH05',N'Đào Duy Hùng',N'Nam',N'Cầu Giấy, Hà Nội','0376548887','hungdd@gmail.com','037340181721'),
('KH06',N'Tạ Thái Lan',N'Nữ',N'Hoàng Mai, Hà Nội','0947655412','lantt@gmail.com','027034017002'),
('KH07',N'Mai Văn Tuấn',N'Nam',N'Cầu Giấy, Hà Nội','0308455633',NULL,'001040187651'),
('KH08',N'Ngô Duy Anh',N'Nam',N'Hoàng Mai, Hà Nội','0967555213','duyanh@gmail.com','034495312001'),
('KH09',N'Nguyễn An Ninh',N'Nam',N'Cầu Giấy, Hà Nội','0912654221',NULL,'033213699812'),
('KH10',N'Trần Thái An',N'Nữ',N'Thanh Xuân, Hà Nội','0913455467','antran@gmail.com','033475134452'),
('KH11',N'Nguyễn Duy Dương',N'Nam',N'Thanh Xuân, Hà Nội','0976324151','duyduong@gmail.com','038610110342'),
('KH12',N'Hồ Văn Hải',N'Nam',N'Hoàng Mai, Hà Nội','0796455313',NULL,'040109837321'),
('KH13',N'Nguyễn Nhật Linh',N'Nữ',N'Hà Đông, Hà Nội','0806733452','ann@gmail.com','001536289123')
;

INSERT INTO NhanVien(MaNV,HoTen,DiaChi,GioiTinh,CaLamViec,SDT,CCCD)
VALUES
('NV01',N'Mai Hà Anh',N'Đông Anh, Hà Nội',N'Nữ',N'Ca Sáng','0867342161','001671324913'),
('NV02',N'Nguyễn Văn Anh',N'Cầu Giấy, Hà Nội',N'Nam',N'Ca Tối','0986724200','040317761001'),
('NV03',N'Đoàn Hải Đăng',N'Cầu Giấy, Hà Nội',N'Nam',N'Ca Chiều','0763991119','001892004551'),
('NV04',N'Nguyễn Quỳnh Anh',N'Bắc Từ Liêm, Hà Nội',N'Nữ',N'Cả ngày','0936442541','031256270091')
;

INSERT INTO HoaDon(MaHD,MaKH,MaNV,NgayTaoHD,TrangThai,TongTien,GhiChu)
VALUES
('HD01','KH01','NV01','2023-03-29 00:00:00',NULL,NULL,NULL),
('HD02','KH02','NV02','2023-02-08 00:00:00',NULL,NULL,NULL),
('HD03','KH03','NV03','2023-04-19 00:00:00',NULL,NULL,NULL),
('HD04','KH04','NV04','2023-04-22 00:00:00',NULL,NULL,NULL),
('HD05','KH01','NV01','2023-05-29 00:00:00',NULL,NULL,NULL),
('HD06','KH02','NV01','2023-03-22 00:00:00',NULL,NULL,NULL),
('HD07','KH03','NV02','2023-07-01 00:00:00',NULL,NULL,NULL),
('HD08','KH05','NV03','2023-08-30 00:00:00',NULL,NULL,NULL),
('HD09','KH07','NV01','2023-11-29 00:00:00',NULL,NULL,NULL),
('HD10','KH08','NV02','2023-10-19 00:00:00',NULL,NULL,NULL),
('HD11','KH09','NV04','2023-09-15 00:00:00',NULL,NULL,NULL),
('HD12','KH11','NV01','2023-03-27 00:00:00',NULL,NULL,NULL),
('HD13','KH13','NV02','2023-06-10 00:00:00',NULL,NULL,NULL),
('HD14','KH01','NV04','2023-07-14 00:00:00',NULL,NULL,NULL);

INSERT INTO ChiTietHD(MaHD,MaXe,NgayThue,NgayTra,SoLuong,DonGia,ThanhTien,GhiChu)
VALUES
('HD01','XM01','2023-03-28 00:00:00','2023-03-28 00:00:00',1,NULL,NULL,NULL),
('HD02','XM02','2023-02-04 00:00:00','2023-02-08 00:00:00',2,NULL,NULL,NULL),
('HD03','XM03','2023-04-17 00:00:00','2023-04-19 00:00:00',1,NULL,NULL,NULL),
('HD04','XM04','2023-04-21 00:00:00','2023-04-22 00:00:00',3,NULL,NULL,NULL),
('HD05','XM10','2023-05-23 00:00:00','2023-05-29 00:00:00',1,NULL,NULL,NULL),
('HD06','XM10','2023-03-20 00:00:00','2023-03-22 00:00:00',1,NULL,NULL,NULL),
('HD07','XM10','2023-07-29 00:00:00','2023-07-01 00:00:00',2,NULL,NULL,NULL),
('HD08','XM10','2023-08-26 00:00:00','2023-08-30 00:00:00',3,NULL,NULL,NULL),
('HD09','XM10','2023-11-25 00:00:00','2023-11-29 00:00:00',1,NULL,NULL,NULL),
('HD10','XM10','2023-10-12 00:00:00','2023-10-19 00:00:00',4,NULL,NULL,NULL),
('HD11','XM10','2023-09-13 00:00:00','2023-09-15 00:00:00',1,NULL,NULL,NULL),
('HD12','XM07','2023-03-24 00:00:00','2023-03-27 00:00:00',2,NULL,NULL,NULL),
('HD13','XM07','2023-06-08 00:00:00','2023-06-10 00:00:00',1,NULL,NULL,NULL),
('HD14','XM07','2023-07-12 00:00:00','2023-07-14 00:00:00',4,NULL,NULL,NULL)
;