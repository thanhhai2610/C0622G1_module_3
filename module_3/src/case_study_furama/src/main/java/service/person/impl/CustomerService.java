package service.person.impl;

import model.person.Customer;
import reponsitory.facility.IHouseRepo;
import reponsitory.person.ICustomerRepo;
import reponsitory.person.impl.CustomerRepo;
import service.person.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepo customerRepo = new CustomerRepo();
    @Override
    public void insertCustomer(Customer customer) {
        customerRepo.insertCustomer(customer);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepo.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepo.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepo.updateCustomer(customer);
    }
}
