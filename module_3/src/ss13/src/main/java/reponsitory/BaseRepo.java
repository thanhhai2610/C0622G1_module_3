package reponsitory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public  class BaseRepo {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/ss13_bt1?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "12345678Hai$$$";

    public static Connection getConnectDB() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
