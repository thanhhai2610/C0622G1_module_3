package service.person.impl;

import model.person.Customer;
import reponsitory.person.IEmployeeRepo;
import reponsitory.person.impl.EmployeeRepo;
import service.person.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public void insertCustomer(Customer customer) {
        employeeRepo.insertCustomer(customer);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return employeeRepo.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) {
        return employeeRepo.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return employeeRepo.updateCustomer(customer);
    }
}
