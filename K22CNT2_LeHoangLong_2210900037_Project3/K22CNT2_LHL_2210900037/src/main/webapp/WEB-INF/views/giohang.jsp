<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách giỏ hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2 {
            font-size: 30px;
            margin-top: 20px;
            color: #333;
        }
        .cart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            margin-top: 20px;
        }
        .cart-item {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
            border-radius: 5px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            width: 300px;
            transition: transform 0.3s ease-in-out;
        }
        .cart-item:hover {
            transform: scale(1.05);
        }
        .cart-item h3 {
            font-size: 20px;
            margin: 10px 0;
            color: #2c3e50;
        }
        .price {
            color: red;
            font-size: 18px;
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .delete-btn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #e74c3c;
            color: white;
            font-size: 14px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        .delete-btn:hover {
            background-color: #c0392b;
        }
        .cart-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            transition: transform 0.3s ease-in-out;
        }
        .cart-item img:hover {
            transform: scale(1.05);
        }
        .empty-cart {
            font-size: 18px;
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Danh sách giỏ hàng</h2>
    <c:if test="${not empty message}">
    	<p style="color: green;">${message}</p>
	</c:if>
    <div class="cart-container">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach var="gh" items="${list}">
                    <div class="cart-item">
                        <!-- Tìm sản phẩm tương ứng trong danh sách sanPhams -->
                        <c:forEach var="sp" items="${sanPhams}">
                            <c:if test="${sp.lhl_masp == gh.lhl_masp}">
                                <img src="${sp.lhl_hinhanh != null && !sp.lhl_hinhanh.isEmpty() ? sp.lhl_hinhanh : 'https://via.placeholder.com/320'}" 
                                     alt="${sp.lhl_tensp}">
                                <h3>${sp.lhl_tensp}</h3>
                                <p class="price">${sp.lhl_gia} VNĐ</p>
                                <p><strong>Mô tả:</strong> ${sp.lhl_mota}</p>
                                <p><strong>Danh mục:</strong> ${sp.lhl_danhmuc}</p>
                            </c:if>
                        </c:forEach>
                        <p><strong>Số lượng:</strong> ${gh.lhl_soluong}</p>
                        <!-- Nút Xóa -->
                        <a href="${pageContext.request.contextPath}/giohang/delete/${gh.lhl_magiohang}" class="delete-btn">Xóa</a>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty-cart">Giỏ hàng hiện tại trống.</p>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- Thêm nút thanh toán -->
	<a href="${pageContext.request.contextPath}/thanhtoan" class="btn">Thanh toán</a>
    
    <a href="${pageContext.request.contextPath}/dichvu" class="btn">Quay lại</a>
</body>
</html>