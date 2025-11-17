<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 shadow" style="min-width: 350px;">
            <h3 class="text-center mb-3">Login</h3>
            
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Login gagal. Periksa kembali username dan password Anda.
                </div>
            <% } %>
            
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success" role="alert">
                    Registrasi berhasil! Silakan login.
                </div>
            <% } %>

            <form method="post" action="login">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required />
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
                <div class="text-center mt-3">
                    <small>Belum punya akun? <a href="register.jsp">Daftar di sini</a></small>
                </div>
            </form>
        </div>
    </div>
</body>
</html>