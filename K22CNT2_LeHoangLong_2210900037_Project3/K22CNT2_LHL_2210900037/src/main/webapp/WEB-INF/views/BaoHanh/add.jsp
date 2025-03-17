<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Bảo Hành</title>
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
            margin: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label {
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="tel"], select, input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            text-decoration: none;
            color: #3498db;
            display: inline-block;
            margin-top: 15px;
            font-size: 16px;
        }

        a:hover {
            color: #2980b9;
        }
    </style>
    <script>
        // Hàm chuyển đổi định dạng ngày từ yyyy-mm-dd thành yyyy/mm/dd
        function convertDateFormat(input) {
            var date = input.value;
            if (date) {
                // Kiểm tra xem định dạng có phải yyyy-mm-dd không
                var parts = date.split('-');
                if (parts.length === 3) {
                    // Chuyển sang yyyy/mm/dd
                    input.value = parts.join('/');
                }
            }
        }

        // Khi người dùng nhập vào các trường ngày, tự động chuyển đổi định dạng
        window.onload = function() {
            var ngayBatDauInput = document.getElementById('ngaybatdau');
            var ngayKetThucInput = document.getElementById('ngayketthuc');
            
            ngayBatDauInput.addEventListener('blur', function() {
                convertDateFormat(ngayBatDauInput);
            });
            ngayKetThucInput.addEventListener('blur', function() {
                convertDateFormat(ngayKetThucInput);
            });
        };
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Bảo Hành</h2>
        <!-- Form để thêm bảo hành -->
        <form action="${pageContext.request.contextPath}/BaoHanh/save" method="post">
            <!-- Mã Sản Phẩm -->
            <label for="lhl_masp">Tên Sản Phẩm:</label>
            <select name="lhl_masp" required>
                <option value="" disabled selected>Chọn Sản Phẩm</option>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.lhl_masp}">${sanPham.lhl_tensp}</option>
                </c:forEach>
            </select><br/>

            <label for="lhl_ngaybatdau">Ngày Bắt Đầu:</label>
            <input type="text" name="lhl_ngaybatdau" value="${command.lhl_ngaybatdau}" id="ngaybatdau" required /><br />
            
            <label for="lhl_ngayketthuc">Ngày Kết Thúc:</label>
            <input type="text" name="lhl_ngayketthuc" value="${command.lhl_ngayketthuc}" id="ngayketthuc" required /><br />

            <label for="lhl_trangthai">Trạng Thái:</label>
            <select name="lhl_trangthai" required>
                <option value="Bao Hanh">Bảo Hành</option>
                <option value="Het Han">Hết Hạn Bảo Hành</option>
            </select><br />

            <input type="submit" value="Lưu" />
        </form>

        <br />
        <!-- Quay lại danh sách bảo hành -->
        <a href="${pageContext.request.contextPath}/BaoHanh/list">Quay lại danh sách</a>
    </div>
</body>
</html>
