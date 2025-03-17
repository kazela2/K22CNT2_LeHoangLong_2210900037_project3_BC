<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chỉnh Sửa Đánh Giá</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-top: 20px;
        }

        input[type="text"], select, input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            text-decoration: none;
            color: #3498db;
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }

        a:hover {
            color: #2980b9;
        }

        label {
            font-size: 16px;
            margin-bottom: 6px;
            display: block;
        }
    </style>
</head>
<body>
    <div>
        <h2>Chỉnh Sửa Đánh Giá</h2>
        <form action="${pageContext.request.contextPath}/DanhGia/editsave" method="post">
            <input type="hidden" name="lhl_madanhgia" value="${command.lhl_madanhgia}"/>

            <label>Tên Sản Phẩm:</label>
            <select name="lhl_masp" required>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.lhl_masp}" ${command.lhl_masp == sanPham.lhl_masp ? 'selected' : ''}>
                        ${sanPham.lhl_tensp}
                    </option>
                </c:forEach>
            </select>
            
            <label>Tên Khách Hàng:</label>
            <select name="lhl_makh" required>
                <option value="" disabled selected>Chọn Mã Khách Hàng</option>
                <c:forEach var="khachHang" items="${khachHangs}">
                    <option value="${khachHang.lhl_makh}" ${command.lhl_makh == khachHang.lhl_makh ? 'selected' : ''}>
                        ${khachHang.lhl_hoten}
                    </option>
                </c:forEach>
            </select>
            
            <label>Đánh Giá:</label>
            <select name="lhl_danhgia" required>
                <c:forEach var="i" begin="1" end="5">
                    <option value="${i}" ${command.lhl_danhgia == i ? 'selected' : ''}>${i} Sao</option>
                </c:forEach>
            </select>
            
            <label>Nhận Xét:</label>
            <input type="text" name="lhl_nhanxet" value="${command.lhl_nhanxet}" required />
            
            <input type="submit" value="Cập Nhật"/>
        </form>
        
        <br/>
        <a href="${pageContext.request.contextPath}/DanhGia/list">Quay Lại Danh Sách</a>
    </div>
</body>
</html>
