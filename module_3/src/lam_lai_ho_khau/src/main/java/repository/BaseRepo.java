package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public  class BaseRepo {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/quan_ly_ho_khau?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "12345678Hai$$$";

    public static Connection getConnectDB() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
