package reponsitory.person.impl;

import model.person.Employee;
import reponsitory.person.IEmployeeRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {

    private static final String INSERT_USERS_SQL = "INSERT INTO employee (`name`, `date_of_birth`, " +
            "`id_card`, `salary`, `phone_number`, `emai`, `eddress`, `position_id`, `education_degree_id`," +
            " `division_id`, `username`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_case_study_2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678Hai$$$";

    private static final String SELECT_EMPLOYEE = "select * from employee ";

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
    public void insertEmployee(Employee employee) {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(INSERT_USERS_SQL)
        ) {
            prepareStatement.setString(1, employee.getName());
            prepareStatement.setString(2, employee.getBirthday());
            prepareStatement.setString(3, employee.getIdCard());
            prepareStatement.setDouble(4, (employee.getSalary()));
            prepareStatement.setString(5, employee.getPhone());
            prepareStatement.setString(6, employee.getEmail());
            prepareStatement.setString(7, employee.getAddress());
            prepareStatement.setInt(8, (employee.getPositionId()));
            prepareStatement.setInt(9, (employee.getEducationDegreeId()));
            prepareStatement.setInt(10, (employee.getDivisionId()));
            prepareStatement.setString(11, employee.getUsername());
            prepareStatement.executeUpdate();
            System.out.println("thêm xong...............");
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                double salary = Double.parseDouble(rs.getString("salary"));
                String phone = rs.getString("phone_number");
                String email = rs.getString("emai");
                String address = rs.getString("eddress");
                int positionId = Integer.parseInt(rs.getString("position_id"));
                int educationDegreeId = Integer.parseInt(rs.getString("education_degree_id"));
                int divisionId = Integer.parseInt(rs.getString("division_id"));
                String username = rs.getString("username");
                employeeList.add(new Employee(id, name, birthday, idCard, salary,
                        phone, email, address, positionId, educationDegreeId, divisionId, username));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployee(int id) {
        return false;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return false;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
