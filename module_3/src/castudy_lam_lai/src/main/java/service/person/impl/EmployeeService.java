package service.person.impl;

import model.person.Employee;
import reponsitory.person.IEmployeeRepo;
import reponsitory.person.impl.EmployeeRepo;
import service.person.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public void insertEmployee(Employee employee) {
        employeeRepo.insertEmployee(employee);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepo.selectAllEmployee();
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepo.deleteEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeRepo.updateEmployee(employee);
    }
}