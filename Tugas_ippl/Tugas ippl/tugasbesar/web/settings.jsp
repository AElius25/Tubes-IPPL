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

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Settings - Admin</title>
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

    <div class="col-md-10 p-4">
      <h2 class="mb-4">Settings</h2>
      <form class="bg-white shadow-sm p-4 rounded">
        <div class="mb-3">
          <label class="form-label">Store Name</label>
          <input type="text" class="form-control" value="E-Shop" />
        </div>
        <div class="mb-3">
          <label class="form-label">Default Currency</label>
          <select class="form-select">
