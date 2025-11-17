<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> 
<%
    // Ambil objek 'user' dari session, ini cara yang benar
    User user = (User) session.getAttribute("user");

    // Jika tidak ada objek user di session (artinya belum login), paksa kembali ke halaman login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Hentikan pemrosesan sisa halaman ini
    }

    // Jika user ada, maka halaman akan lanjut ditampilkan.
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cart - ShopTrend</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet"/>
  <style>
    body { background-color: #f8f9fa; font-family: "Poppins", sans-serif; }
    .navbar { background-color: #fff; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }
    .navbar-brand { font-weight: 700; font-size: 1.5rem; }
    .footer { background-color: #343a40; color: white; padding: 30px 0; }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">ShopTrend</a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="page.jsp">Home</a></li> <%-- Sebaiknya ke page.jsp juga --%>
        <li class="nav-item"><a class="nav-link" href="productss.jsp">Products</a></li> <%-- PERBAIKI DI SINI --%>
        <li class="nav-item"><a class="nav-link active" href="cart.jsp">Cart <i class="fas fa-shopping-cart"></i></a></li>
        <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
       </ul>
    </div>
  </div>
</nav>

<section class="py-5">
  <div class="container">
    <h2 class="mb-4">Your Shopping Cart</h2>

    <table class="table table-bordered bg-white shadow-sm">
      <thead class="table-light">
        <tr>
          <th>Product</th>
          <th>Price</th>
          <th>Qty</th>
          <th>Total</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <% for (int i = 1; i <= 2; i++) { %>
        <tr>
          <td>Product <%= i %></td>
          <td>$<%= 29 + i * 10 %>.99</td>
          <td>1</td>
          <td>$<%= 29 + i * 10 %>.99</td>
          <td><a href="#" class="btn btn-sm btn-danger">Remove</a></td>
        </tr>
        <% } %>
      </tbody>
    </table>

    <div class="text-end">
      <h5>Total: <strong>$139.98</strong></h5>
      <a href="#" class="btn btn-success mt-3">Checkout</a>
    </div>
  </div>
</section>

<footer class="footer text-center">
  <div class="container">
    <p>© 2025 ShopTrend. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
