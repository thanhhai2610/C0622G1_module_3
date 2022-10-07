package reponsitory.person.impl;

import model.person.Employee;
import reponsitory.person.IEmployeeRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {

    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_case_study_2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678Hai$$$";

    private static final String INSERT_USERS_SQL = "INSERT INTO `furama_case_study_2`.`employee` (" +
            "`name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `emai`, `eddress`," +
            " `position_id`, `education_degree_id`, `division_id`, `username`) " +
            "VALUES (?,?, ?, ?,?,?, ?, ?, ?, ?, ? );";
    private static final String SELECT_EMPLOYEE_NAME = "SELECT * FROM employee WHERE name like ?;";
    private static final String SELECT_EMPLOYEE = "select * from employee where status_display = 0; ";
    private static final String EDIT_EMPLOYEE = "UPDATE employee set name = ?, date_of_birth=?, id_card = ?, salary = ? ," +
            " phone_number =?, emai = ?, eddress =?, position_id =  ?, education_degree_id = ?, division_id =?, username =? where id =?;";
    private static final String SELECT_EMPLOYEE_ID = "SELECT * FROM employee WHERE id = ?;";

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
            prepareStatement.setString(8, String.valueOf((employee.getPositionId())));
            prepareStatement.setString(9, String.valueOf((employee.getEducationDegreeId())));
            prepareStatement.setString(10, String.valueOf((employee.getDivisionId())));
            prepareStatement.setString(11, employee.getUsername());
            prepareStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public List<Employee> selectEmployeeName(String nameInput) {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_NAME)) {
            preparedStatement.setString(1, "%" + nameInput + "%");
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

    public Employee selectEmployeeId(int id) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_ID)) {
            preparedStatement.setString(1, String.valueOf(id));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
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
                employee = new Employee(id, name, birthday, idCard, salary,
                        phone, email, address, positionId, educationDegreeId, divisionId, username);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
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
        boolean rowDeleted = false;
        try {
            try (Connection connection = getConnection();
                 CallableStatement callableStatement = connection.prepareCall("{call DELETE_EMPLOYEE(?)}")) {
                callableStatement.setInt(1, id);
                rowDeleted = callableStatement.executeUpdate() > 0;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        boolean rowUpdated = false;
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, (employee.getSalary()));
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, (employee.getPositionId()));
            preparedStatement.setInt(9, (employee.getEducationDegreeId()));
            preparedStatement.setInt(10, (employee.getDivisionId()));
            preparedStatement.setString(11, employee.getUsername());
            preparedStatement.setString(12, String.valueOf(employee.getId()));

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
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
