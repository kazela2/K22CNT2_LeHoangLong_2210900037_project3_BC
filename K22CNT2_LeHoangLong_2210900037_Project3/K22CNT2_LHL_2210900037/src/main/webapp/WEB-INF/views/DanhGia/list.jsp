<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Đánh Giá</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            font-size: 30px;
            margin-top: 20px;
            color: #333;
        }

        .table-container {
            margin: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            color: #2980b9;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            margin: 20px 0;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .actions {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Đánh Giá</h1>
    <div class="table-container">
        <a href="${pageContext.request.contextPath}/DanhGia/add" class="btn">Thêm Mới Đánh Giá</a>
        <a href="${pageContext.request.contextPath}/menu" class="btn">Quay Lại Menu</a>
        <table>
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Tên Khách Hàng</th>
                <th>Đánh Giá</th>
                <th>Nhận Xét</th>
                <th>Chỉnh Sửa</th>
                <th>Xóa</th>
            </tr>
            <c:forEach var="dg" items="${list}">
                <tr>
                    <td>
                        <c:forEach var="sanPham" items="${sanPhams}">
                            <c:if test="${sanPham.lhl_masp == dg.lhl_masp}">
                                ${sanPham.lhl_tensp}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="khachHang" items="${khachHangs}">
                            <c:if test="${khachHang.lhl_makh == dg.lhl_makh}">
                                ${khachHang.lhl_hoten}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${dg.lhl_danhgia}</td>
                    <td>${dg.lhl_nhanxet}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/DanhGia/edit/${dg.lhl_madanhgia}">Chỉnh Sửa</a>
                    </td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/DanhGia/delete/${dg.lhl_madanhgia}" onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
