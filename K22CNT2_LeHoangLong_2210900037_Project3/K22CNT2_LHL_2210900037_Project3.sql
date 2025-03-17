create database lhl_2210900037
use lhl_2210900037

create table lhl_sanpham(
lhl_masp	INT AUTO_INCREMENT	PRIMARY KEY ,
lhl_tensp	VARCHAR(255)	NOT NULL,
lhl_hinhanh VARCHAR(255)  NOT NULL,
lhl_danhmuc	VARCHAR(255)	NOT NULL,
lhl_mota	TEXT	NULL,
lhl_gia	DECIMAL(15,2)	NOT NULL
)

create table lhl_khachhang(
lhl_makh	INT	PRIMARY KEY AUTO_INCREMENT,
lhl_hoten	VARCHAR(100)	NOT NULL,
lhl_email	VARCHAR(100)	NOT NULL,
lhl_sodienthoai	VARCHAR(15)	NOT NULL
)
INSERT INTO lhl_khachhang (lhl_hoten, lhl_email, lhl_sodienthoai) 
VALUES ('Nguyen Thi Lan', 'lan.nguyen@example.com', '0123456789');

CREATE TABLE lhl_nhanvien (
    lhl_manv INT AUTO_INCREMENT PRIMARY KEY,
    lhl_hoten VARCHAR(100) NOT NULL,
    lhl_sodienthoai VARCHAR(15) NOT NULL,
    lhl_chucvu VARCHAR(50) NOT NULL -- VD: Quản lý, Nhân viên bán hàng, Nhân viên kho
);
INSERT INTO lhl_nhanvien (lhl_hoten, lhl_sodienthoai, lhl_chucvu)  
VALUES ('Nguyễn Văn Vũ', '0987654321', 'Nhân Viên Bán Hàng');

CREATE TABLE lhl_khohang (
    lhl_makho INT AUTO_INCREMENT PRIMARY KEY,
    lhl_masp INT NOT NULL,
    lhl_soluongton INT NOT NULL,
    lhl_ngaynhap varchar(50) NOT NULL,
    CONSTRAINT fk_khohang_sanpham FOREIGN KEY (lhl_masp) REFERENCES lhl_sanpham(lhl_masp) ON DELETE CASCADE
);

CREATE TABLE lhl_baohanh (
    lhl_mabaohanh INT AUTO_INCREMENT PRIMARY KEY,
    lhl_masp INT NOT NULL,
    lhl_ngaybatdau DATE NOT NULL,
    lhl_ngayketthuc DATE NOT NULL,
    lhl_trangthai VARCHAR(50) NOT NULL,  -- VD: Đang bảo hành, Đã hết hạn
    CONSTRAINT fk_baohanh_sanpham FOREIGN KEY (lhl_masp) REFERENCES lhl_sanpham(lhl_masp)
);
CREATE TABLE lhl_danhgia (
    lhl_madanhgia INT AUTO_INCREMENT PRIMARY KEY,
    lhl_makh INT NOT NULL,
    lhl_masp INT NOT NULL,
    lhl_danhgia INT NOT NULL,  -- Giá trị từ 1 đến 5 sao
    lhl_nhanxet TEXT,  -- Phản hồi của khách hàng
    CONSTRAINT fk_danhgia_khachhang FOREIGN KEY (lhl_makh) REFERENCES lhl_khachhang(lhl_makh),
    CONSTRAINT fk_danhgia_sanpham FOREIGN KEY (lhl_masp) REFERENCES lhl_sanpham(lhl_masp)
);

CREATE TABLE lhl_taikhoan (
    lhl_matk INT AUTO_INCREMENT PRIMARY KEY,
    lhl_tendangnhap VARCHAR(50) UNIQUE NOT NULL,
    lhl_matkhau VARCHAR(255) NOT NULL, -- Mật khẩu sẽ được mã hóa (bcrypt, MD5...)
    lhl_email VARCHAR(100) UNIQUE NOT NULL,
    lhl_vaitro ENUM('KHACHHANG', 'NHANVIEN', 'ADMIN') NOT NULL DEFAULT 'KHACHHANG' -- Mặc định là khách hàng
);




