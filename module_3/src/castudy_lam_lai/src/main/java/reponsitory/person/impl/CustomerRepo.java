package reponsitory.person.impl;

import model.person.Customer;
import reponsitory.person.ICustomerRepo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_case_study_2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678Hai$$$";

    private static final String INSERT_USERS_SQL = "SELECT * FROM employee;\n" +
            "INSERT INTO `furama_case_study_2`.`employee` (`name`, `date_of_birth`, `id_card`, `salary`, `phone_number`," +
            " `emai`, `eddress`, `position_id`, `education_degree_id`, `division_id`, `username`) VALUES (?, ?, ?,?,?, ?, ?, ?,?, ?, ?);\n";
    private static final String SELECT_EMPLOYEE_NAME = "SELECT * FROM employee WHERE name like ?;";
    private static final String SELECT_EMPLOYEE = "select * from employee where status_display = 0; ";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertCustomer(Customer customer) {

    }

    @Override
    public List<Customer> selectAllCustomer() {
        return null;
    }

    @Override
    public List<Customer> selectCustomerName(String name) {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return false;
    }
}
