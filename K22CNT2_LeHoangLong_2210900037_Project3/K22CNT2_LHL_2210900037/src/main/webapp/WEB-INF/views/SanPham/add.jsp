<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm</title>
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

        input[type="text"],
        input[type="number"],
        textarea,
        select {
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
            margin-top: 15px;
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

        textarea {
            resize: vertical;
            height: 120px;
        }

        select:focus {
            border-color: #3498db;
            outline: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Sản Phẩm</h2>
        <!-- Form để thêm sản phẩm -->
        <form action="${pageContext.request.contextPath}/SanPham/save" method="post">
            <!-- Các trường của sản phẩm -->
            <label>Tên Sản Phẩm:</label>
            <input type="text" name="lhl_tensp" value="${command.lhl_tensp}" required/><br/>
            
            <label>Mô Tả:</label>
            <textarea name="lhl_mota">${command.lhl_mota}</textarea><br/>
            
            <label>Danh Mục:</label>
            <select name="lhl_danhmuc" required>
                <option value="Thiet bi dien" ${command.lhl_danhmuc == 'Thiet bi dien' ? 'selected' : ''}>Thiết bị điện</option>
                <option value="Thiet bi nuoc" ${command.lhl_danhmuc == 'Thiet bi nuoc' ? 'selected' : ''}>Thiết bị nước</option>
                <option value="Phu kien" ${command.lhl_danhmuc == 'Phu Kien' ? 'selected' : ''}>Phụ kiện</option>
            </select><br/>
            
            <label>Giá:</label>
            <input type="number" name="lhl_gia" value="${command.lhl_gia}" required/><br/>
            
            <label>Hình Ảnh:</label>
            <input type="text" name="lhl_hinhanh" value="${command.lhl_hinhanh}" placeholder="Nhập URL hình ảnh" /><br/>
            
            <input type="submit" value="Lưu"/>
        </form>

        <br/>
        <!-- Liên kết quay lại danh sách sản phẩm -->
        <a href="${pageContext.request.contextPath}/SanPham/list">Quay lại danh sách</a>
    </div>
</body>
</html>
