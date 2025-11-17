<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> 
<%
    // 1. Ambil objek 'user' dari session
    User user = (User) session.getAttribute("user");

    // 2. Cek apakah pengguna sudah login atau belum
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Hentikan eksekusi halaman
    }

    // 3. Jika sudah login, cek apakah perannya adalah 'admin'
    if (!"admin".equalsIgnoreCase(user.getRole())) {
        // Jika bukan admin, tendang ke halaman user biasa
        response.sendRedirect("page.jsp");
        return; // Hentikan eksekusi halaman
    }

    // Jika semua pengecekan lolos, halaman akan lanjut ditampilkan.
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customers - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body { background-color: #f8f9fa; }
    .sidebar { height: 100vh; background-color: #343a40; }
    .sidebar a {
      color: #fff; text-decoration: none; display: block; padding: 15px; border-bottom: 1px solid #495057;
    }
    .sidebar a:hover { background-color: #495057; }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-2 sidebar d-flex flex-column p-0">
      <h4 class="text-white text-center py-3">Admin Panel</h4>
      <a href="ecommerce.jsp">Dashboard</a>
      <a href="orders.jsp">Orders</a>
      <a href="products.jsp">Products</a>
      <a href="customers.jsp">Customers</a>
      <a href="reports.jsp">Reports</a>
      <a href="settings.jsp">Settings</a>
      <a href="logout.jsp" class="text-danger mt-auto text-center">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="col-md-10 p-4">
      <h2 class="mb-4">Customer List</h2>
      <table class="table table-striped bg-white shadow-sm">
        <thead class="table-light">
          <tr><th>Name</th><th>Email</th><th>Joined</th><th>Status</th></tr>
        </thead>
        <tbody>
          <tr><td>John Doe</td><td>john@example.com</td><td>2024-12-01</td><td>Active</td></tr>
          <tr><td>Jane Smith</td><td>jane@example.com</td><td>2024-11-15</td><td>Inactive</td></tr>
          <tr><td>Michael Lee</td><td>mike@example.com</td><td>2025-01-20</td><td>Active</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
