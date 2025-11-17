<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> 
<%
    // Ambil objek 'user' dari session, sama seperti di page.jsp
    User user = (User) session.getAttribute("user");

    // Jika tidak ada objek user di session (artinya belum login), paksa kembali ke halaman login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Hentikan pemrosesan sisa halaman ini
    }

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Products - ShopTrend</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet"/>
  <style>
    body { background-color: #f8f9fa; font-family: "Poppins", sans-serif; }
    .navbar { background-color: #fff; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }
    .navbar-brand { font-weight: 700; font-size: 1.5rem; }
    .card-img-top { object-fit: cover; height: 200px; }
    .footer { background-color: #343a40; color: white; padding: 30px 0; }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">ShopTrend</a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="page.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link active" href="#">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <i class="fas fa-shopping-cart"></i></a></li>
        <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<%
  String[] gambar = {
    "buku.jpg", "bukumahayana.jpg", "bukusejarah.jpg", "bukucerita.jpg",
    "bukunovel.jpg", "bukuanak.jpg", "bukuteknologi.jpg", "bukukesehatan.jpg"
  };
  String[] namaProduk = {
    "Buku Ajar", "Buku Mahayana", "Buku Sejarah", "Buku Cerita",
    "Buku Novel", "Buku Anak", "Buku Teknologi", "Buku Kesehatan"
  };
  String[] deskripsi = {
    "Panduan belajar lengkap dan mudah.",
    "Ajaran Mahayana secara mendalam.",
    "Sejarah dunia dalam narasi menarik.",
    "Cerita anak penuh nilai moral.",
    "Kisah penuh emosi dan inspirasi.",
    "Cerita seru anak-anak kreatif.",
    "Referensi teknologi terkini.",
    "Tips hidup sehat dan bugar."
  };
  double[] harga = {39.99, 49.99, 29.99, 19.99, 34.99, 24.99, 59.99, 44.99};
%>

<section class="py-5">
  <div class="container">
    <h2 class="text-center mb-4">All Products</h2>
    <div class="row row-cols-1 row-cols-md-4 g-4">
      <% for (int i = 0; i < 8; i++) { %>
      <div class="col">
        <div class="card h-100">
          <img src="<%= gambar[i] %>" class="card-img-top" alt="<%= namaProduk[i] %>" />
          <div class="card-body">
            <h5 class="card-title"><%= namaProduk[i] %></h5>
            <p class="card-text"><%= deskripsi[i] %></p>
            <h6>$<%= String.format("%.2f", harga[i]) %></h6>
            <a href="cart.jsp" class="btn btn-outline-primary">Add to Cart</a>
          </div>
        </div>
      </div>
      <% } %>
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
