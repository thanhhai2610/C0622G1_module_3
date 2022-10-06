package reponsitory.person.impl;

import model.person.Customer;
import reponsitory.person.ICustomerRepo;

import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    @Override
    public void insertCustomer(Customer customer) {

    }

    @Override
    public List<Customer> selectAllCustomer() {
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
