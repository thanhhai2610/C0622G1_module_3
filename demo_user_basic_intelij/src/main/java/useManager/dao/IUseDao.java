package useManager.dao;

import useManager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUseDao {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectUserName(String name);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
