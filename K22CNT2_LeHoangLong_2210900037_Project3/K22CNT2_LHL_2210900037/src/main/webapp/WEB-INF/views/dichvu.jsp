<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Công Ty TNHH Phân Phối Thiết Bị Điện Nước HoangLong</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">
<style>
/* Định dạng chung */
body {
	font-family: sans-serif;
	background-color: #f3f4f6;
	margin: 0;
	padding: 0;
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
/* Footer Styles */
footer.footer {
    background-color: #f8f8f8;
    padding: 40px 20px;
    text-align: left;
    border-top: 1px solid #ddd;
}

/* Định dạng chung cho footer-content */
footer.footer .footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between; /* Căn đều các phần */
    flex-wrap: wrap; /* Cho phép các phần tử trong footer tự động xuống dòng khi cần */
}

/* Phần Thông tin liên hệ */
footer.footer .contact-info {
    width: 30%; /* Cột trái */
    margin-right: 20px;
}

footer.footer .contact-info h3 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}

footer.footer .contact-info p {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

/* Phần Chính sách */
footer.footer .footer-links {
    width: 30%; /* Cột giữa */
    margin-right: 20px;
}

footer.footer .footer-links .policies {
    width: 100%;
}

footer.footer .footer-links h3 {
    font-size: 20px;
    margin-bottom: 20px; /* Tăng khoảng cách dưới tiêu đề */
    color: #333;
}

footer.footer .footer-links ul {
    list-style: none;
    padding: 0;
}

footer.footer .footer-links ul li {
    margin: 8px 0;
}

footer.footer .footer-links ul li a {
    text-decoration: none;
    color: #333;
    transition: all 0.3s ease;
}

footer.footer .footer-links ul li a:hover {
    color: #10b981;
    text-decoration: underline;
}

/* Mobile Responsive */
@media (max-width: 768px) {
    footer.footer .footer-content {
        flex-direction: column;
        align-items: center;
    }

    footer.footer .footer-content > div {
        width: 100%;
        margin-bottom: 20px;
    }
}


/* Main content */
.main-content {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
}

/* Giới thiệu công ty */
.intro {
    text-align: center;
    margin-bottom: 40px;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.product-card {
    border: 1px solid #ddd;
    padding: 20px;
    text-align: center;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.product-card img {
    max-width: 100%;
    height: auto;
}

.product-card h4 {
    margin: 10px 0;
}

.product-card .price {
    font-size: 18px;
    font-weight: bold;
    color: red;
}

.product-card .btn {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}

.product-card .btn:hover {
    background-color: #2980b9;
}

/* Khuyến mãi */
.promotion-banner {
    background-color: #f1c40f;
    padding: 20px;
    text-align: center;
    border-radius: 5px;
}

.promotion-banner .btn {
    margin-top: 10px;
}

/* Đánh giá của khách hàng */
.customer-reviews {
    margin-bottom: 40px;
}

.reviews {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.review {
    width: 250px;
    padding: 15px;
    border: 1px solid #ddd;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.rating {
    font-size: 18px;
    color: #ff5733;
    font-weight: bold;
}

.review-text {
    font-style: italic;
    margin-top: 10px;
}

.customer-name {
    font-weight: bold;
    margin-top: 5px;
}

/* Liên hệ */
.contact-us {
    text-align: center;
    margin-top: 40px;
}

/* Giới thiệu công ty */
.intro {
    background-color: #ffffff; /* Màu nền trắng để tạo sự nổi bật */
    border-radius: 10px; /* Bo góc để phần nội dung mềm mại hơn */
    padding: 40px 20px; /* Padding tạo khoảng cách thoải mái */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Tạo hiệu ứng đổ bóng nhẹ */
    margin-bottom: 40px; /* Tạo khoảng cách dưới */
    text-align: center; /* Căn giữa nội dung */
    max-width: 900px; /* Giới hạn chiều rộng tối đa */
    margin-left: auto; /* Căn trái phải cho đẹp */
    margin-right: auto; /* Căn trái phải cho đẹp */
}

.intro h2 {
    font-size: 28px; /* Kích thước chữ lớn */
    font-weight: bold; /* Đậm để tiêu đề nổi bật */
    color: #333; /* Màu chữ tối cho dễ đọc */
    margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
}

.intro p {
    font-size: 16px; /* Kích thước chữ dễ đọc */
    color: #555; /* Màu chữ xám nhẹ */
    line-height: 1.6; /* Khoảng cách dòng thoải mái */
    margin: 0 auto;
    max-width: 700px; /* Giới hạn chiều rộng cho phần mô tả */
}

/* Thêm hiệu ứng hover cho section */
.intro:hover {
    transform: translateY(-5px); /* Đẩy phần giới thiệu lên một chút khi hover */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); /* Hiệu ứng đổ bóng đậm hơn khi hover */
    transition: all 0.3s ease; /* Hiệu ứng mượt */
}

/* Mobile responsive */
@media (max-width: 768px) {
    .intro {
        padding: 20px; /* Giảm padding cho màn hình nhỏ */
    }

    .intro h2 {
        font-size: 24px; /* Giảm kích thước tiêu đề trên màn hình nhỏ */
    }

    .intro p {
        font-size: 14px; /* Giảm kích thước chữ mô tả */
        max-width: 100%; /* Đảm bảo phần mô tả chiếm hết không gian trên màn hình nhỏ */
    }
}
/* Định dạng cho h3 trong phần Sản phẩm nổi bật */
.featured-products h3 {
    font-size: 30px; /* Kích thước chữ lớn để nổi bật */
    font-weight: bold; /* Chữ đậm để dễ nhận diện */
    color: #333; /* Màu chữ tối */
    text-align: center; /* Căn giữa tiêu đề */
    margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
    text-transform: uppercase; /* Chuyển chữ thành in hoa */
    letter-spacing: 1px; /* Tăng khoảng cách giữa các chữ cái */
}

/* Định dạng cho h3 trong phần Khuyến mãi đặc biệt */
.promotions h3 {
    font-size: 30px; /* Kích thước chữ lớn */
    font-weight: bold; /* Chữ đậm để dễ nhận diện */
    color: #333; /* Màu chữ tối */
    text-align: center; /* Căn giữa tiêu đề */
    margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
    text-transform: uppercase; /* Chuyển chữ thành in hoa */
    letter-spacing: 1px; /* Tăng khoảng cách giữa các chữ cái */
}

/* Định dạng cho h3 trong phần Đánh giá của khách hàng */
.customer-reviews h3 {
    font-size: 30px; /* Kích thước chữ lớn */
    font-weight: bold; /* Chữ đậm để dễ nhận diện */
    color: #333; /* Màu chữ tối */
    text-align: center; /* Căn giữa tiêu đề */
    margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
    text-transform: uppercase; /* Chuyển chữ thành in hoa */
    letter-spacing: 1px; /* Tăng khoảng cách giữa các chữ cái */
}

/* Thêm hiệu ứng hover cho h3 */
.featured-products h3:hover, .promotions h3:hover, .customer-reviews h3:hover {
    color: #10b981; /* Màu chữ thay đổi khi hover */
    transform: scale(1.05); /* Phóng to nhẹ khi hover */
    transition: all 0.3s ease; /* Hiệu ứng mượt */
}
.buy-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 10px;
    }
    .buy-button:hover {
        background-color: #218838;
    }
</style>
</head>
<body class="font-sans bg-gray-100">
	<header class="header">
			<% 
		Integer lhl_makh = (Integer) session.getAttribute("lhl_makh"); 
		if (lhl_makh != null) { 
		    out.print("Bạn đã đăng nhập với ID: " + lhl_makh); 
		} else { 
		    out.print("Bạn chưa đăng nhập!"); 
		}
		%>
		<div class="container flex justify-center items-center">
			<div class="nav-links flex gap-8">
				<a href="index.jsp">Trang chủ</a> 
				<a href="gioithieu">Giới Thiệu</a> 
				<a href="dichvu">Thông Tin Nổi Bật</a>
				<!-- Kiểm tra người dùng đã đăng nhập chưa -->
			<c:if test="${not empty sessionScope.lhl_makh}">
			    <!-- Người dùng đã đăng nhập, hiển thị nút Đăng xuất -->
			    <a href="/SpringMVCPagination/logout">🚪 Đăng xuất</a>
			</c:if>
			
			<c:if test="${empty sessionScope.lhl_makh}">
			    <!-- Người dùng chưa đăng nhập, hiển thị nút Đăng nhập -->
			    <a href="/SpringMVCPagination/login">👤 Đăng nhập</a>
			    <a href="/SpringMVCPagination/dangki">✍️ Đăng Ký</a>
			</c:if>
		    <a href="giohang">&#128722; Giỏ Hàng</a>
			</div>
		</div>
	</header>
	<main class="main-content">
    <section class="intro">
        <h2>Chào mừng đến với Công Ty TNHH Thiết Bị Điện Nước HoangLong</h2>
        <p>Chúng tôi chuyên cung cấp các sản phẩm và dịch vụ chất lượng cao về thiết bị điện nước, phục vụ nhu cầu của mọi gia đình và công trình.</p>
    </section>

			<!-- Sản phẩm nổi bật -->
			<section class="featured-products">
			    <h3>Sản phẩm nổi bật</h3>
			    <div class="product-grid">
			        <c:forEach var="sp" items="${sanPhamList}">
			            <div class="product-card">
			                <img src="${sp.lhl_hinhanh != null && !sp.lhl_hinhanh.isEmpty() ? sp.lhl_hinhanh : 'https://via.placeholder.com/320'}" 
			                     alt="${sp.lhl_tensp}">
			                <h4>${sp.lhl_tensp}</h4>
			                <p class="price">${sp.lhl_gia} VNĐ</p>
			                <p><strong>Mô tả:</strong> ${sp.lhl_mota}</p>
			                <p><strong>Danh mục:</strong> ${sp.lhl_danhmuc}</p>
			                <a href="${pageContext.request.contextPath}/giohang/add/${sp.lhl_masp}" class="buy-button">Mua</a>
			            </div>
			        </c:forEach>
			    </div>
			</section>


    <!-- Tin tức hoặc khuyến mãi -->
    <section class="promotions">
        <h3>Khuyến mãi đặc biệt</h3>
        <div class="promotion-banner">
            <p>Giảm giá lên đến 30% cho các đơn hàng đầu tiên! Khám phá ngay!</p>
        </div>
    </section>
<p></p>
  <!-- Đánh giá của khách hàng -->
<!-- Đánh giá của khách hàng -->
<section class="customer-reviews">
    <h3>Đánh giá của khách hàng</h3>
    <div class="reviews">
        <!-- Lặp qua danh sách đánh giá -->
        <c:forEach var="dg" items="${danhgia}">
            <div class="review">
                <!-- Hiển thị tên sản phẩm -->
                <p class="product-name">
                    <c:forEach var="sanPham" items="${sanPhamList}">
                        <c:if test="${sanPham.lhl_masp == dg.lhl_masp}">
                            ${sanPham.lhl_tensp}
                        </c:if>
                    </c:forEach>
                </p>

                <!-- Hiển thị tên khách hàng -->
                <p class="customer-name">
                    <c:forEach var="khachHang" items="${khachHangs}">
                        <c:if test="${khachHang.lhl_makh == dg.lhl_makh}">
                            ${khachHang.lhl_hoten}
                        </c:if>
                    </c:forEach>
                </p>

                <!-- Hiển thị đánh giá sao và nhận xét -->
                <p class="rating">${dg.lhl_danhgia}★</p>
                <p class="review-text">${dg.lhl_nhanxet}</p>
            </div>
        </c:forEach>
    </div>
</section>




    <!-- Liên hệ -->
    <section class="contact-us">
        <h3>Liên hệ với chúng tôi</h3>
        <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn. Đừng ngần ngại liên hệ qua email hoặc số điện thoại dưới đây.</p>
        <p>Email: thietbidiennuochanoi@gmail.com | SĐT: 024 3388 3999</p>
    </section>
</main>
	
<footer class="footer">
    <div class="footer-content">
        <!-- Phần 1: Thông tin liên hệ -->
        <div class="contact-info">
            <h3>Thông tin liên hệ</h3>
            <p><strong>CÔNG TY TNHH THIẾT BỊ ĐIỆN NƯỚC HOANGLONG</strong></p>
            <p>Địa chỉ: Đại Vĩ, Liên Hà, Đông Anh, Hà Nội</p>
            <p>Địa điểm kinh doanh: Số 1 ngõ 184 Đường Văn Minh, Di Trạch, Hoài Đức, Hà Nội</p>
            <p>Kho hàng: Số 1 ngõ 184 Đường Văn Minh, Di Trạch, Hoài Đức, Hà Nội</p>
            <p>Số điện thoại: 034 9393995</p>
            <p>Email: thietbidiennuochoanglong@gmail.com</p>
            <p>Số ĐKKD: 0106409522</p>
            <p>Nơi cấp: Sở KHĐT TP Hà Nội cấp ngày 30.12.2013</p>
        </div>

        <!-- Phần 2: Chính sách -->
        <div class="footer-links">
            <div class="policies">
                <h3>Chính sách</h3>
                <ul>
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Chính sách thanh toán</a></li>
                    <li><a href="#">Chính sách vận chuyển</a></li>
                    <li><a href="#">Chính sách bảo hành</a></li>
                    <li><a href="#">Hướng dẫn mua hàng</a></li>
                </ul>
                <h3>Quy định chung</h3>
                <ul>
                    <li><a href="#">Miễn trừ trách nhiệm</a></li>
                    <li><a href="#">Liên kết đến website</a></li>
                    <li><a href="#">Bảo mật thông tin</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

	
</body>
</html>