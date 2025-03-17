<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Nhân Viên</title>
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
    <h1>Danh Sách Nhân Viên</h1>
    <div class="table-container">
        <a href="${pageContext.request.contextPath}/NhanVien/add" class="btn">Thêm Mới Nhân Viên</a>
        <a href="${pageContext.request.contextPath}/menu" class="btn">Quay Lại Menu</a>
        <table>
            <tr>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Chức Vụ</th>
                <th>Hành Động</th>
            </tr>
            <c:forEach var="nv" items="${list}">
                <tr>
                    <td>${nv.lhl_hoten}</td>
                    <td>${nv.lhl_sodienthoai}</td>
                    <td>${nv.lhl_chucvu}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/NhanVien/edit/${nv.lhl_manv}">Sửa</a> | 
                        <a href="${pageContext.request.contextPath}/NhanVien/delete/${nv.lhl_manv}" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
