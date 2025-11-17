package dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            String url = "jdbc:mysql://localhost:3306/ecommerce_db"; 
            String user = "root"; 
            String password = ""; 

            Class.forName("com.mysql.cj.jdbc.Driver"); 
            connection = DriverManager.getConnection(url, user, password);
        }
        return connection;
    }
}
