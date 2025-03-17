<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Danh Sách Bảo Hành</title>
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
            padding: 8px 12px;
            border: 1px solid #3498db;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
            color: white;
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
    <h1>Danh Sách Bảo Hành</h1>
    <div class="table-container">
        <a href="${pageContext.request.contextPath}/BaoHanh/add" class="btn">Thêm Mới</a>
        <a href="${pageContext.request.contextPath}/menu" class="btn">Quay Lại Menu</a>
        <table>
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Ngày Bắt Đầu</th>
                <th>Ngày Kết Thúc</th>
                <th>Trạng Thái</th>
                <th>Chỉnh Sửa</th>
                <th>Xóa</th>
            </tr>
            <c:forEach var="bh" items="${list}">
                <tr>
                    <td>
                        <c:forEach var="sanPham" items="${sanPhams}">
                            <c:if test="${sanPham.lhl_masp == bh.lhl_masp}">
                                ${sanPham.lhl_tensp}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <fmt:formatDate value="${bh.lhl_ngaybatdau}" pattern="yyyy/MM/dd" />
                    </td>
                    <td>
                        <fmt:formatDate value="${bh.lhl_ngayketthuc}" pattern="yyyy/MM/dd" />
                    </td>
                    <td>${bh.lhl_trangthai}</td>
                    <td><a href="${pageContext.request.contextPath}/BaoHanh/edit/${bh.lhl_mabaohanh}">Chỉnh Sửa</a></td>
                    <td><a href="${pageContext.request.contextPath}/BaoHanh/delete/${bh.lhl_mabaohanh}" onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
