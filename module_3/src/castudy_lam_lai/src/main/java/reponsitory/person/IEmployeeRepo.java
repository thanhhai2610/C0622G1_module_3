package reponsitory.person;

import model.person.Employee;

import java.util.List;

public interface IEmployeeRepo {
    public void insertEmployee(Employee employee);

    public List<Employee> selectAllEmployee();

    public List<Employee> selectEmployeeName(String name);

    public boolean deleteEmployee(int id);

    public boolean updateEmployee(Employee employee);
}
