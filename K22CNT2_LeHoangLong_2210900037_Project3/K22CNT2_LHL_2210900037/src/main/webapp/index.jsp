<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Công Ty TNHH Phân Phối Thiết Bị Điện Nước HoangLong</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

<style>
body {
    font-family: sans-serif;
    background-color: #f3f4f6;
    margin: 0;
    padding: 0;
}

header {
    background-color: white;
    border-bottom: 1px solid #d1d5db;
    padding: 16px 0;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;  /* Căn giữa nội dung */
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 24px;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    font-size: 16px;
    transition: all 0.3s ease-in-out; /* Hiệu ứng mượt khi hover */
}

.nav-links a:hover {
    color: #10b981;  /* Thay đổi màu chữ khi hover */
    text-decoration: underline;  /* Thêm gạch dưới khi hover */
    transform: scale(1.1);  /* Phóng to một chút khi hover */
}

.nav-links a:active {
    color: #059669;  /* Thay đổi màu khi nhấn */
}
main {
    padding: 60px 0;
    text-align: center;
}

h2 {
    font-size: 32px;
    font-weight: bold;
    color: #10b981;
    margin-bottom: 20px;
}

p, ul, li {
    font-size: 18px;
    color: #4b5563;
    margin-bottom: 20px;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
}
ul {
    padding-left: 20px; 
}

li {
    margin-bottom: 8px; 
}
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 24px;
    padding: 40px 20px;
}

.card {
    background-color: white;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    padding: 16px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-5px);
}

.card-1 {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: white;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    padding: 16px;
    transition: transform 0.3s ease-in-out;
}

.card-1:hover {
    transform: translateY(-5px);
}

.card-1 .content {
    flex: 1;
    text-align: left;
    padding-right: 20px; /* Tạo khoảng cách với ảnh */
}

.card-1 img {
    width: 40%; /* Giảm kích thước ảnh để vừa với layout */
    height: auto;
    border-radius: 10px;
    object-fit: cover;
}

.card p, ul, li {
    color: #6b7280;
    font-size: 16px;
    margin-bottom: 8px;
    text-align:left;
    list-style-type: disc;
}
.card-1 p, ul, li {
    color: #6b7280;
    font-size: 16px;
    margin-bottom: 8px;
    text-align:left;
    list-style-type: disc;
}
.button {
    display: inline-block;
    background-color: #10b981;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.button:hover {
    background-color: #059669;
}

footer {
    background-color: #1f2937;
    color: white;
    text-align: center;
    padding: 16px 0;
    margin-top: 40px;
}

h4, h5 {
    font-size: 24px;
    font-weight: 600;
    color: #10b981;  /* Màu xanh lá */
    text-align: center;
    margin-top: 40px;
    margin-bottom: 16px;
    letter-spacing: 1px;
    text-transform: capitalize;
    text-decoration: underline;  /* Gạch dưới tiêu đề */
}
h6 {
    font-size: 24px;
    font-weight: 600;
    color: #10b981;  /* Màu xanh lá */
    text-align: center;
    margin-top: 40px;
    margin-bottom: 16px;
    letter-spacing: 1px;
    text-transform: capitalize;
    text-decoration: underline;  /* Gạch dưới tiêu đề */
}

