<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Kho Hàng Mới</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            font-size: 30px;
            margin-top: 20px;
            color: #333;
        }

        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 20px auto;
            width: 50%;
            max-width: 600px;
        }

        label {
            font-size: 16px;
            color: #333;
            margin-top: 10px;
            display: block;
            text-align: left;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            margin-top: 20px;
            display: inline-block;
        }

        a:hover {
            color: #2980b9;
        }

        .form-container a {
            margin-top: 15px;
            display: inline-block;
            font-size: 16px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Kho Hàng Mới</h2>
        <!-- Form để thêm kho hàng -->
        <form action="${pageContext.request.contextPath}/KhoHang/save" method="post">
            <!-- Các trường của kho hàng -->
            <label>Tên Sản Phẩm:</label>
            <select name="lhl_masp" required>
                <option value="" disabled selected>Chọn Sản Phẩm</option>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.lhl_masp}">${sanPham.lhl_tensp}</option>
                </c:forEach>
            </select><br/>

            <label>Số Lượng Tồn:</label>
            <input type="number" name="lhl_soluongton" required/><br/>

            <label>Ngày Nhập:</label>
            <input type="text" name="lhl_ngaynhap" required/><br/>

            <input type="submit" value="Lưu"/>
        </form>
        
        <br/>
        <!-- Liên kết quay lại danh sách kho hàng -->
        <a href="${pageContext.request.contextPath}/KhoHang/list">Quay lại danh sách</a>
    </div>
</body>
</html>
