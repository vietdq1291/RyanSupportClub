Use master
Go
Create DataBase RyanSportClub;
Go
Use RyanSportClub
Go
Create Table DM_TrangChucNang
(
Ma smallint primary key identity(1,1),
Ten nvarchar(150),
Icon varchar(50),
Mota nvarchar(200),
TrangThai bit,
MaCapCha smallint
);
Go
Create Table DM_HanhChinhDiaLy(
Ma int primary key identity(1,1),
Ten nvarchar(150),
TrangThai bit,
MaCapCha int
);
Go
Create Table HT_TrungTamHuanLuyen(
Ma int primary key identity(1,1),
Ten nvarchar(150),
MoTaTomTat nvarchar(500),
DiaChi nvarchar(250),
LinkGoogleMap varchar(max),
MaHanhChinh int not null,
MoTaChiTiet nvarchar(max)
CONSTRAINT FK_DanhMucHanhChinh
   FOREIGN KEY (MaHanhChinh) REFERENCES DM_HanhChinhDiaLy(Ma)
);
Go
Create Table DM_ChuyenNganh(
Ma int primary key identity(1,1),
Ten nvarchar(150),
TrangThai bit,
)
Go
Create Table HT_GiangVien(
Ma int primary key identity(1,1),
Ten nvarchar(150),
QuocTich nvarchar(100),
NgaySinh date
);
Go
Create Table HT_GiangVien_ChuyenNganh(
MaGiangVien int,
MaChuyenNganh int
CONSTRAINT FK_GiangVien
   FOREIGN KEY (MaGiangVien) REFERENCES HT_GiangVien(Ma),
CONSTRAINT FK_ChuyenNganh_GiangVien
   FOREIGN KEY (MaChuyenNganh) REFERENCES DM_ChuyenNganh(Ma)
);
Go
Create Table HT_GiangVien_KinhNghiem(
MaGiangVien int,
KinhNghiem nvarchar(250)
CONSTRAINT FK_GiangVien_KinhNghiem
   FOREIGN KEY (MaGiangVien) REFERENCES HT_GiangVien(Ma),
);
Go
Create Table HT_KhoaHoc(
Ma int primary key identity(1,1),
TenKhoaHoc nvarchar(150),
MoTaTomTat nvarchar(500),
MoTaChiTiet nvarchar(max),
LoaiKhoaHoc tinyint,
MaChuyenNganh int,
GiaTien float,
TrangThai bit,
GiamGia bit,
KhoaHocMoi bit
CONSTRAINT FK_ChuyenNganh_KhoaHoc
   FOREIGN KEY (MaChuyenNganh) REFERENCES DM_ChuyenNganh(Ma)
);
Go
Create Table HT_HuanLuyenCaNhan
(
Ma varchar(150) primary key default(NEWID()),
MaHuanLuyenVien int,
MaChuyenNganh int,
GiaThue float
CONSTRAINT FK_HuanLuyenCaNhan_MaHuanLuyen
   FOREIGN KEY (MaHuanLuyenVien) REFERENCES HT_GiangVien(Ma),
   CONSTRAINT FK_HuanLuyenCaNhan_ChuyenNganh
   FOREIGN KEY (MaChuyenNganh) REFERENCES DM_ChuyenNganh(Ma)
);
Go
Create Table HT_DatLichHuanLuyenVien
(
Ma int primary key identity(1,1),
MaHuanLuyenVien int,
MaChuyenNganh int,
NgayTap date,
GioBatDau time,
GioKetThuc time,
HoTenNguoiDat nvarchar(150),
DiaChi nvarchar(250),
SDT varchar(20),
Email varchar(250),
ThanhToan bit,
ThanhTien float,
GhiChu nvarchar(500)

CONSTRAINT FK_DatLichHuanLuyenVien_MaHuanLuyen
   FOREIGN KEY (MaHuanLuyenVien) REFERENCES HT_GiangVien(Ma),
   CONSTRAINT FK_DatLichHuanLuyenVien_ChuyenNganh
   FOREIGN KEY (MaChuyenNganh) REFERENCES DM_ChuyenNganh(Ma)
);
Go
Create Table HT_YKienPhanHoi(
Ma int primary key identity(1,1),
HoVaTen nvarchar(250),
SDT varchar(20),
TieuDe nvarchar(250),
NoiDung nvarchar(2000),
HienThi bit
);
Go
Create Table HT_TinTuc
(
Ma int primary key identity(1,1),
TieuDe nvarchar(250),
NoiDung ntext,
PhatHanh bit
);