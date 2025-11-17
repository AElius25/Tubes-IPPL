<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow" style="min-width: 400px;">
      <h3 class="text-center mb-3">Register</h3>
      <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Registrasi gagal. Coba lagi.</p>
    <% } else if (request.getParameter("success") != null) { %>
        <p style="color:green;">Registrasi berhasil! Silakan login.</p>
    <% } %>
      <form method="post" action="register">
        <div class="mb-3">
          <label for="username">Username</label>
          <input type="text" class="form-control" id="username" name="username" required />
        </div>
        <div class="mb-3">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" name="email" required />
        </div>
        <div class="mb-3">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" required />
        </div>
        <div class="mb-3">
          <label for="role">Role</label>
          <select class="form-select" id="role" name="role" required>
            <option value="user">User</option>
            <option value="admin">Admin</option>
          </select>
        </div>
        <button type="submit" class="btn btn-success w-100">Register</button>
        <div class="text-center mt-3">
          <small>Sudah punya akun? <a href="login.jsp">Login di sini</a></small>
        </div>
      </form>
    </div>
  </div>
</body>
</html>