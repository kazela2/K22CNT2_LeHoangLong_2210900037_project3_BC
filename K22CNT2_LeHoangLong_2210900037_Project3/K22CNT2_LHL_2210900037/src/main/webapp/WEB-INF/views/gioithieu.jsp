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

/* Cải thiện giao diện phần main */
.main-content {
	max-width: 1200px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	color: #333;
}

h2 {
	font-size: 28px;
	color: #2c3e50;
	margin-bottom: 20px;
	text-align: center;
}

p {
	font-size: 18px;
	line-height: 1.6;
	margin-bottom: 20px;
}

ul {
	list-style-type: none;
	margin-left: 20px;
}

ul li {
	margin-bottom: 10px;
}

ul li:before {
	content: "•";
	color: #10b981; /* Màu xanh lá */
	margin-right: 10px;
	font-size: 20px;
}

footer {
    text-align: center;
    font-size: 14px;
    padding: 20px;
    background-color: rgba(0, 0, 0, 0.7);
    color: white;
    position: relative; /* Thay đổi từ fixed sang relative */
    margin-top: 20px; /* Thêm khoảng cách phía trên để không đè lên phần main */
    width: 100%;
    bottom: 0;
}
</style>
</head>
<body class="font-sans bg-gray-100">
	<header class="header">
		<div class="container flex justify-center items-center">
			<div class="nav-links flex gap-8">
				<a href="index.jsp">Trang chủ</a> 
				<a href="gioithieu">Giới Thiệu</a> 
				<a href="dichvu">Thông Tin Nổi Bật</a> 
				<!-- Kiểm tra người dùng đã đăng nhập chưa -->
			    <c:if test="${not empty user}">
			        <!-- Người dùng đã đăng nhập, hiển thị nút Đăng xuất -->
			        <a href="/SpringMVCPagination/logout">Đăng xuất</a>
			    </c:if>
			
			    <c:if test="${empty user}">
			        <!-- Người dùng chưa đăng nhập, hiển thị nút Đăng nhập -->
			        <a href="/SpringMVCPagination/login">Đăng nhập</a>
			        <a href="/SpringMVCPagination/dangki">Đăng Ký</a>
			    </c:if>
			</div>
		</div>
	</header>

	<!-- Phần Giới thiệu công ty -->
	<main class="main-content">
		<h2>Giới Thiệu Công Ty TNHH HoangLong</h2>

		<h3>1. Giới thiệu chung</h3>
		<p>Phát triển từ trung tâm phân phối thiết bị điện nước tại Hà
			Nội, với tầm nhìn dài hạn và quan điểm phát triển bền vững, năm 2013
			công ty TNHH Thiết Bị Điện Nước Hà Nội được thành lập. Chúng tôi luôn
			nỗ lực mang đến những giá trị đích thực nhằm đáp lại niềm tin của quý
			khách hàng, không ngừng mở rộng hoạt động kinh doanh và đã trở thành
			đơn vị phân phối thiết bị điện nước hàng đầu với các dòng sản phẩm
			chủ đạo:</p>

		<ul>
			<li>Ống luồn dây điện, thiết bị điện Sino, Schneider, Panasonic,
				MPE, Duhal ...</li>
			<li>Đèn led, thiết bị chiếu sáng Sino, MPE, Duhal, Rạng đông,
				Paragon, Nanoco ...</li>
			<li>Ống nước PPR, PVC, HDPE Tiền Phong, Vesbo, SP (Sino)</li>
			<li>Dây cáp điện Sino, Trần Phú, Cadisun, Cadivi ..</li>
			<li>Dây mạng, điện thoại, cáp đồng trục Sino, Vinacap ..</li>
		</ul>

		<p>Tại công ty Thiết Bị Điện Nước Hà Nội, chúng tôi luôn nỗ lực
			không ngừng, mang đến cho Quý khách hàng những sản phẩm tốt và đồng
			bộ nhất, dịch vụ chuyên nghiệp, tận tình. Với tiêu chí trao những giá
			trị bền vững, đón nhận niềm tin, cùng nhau xây dựng cuộc sống tốt đẹp
			hơn.</p>

		<h3>2. Tư cách pháp nhân</h3>
		<p>
			<strong>Tên công ty:</strong> CÔNG TY TNHH THIẾT BỊ ĐIỆN NƯỚC HÀ NỘI
		</p>
		<p>
			<strong>Mã số thuế:</strong> 0106409522
		</p>
		<p>
			<strong>Địa chỉ:</strong> Số 1 ngõ 184 Đường Văn Minh, Xã Di Trạch,
			Hoài Đức, Hà Nội
		</p>
		<p>
			<strong>Kho hàng:</strong> Số 1 ngõ 184 Đường Văn Minh, Xã Di Trạch,
			Hoài Đức, Hà Nội
		</p>
		<p>
			<strong>Điện thoại:</strong> 024 3388 3999, 024 6297 5777; Hotline:
			0838 776 777.
		</p>
		<p>
			<strong>Website:</strong> thietbidiennuochanoi.vn, duhalvietnam.vn,
			schneidervietnam.net, mpevietnam.net
		</p>
		<p>
			<strong>Email:</strong> thietbidiennuochanoi@gmail.com
		</p>

		<h3>3. Chính sách chất lượng</h3>
		<ul>
			<li><strong>Đối với khách hàng:</strong> Xây dựng và gìn giữ các
				mối quan hệ của khách hàng là điều kiện sống còn của công ty...</li>
			<li><strong>Đối với nhân viên:</strong> Thúc đẩy công tác đào
				tạo để giúp cho mỗi nhân viên trở thành những con người ngày một
				hoàn thiện...</li>
			<li><strong>Đối với cộng đồng:</strong> Cam kết nỗ lực đóng góp
				vào sự phát triển và thịnh vượng của nền kinh tế nước nhà...</li>
		</ul>

		<h3>4. Mục tiêu và sứ mệnh</h3>
		<p>- Mọi hoạt động của công ty đều hướng đến lợi ích của khách
			hàng...</p>

		<h3>5. Giá trị niềm tin</h3>
		<p>- Chúng tôi luôn tin tưởng và nỗ lực phấn đấu hết mình để trở
			thành một công ty phân phối hàng đầu các thiết bị ngành điện nước,
			nhằm mang lại giá trị sản phẩm tốt nhất cho khách hàng.</p>
		<p>- Niềm tin và uy tín trong sản xuất kinh doanh của chúng tôi
			luôn xuất phát từ tinh thần văn hóa, thể hiện ở nỗ lực bảo vệ uy tín,
			thương hiệu trong sản phẩm tạo ra, cố gắng đem lại cái tốt nhất của
			mình cống hiến cho khách hàng.</p>
		<p>- Hiện nay, công ty chúng tôi có nhiều khách hàng triển vọng
			với rất nhiều việc phải làm, nên chúng tôi thường đưa ra các chiến
			lược xây dựng sự tin tưởng và mối quan hệ khách hàng. Niềm tin, uy
			tín, kiên nhẫn tìm cho mình một con đường phát triển trong khách
			hàng.</p>

		<p>
			<strong>“Kinh tế sáng tạo, luôn đổi mới để thành công“ với 5
				tiêu chí:</strong>
		</p>
		<ul>
			<li>Chú trọng khách hàng</li>
			<li>Kỷ luật tự chủ</li>
			<li>Đam mê công việc</li>
			<li>Hiệu quả, công bằng</li>
			<li>Thành công tốt đẹp</li>
		</ul>

	</main>

	<footer class="footer">
		<p>&copy; 2025 Công Ty TNHH Phân Phối Thiết Bị Điện Nước HoangLong</p>
	</footer>

	
</body>
</html>
