<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa Nhân Viên</title>
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
        input[type="tel"],
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
    <h2>Chỉnh sửa Nhân Viên</h2>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/NhanVien/editsave" method="post">
            <input type="hidden" name="lhl_manv" value="${command.lhl_manv}">
            
            <label>Họ Tên:</label>
            <input type="text" name="lhl_hoten" value="${command.lhl_hoten}" required><br>
            
            <label>Số Điện Thoại:</label>
            <input type="tel" name="lhl_sodienthoai" value="${command.lhl_sodienthoai}" required><br>
            
            <label>Chức Vụ:</label>
            <select name="lhl_chucvu" required>
                <option value="Telesales" ${command.lhl_chucvu == 'Telesales' ? 'selected' : ''}>Nhân viên Telesales</option>
                <option value="Kho" ${command.lhl_chucvu == 'Kho' ? 'selected' : ''}>Nhân viên Kho</option>
                <option value="QuanLy" ${command.lhl_chucvu == 'QuanLy' ? 'selected' : ''}>Quản lý</option>
            </select><br>

            <input type="submit" value="Lưu">
            <a href="${pageContext.request.contextPath}/NhanVien/list">Hủy</a>
        </form>
    </div>
</body>
</html>
