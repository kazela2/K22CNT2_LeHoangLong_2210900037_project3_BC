<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <style>
        /* Toàn bộ thiết kế */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Hộp đăng ký */
        .register-container {
            background-color: #ffffff;
            padding: 3rem;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 1.5rem;
            color: #333333;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 1rem;
        }

        /* Input Fields */
        .input-field {
            width: 100%;
            padding: 12px 16px;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            color: #333;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-field:focus {
            border-color: #3498db;
        }

        /* Nút submit */
        .submit-btn {
            background-color: #3498db;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 12px 24px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #2980b9;
        }

        /* Link */
        .back-link {
            margin-top: 1rem;
            color: #3498db;
            font-size: 16px;
            text-decoration: none;
        }

        .back-link:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Đăng ký tài khoản</h2>

        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <form action="/SpringMVCPagination/dangki" method="post">
            <input id="lhl_tendangnhap" type="text" name="lhl_tendangnhap" class="input-field" placeholder="Tên đăng nhập" required>

            <input id="lhl_email" type="email" name="lhl_email" class="input-field" placeholder="Email" required>

            <input id="lhl_matkhau" type="password" name="lhl_matkhau" class="input-field" placeholder="Mật khẩu" required>

            <input id="lhl_xacnhanmatkhau" type="password" name="lhl_xacnhanmatkhau" class="input-field" placeholder="Xác nhận mật khẩu" required>

            <button type="submit" class="submit-btn">Đăng ký</button>
        </form>

        <a href="login.jsp" class="back-link">Đã có tài khoản? Đăng nhập ngay</a>
    </div>
</body>
</html>
