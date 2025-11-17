package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import dao.UserDAO;
import model.User;
import dbconnection.DBConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User(0, username, password, email, "user");

        try {
            UserDAO dao = new UserDAO(DBConnection.getConnection());
            
            // Cek jika username sudah ada (opsional tapi sangat direkomendasikan)
            // if (dao.isUsernameExists(username)) {
            //     response.sendRedirect("register.jsp?error=2"); // error=2 berarti username sudah terpakai
            // } else {
                if (dao.registerUser(user)) {
                    response.sendRedirect("login.jsp?success=1");
                } else {
                    response.sendRedirect("register.jsp?error=1"); // error=1 berarti kegagalan umum
                }
            // }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
