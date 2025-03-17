<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Khách Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            font-size: 30px;
            margin-top: 20px;
            color: #333;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }

        input[type="text"], input[type="email"], input[type="tel"], textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            display: inline-block;
            margin-top: 20px;
        }

        a:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Khách Hàng</h2>
        <!-- Form để thêm khách hàng -->
        <form action="${pageContext.request.contextPath}/KhachHang/save" method="post">
            <label for="lhl_hoten">Họ Tên:</label>
            <input type="text" name="lhl_hoten" value="${command.lhl_hoten}" required />

            <label for="lhl_email">Email:</label>
            <input type="email" name="lhl_email" value="${command.lhl_email}" required />

            <label for="lhl_sodienthoai">Số Điện Thoại:</label>
            <input type="text" name="lhl_sodienthoai" value="${command.lhl_sodienthoai}" required />

            <input type="submit" value="Lưu" />
        </form>

        <a href="${pageContext.request.contextPath}/KhachHang/list">Quay Lại Danh Sách</a>
    </div>
</body>
</html>
