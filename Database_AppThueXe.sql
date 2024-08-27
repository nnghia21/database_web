CREATE DATABASE WebThueXeMay;

CREATE TABLE LoaiXe(
	MaLoai varchar(30) not null primary key,
	LoaiXe nvarchar(50) null,
	GiaThueCoBan money null,
	MoTa nvarchar(MAX) null,
	DanhGia int null
);


CREATE TABLE XeMay(
	MaXe varchar(10) not null primary key,
	MaLoai varchar(30) null,
	BienSoXe varchar(15) null,
	TenXe nvarchar(50) null,
	GiaThue money null,
	TrangThai nvarchar(50) null,

	foreign key(MaLoai) references LoaiXe(MaLoai)

);

CREATE TABLE KhachHang(
	MaKH varchar(10) not null primary key,
	HoTen nvarchar(50) null,
	GioiTinh nvarchar(5) null,
	DiaChi nvarchar(300) null,
	SDT varchar(10) null,
	Email varchar(50) null
);

CREATE TABLE NhanVien(
	MaNV varchar(15) not null primary key,
	HoTen nvarchar(30) not null,
	DiaChi nvarchar(300) null,
	GioiTinh nvarchar(5) null,
	SDT varchar(10) null,
	VaiTro nvarchar(30) null
);

CREATE TABLE HoaDon(
	MaHD varchar(10) not null,
	MaKH varchar(10) not null,
	MaNV varchar(15) not null,
	NgayThue datetime null,
	NgayTra datetime null,
	TongTien money null,

	primary key (MaHD),
	foreign key(MaKH) references KhachHang(MaKH),
	foreign key(MaNV) references NhanVien(MaNV)
);

