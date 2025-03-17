<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Kho Hàng</title>
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

        .btn-edit {
            background-color: #f39c12;
            color: white;
            border: 1px solid #f39c12;
        }

        .btn-edit:hover {
            background-color: #e67e22;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            border: 1px solid #e74c3c;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .actions {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Danh Sách Kho Hàng</h1>
    <div class="table-container">
        <a href="${pageContext.request.contextPath}/KhoHang/add" class="btn">Thêm Mới Kho Hàng</a>
        <a href="${pageContext.request.contextPath}/menu" class="btn">Quay Lại Menu</a>
        <table>
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Số Lượng Tồn</th>
                <th>Ngày Nhập</th>
                <th>Hành Động</th>
            </tr>
            <c:forEach var="khang" items="${list}">
                <tr>
                    <td>
                        <c:forEach var="sanPham" items="${sanPhams}">
                            <c:if test="${sanPham.lhl_masp == khang.lhl_masp}">
                                ${sanPham.lhl_tensp}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${khang.lhl_soluongton}</td>
                    <td>${khang.lhl_ngaynhap}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/KhoHang/edit/${khang.lhl_makho}" class="btn btn-edit">Sửa</a> | 
                        <a href="${pageContext.request.contextPath}/KhoHang/delete/${khang.lhl_makho}" class="btn btn-delete" onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
