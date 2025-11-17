<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");

    if (role != null) {
        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect("ecommerce.jsp");
            return;
        } else if ("user".equalsIgnoreCase(role)) {
            response.sendRedirect("page.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome to E-Commerce App</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body {
      background: linear-gradient(135deg, #6f42c1, #007bff);
      color: white;
      font-family: 'Poppins', sans-serif;
    }
    .center-box {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .btn-custom {
      margin: 10px;
      width: 150px;
    }
  </style>
</head>
<body>
  <div class="center-box">
    <div>
      <h1 class="mb-4">Welcome to E-Shop</h1>
      <p class="mb-4">Silakan login atau daftar untuk melanjutkan</p>
      <a href="login.jsp" class="btn btn-light btn-lg btn-custom">Login</a>
      <a href="register.jsp" class="btn btn-outline-light btn-lg btn-custom">Register</a>
    </div>
  </div>
</body>
</html>