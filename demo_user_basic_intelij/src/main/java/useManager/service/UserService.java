package useManager.service;

import useManager.dao.IUseDao;
import useManager.dao.UserDao;
import useManager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUseService {
    private IUseDao useDao = new UserDao();

    @Override
    public void insertUser(User user) throws SQLException {
        useDao.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return useDao.selectUser(id);
    }

    public List<User> selectUserName(String name) {
        return useDao.selectUserName("%" + name + "%");
    }

    @Override
    public List<User> selectAllUsers() {
        return useDao.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return useDao.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return useDao.updateUser(user);
    }
}
