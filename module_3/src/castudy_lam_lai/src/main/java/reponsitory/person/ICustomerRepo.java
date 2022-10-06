package reponsitory.person;

import model.person.Customer;
import model.person.Employee;

import java.util.List;

public interface ICustomerRepo {
    public void insertCustomer(Customer customer);

    public List<Customer> selectAllCustomer();

    public List<Customer> selectCustomerName(String name);

    public boolean deleteCustomer(int id);

    public boolean updateCustomer(Customer customer);

}
