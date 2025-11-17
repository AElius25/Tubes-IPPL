package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import dao.UserDAO;
import model.User;
import dbconnection.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserDAO dao = new UserDAO(DBConnection.getConnection());
            User user = dao.login(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Cek role dari user yang berhasil login
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    // Jika rolenya admin, arahkan ke ecommerce.jsp
                    response.sendRedirect("ecommerce.jsp");
                } else {
                    // Jika rolenya bukan admin (yaitu user), arahkan ke page.jsp
                    response.sendRedirect("page.jsp");
                }

            } else {
                // Jika user null (login gagal)
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Mungkin tambahkan redirect ke halaman error
        }
    }
}
