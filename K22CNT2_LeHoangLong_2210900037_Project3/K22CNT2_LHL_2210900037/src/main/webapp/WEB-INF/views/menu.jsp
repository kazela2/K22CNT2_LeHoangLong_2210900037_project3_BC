
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Hệ Thống</title>
<style>
/* Căn chỉnh cho toàn bộ trang */
body {
    font-family: sans-serif;
    background-color: #f3f4f6;
    margin: 0;
    padding: 0;
}

/* Cải tiến thanh menu */
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: rgba(51, 51, 51, 0.8); /* Thanh menu mờ đi để dễ nhìn */
    display: block; /* Thay đổi từ flex sang block để li thành cột */
    width: 100%;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* Bóng đổ cho thanh menu */
    padding: 10px 0;
    text-align: left; /* Căn trái cho danh sách */
}

li {
    margin: 10px 0; /* Thêm khoảng cách giữa các mục */
}

li a {
    display: block;
    color: black;
    padding: 10px 20px;
    text-decoration: none;
    font-size: 16px;
    border-radius: 10px;
    transition: all 0.3s ease; /* Thêm hiệu ứng hover mượt mà */
    margin-left: 20px; /* Lùi vào bên trái */
}

li a:hover {
    background-color: #111;
    transform: scale(1.1); /* Phóng to khi hover */
}

/* Cải thiện giao diện chính */
.intro-content {
    margin: 40px auto; /* Đặt margin tự động để căn giữa */
    text-align: center; /* Căn giữa tiêu đề và mô tả */
    width: 80%;
    max-width: 1200px; /* Giới hạn chiều rộng */
}

h1 {
    font-size: 36px;
    color: #2c3e50;
    margin-bottom: 20px;
}

p {
    margin-bottom: 20px;
    font-size: 18px;
    line-height: 1.6;
}

/* Cải thiện giao diện danh sách (ul, li) */
.list-content {
    margin: 40px auto;
    width: 80%;
    max-width: 1200px;
}

ul {
    list-style-type: none;
    padding: 0;
    display: grid; /* Sử dụng grid để chia thành 3 cột */
    grid-template-columns: repeat(3, 1fr); /* Chia thành 3 cột */
    gap: 20px; /* Khoảng cách giữa các cột */
}

li {
    background-color: #ffffff; /* Màu nền cho mỗi mục */
    border-radius: 10px; /* Bo tròn góc */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ */
    transition: all 0.3s ease; /* Thêm hiệu ứng hover */
}

li a {
    display: block;
    padding: 15px 25px; /* Tăng khoảng cách để dễ đọc */
    text-decoration: none;
    color: #333; /* Màu chữ tối */
    font-size: 18px;
    font-weight: 500; /* Định dạng chữ đậm nhẹ */
    border-radius: 10px;
    text-align: center; /* Căn giữa chữ */
    transition: background-color 0.3s ease, transform 0.3s ease;
}

li a:hover {
    background-color: #3498db; /* Màu nền khi hover */
    color: white; /* Đổi màu chữ khi hover */
    transform: scale(1.05); /* Phóng to nhẹ khi hover */
}

li:hover {
    transform: translateY(-5px); /* Di chuyển nhẹ khi hover */
}

/* Điều chỉnh cho các màn hình nhỏ */
@media (max-width: 768px) {
    ul {
        grid-template-columns: repeat(2, 1fr); /* Chia thành 2 cột trên màn hình nhỏ */
    }
}

@media (max-width: 480px) {
    ul {
        grid-template-columns: 1fr; /* Chia thành 1 cột trên các màn hình rất nhỏ */
    }
}
/* Cải tiến footer */
.footer {
    text-align: center;
    font-size: 14px;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.7);
    color: white;
    position: fixed;
    bottom: 0;
    width: 100%;
}

.footer p {
    margin: 0;
}

/* Cải tiến button */
.content a {
    display: inline-block;
    margin-top: 20px;
    color: black;
    font-weight: bold;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 25px;
    background-color: #3498db;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.content a:hover {
    background-color: #2980b9;
    transform: scale(1.05);
}

/* Cải thiện giao diện phần header */
header {
    background-color: white;
    border-bottom: 1px solid #d1d5db;
    padding: 16px 0; /* Thêm padding cho phần header */
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center; /* Căn giữa nội dung */
}

.nav-links {
    display: flex;
    justify-content: center; /* Căn giữa các link trong thanh menu */
    gap: 20px; /* Tạo khoảng cách giữa các link */
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-weight: 700; /* Tăng độ đậm của chữ */
    font-size: 16px; /* Tăng kích thước chữ một chút */
    padding: 10px 20px; /* Thêm khoảng cách xung quanh chữ */
    border-radius: 10px;
    transition: all 0.3s ease-in-out; /* Hiệu ứng mượt khi hover */
}


.nav-links a:hover {
    color: #10b981; /* Thay đổi màu chữ khi hover */
    text-decoration: underline; /* Thêm gạch dưới khi hover */
    transform: scale(1.1); /* Phóng to một chút khi hover */
}

.nav-links a:active {
    color: #059669; /* Thay đổi màu khi nhấn */
}

</style>
</head>
<body>
    <header class="header">
        <div class="container flex justify-center items-center">
            <div class="nav-links flex gap-8">
                <a href="index.jsp">Đăng Xuất</a>
            </div>
        </div>
    </header>

    <!-- Div chứa tiêu đề -->
    <div class="intro-content">
        <h1>Chào Mừng Đến Với Trang Quản Lý</h1>
        <p>Hệ Thống Giúp Bạn Quản Lý Các Thông Tin Và Sản Phẩm, Khách Hàng Và Các Thông Tin Bảo Hành, Đánh Giá.</p>
    </div>

    <!-- Div chứa danh sách -->
    <div class="list-content">
        <ul>
            <li><a href="${pageContext.request.contextPath}/SanPham/list">Sản Phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/KhachHang/list">Khách Hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/NhanVien/list">Nhân Viên</a></li>
            <li><a href="${pageContext.request.contextPath}/KhoHang/list">Kho Hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/BaoHanh/list">Thông Tin Bảo Hành</a></li>
            <li><a href="${pageContext.request.contextPath}/DanhGia/list">Đánh Giá</a></li>
            <li><a href="${pageContext.request.contextPath}/TaiKhoan/list">Tài Khoản</a></li>
        </ul>
    </div>

    <div class="footer">
        <p>&copy; 2025 Quản Lý Kinh Doanh, Tất Cả Quyền Lợi Được Bảo Lưu</p>
    </div>
</body>

</html>