CREATE TABLE ChiTietHD(
		MaHD varchar(10) not null,
		MaXe varchar(10) not null,
		SoLuong int null,
		DonGia money null,

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


INSERT INTO XeMay(MaXe,MaLoai,BienSoXe,TenXe,GiaThue,TrangThai)
VALUES
('XM01','XSO','29-B1 244.17','Honda Blade 110',150000,'Chưa cho thuê'),
('XM02','XSO','18-K4 3551','Yamaha Sirius',150000,'Đang bảo trì'),
('XM03','XSO','34-C9 444.43','Yamaha Jupiter',150000,'Đang cho thuê'),
('XM04','XSO','29-B7 090.01','Honda Wave RS110',150000,'Đang cho thuê'),
('XM05','XTG','29-S1 213.78','Yamaha Nouvo Automatic',200000,'Chưa cho thuê'),
('XM06','XTG','31-A1 417.60','Honda Vision',200000,'Đang cho thuê'),
('XM07','XTG','29-B1 331.43','Honda Airblade',200000,'Chưa cho thuê'),
('XM08','XTC','29-F1 679.80','Honda Winner 150',300000,'Đang cho thuê'),
('XM09','XTC','18-X3 119.17','Yamaha Exciter',300000,'Chưa cho thuê'),
('XM10','PKL','18-A1 288.03','Honda CB300r',500000,'Chưa cho thuê')
;

INSERT INTO KhachHang(MaKH,HoTen,GioiTinh,DiaChi,SDT,Email)
VALUES
('KH01',N'Nguyễn An',N'Nam',N'Hoàng Mai, Hà Nội','0987654888','ann@gmail.com'),
('KH02',N'Nguyễn Văn Ba',N'Nam',N'Nam Từ Liêm, Hà Nội','0917655848','ba33@gmail.com'),
('KH03',N'Trần Thị Na',N'Nữ',N'Nam Từ Liêm, Hà Nội','0901765414','natran@gmail.com'),
('KH04',N'Nguyễn Thị Ánh',N'Nữ',N'Hà Đông, Hà Nội','0397665213','anhnguyen@gmail.com'),
('KH05',N'Đào Duy Hùng',N'Nam',N'Cầu Giấy, Hà Nội','0376548887','hungdd@gmail.com'),
('KH06',N'Tạ Thái Lan',N'Nữ',N'Hoàng Mai, Hà Nội','0947655412','lantt@gmail.com'),
('KH07',N'Mai Văn Tuấn',N'Nam',N'Cầu Giấy, Hà Nội','0308455633',NULL),
('KH08',N'Ngô Duy Anh',N'Nam',N'Hoàng Mai, Hà Nội','0967555213','duyanh@gmail.com'),
('KH09',N'Nguyễn An Ninh',N'Nam',N'Cầu Giấy, Hà Nội','0912654221',NULL),
('KH10',N'Trần Thái An',N'Nữ',N'Thanh Xuân, Hà Nội','0913455467','antran@gmail.com'),
('KH11',N'Nguyễn Duy Dương',N'Nam',N'Thanh Xuân, Hà Nội','0976324151','duyduong@gmail.com'),
('KH12',N'Hồ Văn Hải',N'Nam',N'Hoàng Mai, Hà Nội','0796455313',NULL),
('KH13',N'Nguyễn Nhật Linh',N'Nữ',N'Hà Đông, Hà Nội','0806733452','ann@gmail.com')
;

INSERT INTO NhanVien(MaNV,HoTen,DiaChi,GioiTinh,SDT,VaiTro)
VALUES
('NV01',N'Mai Hà Anh',N'Đông Anh, Hà Nội',N'Nữ','0867342161',NULL),
('NV02',N'Nguyễn Văn Anh',N'Cầu Giấy, Hà Nội',N'Nam','0986724200',NULL),
('NV03',N'Đoàn Hải Đăng',N'Cầu Giấy, Hà Nội',N'Nam','0763991119',NULL),
('NV04',N'Nguyễn Quỳnh Anh',N'Bắc Từ Liêm, Hà Nội',N'Nữ','0936442541',NULL)
;

INSERT INTO HoaDon(MaHD,MaKH,MaNV,NgayThue,NgayTra,TongTien)
VALUES
('HD01','KH01','NV01','2023-03-28 00:00:00','2023-03-29 00:00:00',NULL),
('HD02','KH02','NV02','2024-02-01 00:00:00','2023-02-08 00:00:00',NULL),
('HD03','KH03','NV03','2024-04-17 00:00:00','2023-04-19 00:00:00',NULL),
('HD04','KH04','NV04','2023-04-18 00:00:00','2023-04-22 00:00:00',NULL),
('HD05','KH01','NV01','2023-05-28 00:00:00','2023-05-29 00:00:00',NULL),
('HD06','KH02','NV01','2022-05-20 00:00:00','2023-03-22 00:00:00',NULL),
('HD07','KH03','NV02','2023-06-26 00:00:00','2023-07-01 00:00:00',NULL),
('HD08','KH05','NV03','2023-08-24 00:00:00','2023-08-30 00:00:00',NULL),
('HD09','KH07','NV01','2023-11-28 00:00:00','2023-11-29 00:00:00',NULL),
('HD10','KH08','NV02','2022-10-15 00:00:00','2023-10-19 00:00:00',NULL),
('HD11','KH09','NV04','2023-09-14 00:00:00','2023-09-15 00:00:00',NULL),
('HD12','KH11','NV01','2023-03-24 00:00:00','2023-03-27 00:00:00',NULL),
('HD13','KH13','NV02','2022-06-05 00:00:00','2023-06-10 00:00:00',NULL),
('HD14','KH01','NV04','2022-07-06 00:00:00','2023-07-14 00:00:00',NULL);

INSERT INTO ChiTietHD(MaHD,MaXe,SoLuong,DonGia)
VALUES
('HD01','XM01',1,NULL),
('HD02','XM02',2,NULL),
('HD03','XM03',1,NULL),
('HD04','XM04',3,NULL),
('HD01','XM10',1,NULL),
('HD02','XM07',4,NULL),
('HD03','XM02',2,NULL),
('HD04','XM09',1,NULL)
;