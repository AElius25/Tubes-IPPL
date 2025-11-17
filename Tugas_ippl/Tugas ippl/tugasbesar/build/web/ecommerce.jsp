<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> 
<%
    // Ambil objek 'user' dari session (cara yang benar)
    User user = (User) session.getAttribute("user");

    // 1. Cek apakah sudah login atau belum
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Hentikan eksekusi
    }

    // 2. Jika sudah login, cek apakah rolenya admin
    if (!"admin".equalsIgnoreCase(user.getRole())) {
        // Jika bukan admin, tendang ke halaman user
        response.sendRedirect("page.jsp");
        return; // Hentikan eksekusi
    }

    // Jika lolos kedua pengecekan, berarti dia admin.
    // Ambil username untuk ditampilkan di halaman.
    String username = user.getUsername();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            body {
                background-color: #f8f9fa;
            }
            .sidebar {
                height: 100vh;
                background-color: #343a40;
            }
            .sidebar a {
                color: #fff;
                text-decoration: none;
                display: block;
                padding: 15px;
                border-bottom: 1px solid #495057;
            }
            .sidebar a:hover {
                background-color: #495057;
            }
            .card-stats {
                border-left: 4px solid #0d6efd;
            }
            .product-card img {
                max-height: 150px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar d-flex flex-column p-0">
                    <h4 class="text-white text-center py-3">Admin Panel</h4>
                    <a href="page.jsp">Dashboard</a>
                    <a href="orders.jsp">Orders</a>
                    <a href="products.jsp">Products</a>
                    <a href="customers.jsp">Customers</a>
                    <a href="reports.jsp">Reports</a>
                    <a href="settings.jsp">Settings</a>
                    <a href="logout.jsp" class="text-danger mt-auto text-center">Logout</a>
                </div>

                <!-- Main Content -->
                <div class="col-md-10 p-4">
                    <h2 class="mb-4">Welcome, <%= username%> (Admin)</h2>

                    <!-- Dashboard Stats -->
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="card card-stats shadow-sm">
                                <div class="card-body">
                                    <h5>Total Orders</h5>
                                    <h3>1,245</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-stats shadow-sm">
                                <div class="card-body">
                                    <h5>Revenue</h5>
                                    <h3>$180,560</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-stats shadow-sm">
                                <div class="card-body">
                                    <h5>Customers</h5>
                                    <h3>832</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- TAMBAHKAN BLOK ARRAY INI --%>
                    <%
                        String[] gambar = {"buku.jpg", "bukumahayana.jpg", "bukusejarah.jpg", "bukucerita.jpg"};
                        String[] namaProduk = {"Buku Ajar", "Buku Mahayana", "Buku Sejarah", "Buku Cerita"};
                        String[] deskripsi = {
                            "Panduan belajar yang lengkap dan mudah.",
                            "Penjelasan mendalam ajaran Mahayana.",
                            "Ulasan sejarah dunia secara kronologis.",
                            "Cerita anak-anak penuh nilai moral."
                        };
                        double[] harga = {39.99, 49.99, 29.99, 19.99};
                    %>

                    <h4 class="mb-3">Popular Products</h4>
                    <div class="row">
                        <%-- ... (bagian loop produk di bawah ini) ... --%>
                        <h4 class="mb-3">Popular Products</h4>
                        <div class="row">
                            <% for (int i = 0; i < 4; i++) {%>
                            <div class="col-md-3 mb-4">
                                <div class="card product-card shadow-sm h-100">
                                    <%-- Menggunakan data dari array --%>
                                    <img src="<%= gambar[i]%>" class="card-img-top" alt="<%= namaProduk[i]%>" />
                                    <div class="card-body">
                                        <h6 class="card-title"><%= namaProduk[i]%></h6>
                                        <p class="card-text text-muted"><%= deskripsi[i]%></p>
                                        <h5 class="fw-bold">$<%= String.format("%.2f", harga[i])%></h5>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
