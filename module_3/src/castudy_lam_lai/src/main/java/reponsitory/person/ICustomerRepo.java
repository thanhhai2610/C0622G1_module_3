package reponsitory.person;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepo {
    public void insertCustomer(Customer customer);

    public List<Customer> selectAllCustomer();

    public boolean deleteCustomer(int id);

    public boolean updateCustomer(Customer customer);
}