.italic-text {
     font-style: italic;
}
.card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-radius: 10px 10px 0 0;
}
.banner-img {
    display: block;
    max-width: 100%;
    height: auto;
    margin: 20px auto; /* Căn giữa hình ảnh */
    border-radius: 10px; /* Bo tròn góc */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Tạo hiệu ứng đổ bóng */
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
            <a href="#">Trang chủ</a>
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

    <main class="container">
        <h2>Công Ty TNHH Phân Phối Thiết Bị Điện Nước HoangLong.com</h2>
        <p>Chúng tôi chuyên cung cấp các loại vật liệu, thiết bị điện nước chất lượng cao với giá cả cạnh tranh,
        Với nhiều năm kinh nghiệm trong ngành, chúng tôi cam kết mang đến cho khách hàng những sản phẩm bền bỉ, an toàn và hiệu quả.</p>
        
        <img src="https://theme.hstatic.net/1000360993/1000969249/14/ms_banner_img4.jpg?v=218" alt="Banner" class="banner-img">
        <h6>ĐỒNG HÀNH CÙNG PHÁT TRIỂN</h6>
        <div class="grid-container">
            <div class="card-1">
			    <div class="content">
			        <p>Đơn vị phân phối thiết bị điện nước hàng đầu với các dòng sản phẩm chủ đạo:</p>
			        <ul>
			           <li>Ống luồn dây điện, thiết bị điện Sino, Schneider, Panasonic, MPE, Duhal ....</li>
			           <li>Đèn led, thiết bị chiếu sáng Sino, MPE, Duhal, Rạng Đông, Paragon, Nanoco ....</li>
			           <li>Dây cáp điện Sino, Trần Phú, Cadisun, Cadivi ...</li>
			           <li>Dây mạng, điện thoại, cáp đồng trục Sino, Vinacap ...</li>
			        </ul>
			        <p>Tại công ty TNHH Thiết Bị Điện Nước Hà Nội, chúng tôi đón nhận niềm tin...</p>
			        <a href="gioithieu" class="button">Về Chúng Tôi</a>
			    </div>
			    <img src="https://theme.hstatic.net/1000360993/1000969249/14/haboutus_img.jpg?v=218" alt="">
			</div>
        </div>
        
        
        <h5>Đối Tác</h5>
        <div class="grid-container">
            <div class="card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgePmvvDLN3XjVUWdl4HLEarjPdRgg8IYxSw&s" alt="">
                <p>Panasonic là một trong những tập đoàn công nghệ và điện tử hàng đầu của Nhật Bản, được thành lập vào năm 1918 bởi Konosuke Matsushita.
                Từ khi ra đời, Panasonic đã phát triển mạnh mẽ và trở thành một trong những thương hiệu nổi tiếng nhất thế giới trong ngành điện tử và các thiết bị gia dụng.</p>
                <p>Panasonic nổi bật với các sản phẩm điện tử tiêu dùng chất lượng cao, bao gồm TV, máy lạnh, tủ lạnh, máy giặt, và các thiết bị gia dụng khác.</p>
            </div>
            
            <div class="card">
                <img src="https://paragon.com.vn/wp-content/uploads/2021/10/Paragon-Logo.png" alt="">
                <p>một thương hiệu nổi tiếng chuyên cung cấp các sản phẩm về công nghệ, thiết bị điện tử, và đồ gia dụng.
                Thương hiệu này đặc biệt chú trọng đến chất lượng sản phẩm, với các giải pháp công nghệ tiên tiến,
                tiết kiệm năng lượng và thân thiện với người sử dụng. Các sản phẩm của Paragon có mặt trên nhiều thị trường và được biết đến với thiết kế hiện đại, bền bỉ và tính năng ưu việt.</p>
            </div>
            
            <div class="card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyZ5bZ0BHslgAdeqEgb8fIFqUgmKxa60a9jA&s" alt="">
                <p>một thương hiệu chuyên cung cấp các sản phẩm ống nhựa, phụ kiện và các giải pháp hệ thống ống nước chất lượng cao.
                Thương hiệu này nổi bật với các sản phẩm có tính năng vượt trội, độ bền cao, và khả năng chịu nhiệt, chịu áp lực tốt,
                được sử dụng rộng rãi trong các công trình xây dựng dân dụng, công nghiệp, hệ thống cấp thoát nước, và các ứng dụng trong ngành điện, viễn thông.</p>
            </div>
        </div>
        
        <h4>Tin Tức Nổi Bật</h4>
        <div class="grid-container">
            <div class="card">
                <h3>Thiết bị điện</h3>
                <img src="https://thietbigiakho.com/wp-content/uploads/2023/05/Thiet-bi-dien-la-gi-phan-loai-cac-thiet-bi-dien.jpg" alt="">
                <p>Các sản phẩm điện chất lượng cao phục vụ cho gia đình và công trình</p>
                <ul>
                   <li>Công tắc, ổ cắm điện an toàn, dễ sử dụng.</li>
                   <li>Hệ thống chiếu sáng LED tiết kiệm năng lượng, tuổi thọ cao.</li>
                   <li>Các loại dây cáp điện, bộ chia điện đảm bảo an toàn cho mọi công trình.</li>
                   <li>Thiết bị đo lường điện, bảo vệ chống quá tải.</li>
                </ul><p></p>
            </div>
            
            <div class="card">
                <h3>Thiết bị nước</h3>
                 <img src="https://phanphoivattudiennuoc.vn/Data/images/product/Sieu%20Thanh/vat-tu-dien-nuoc.jpg" alt="">
                <p>Hệ thống ống nước, van, vòi với độ bền cao, dễ lắp đặt</p>
                <ul>
                   <li>Ống nước PVC, nhựa chống ăn mòn, bền bỉ.</li>
                   <li>Van nước và vòi điều chỉnh lưu lượng dễ dàng.</li>
                   <li>Bộ lọc nước và các thiết bị xử lý nước sạch cho gia đình và công trình.</li>
                   <li>Phụ kiện ống nước như khớp nối, thích hợp cho nhiều ứng dụng.</li>
                </ul><p></p>
        
            </div>
            
            <div class="card">
                <h3>Phụ kiện</h3>
                <img src="https://bizweb.dktcdn.net/100/258/702/files/5-mat-hang-can-thiet-kinh-doanh-dien-nuoc-3.jpg?v=1638785503391" alt="">
                <p>Các loại phụ kiện hỗ trợ cho hệ thống điện nước hiện đại</p>
                <ul>
                   <li>Phụ kiện điện: phích cắm, ổ điện, bộ chuyển đổi điện năng.</li>
                   <li>Phụ kiện nước: cút nối, khóa van, đầu nối ống nước.</li>
                   <li>Hệ thống điều khiển từ xa cho thiết bị điện và nước thông minh.</li>
                   <li>Chốt khóa bảo vệ thiết bị điện, tránh nguy cơ rò rỉ điện.</li>
                </ul><p></p>
             </div>
        </div>
    </main>

    <footer class="footer">
        <p>&copy; 2025 HoangLong.com - Chuyên cung cấp vật liệu điện nước</p>
    </footer>
</body>
</html>
