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
  <title>Reports - Admin</title>
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
      <h2 class="mb-4">Sales Report</h2>
      <div class="card shadow-sm p-3 mb-4 bg-white">
        <h5>Summary</h5>
        <ul>
          <li>Total Revenue: <strong>$18,560</strong></li>
          <li>Total Orders: <strong>1,245</strong></li>
          <li>New Customers This Month: <strong>83</strong></li>
        </ul>
      </div>
      <div class="card shadow-sm p-3 bg-white">
        <h5>Performance Notes</h5>
        <p>Sales increased by 15% compared to last month. The most popular product category was "Accessories".</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
