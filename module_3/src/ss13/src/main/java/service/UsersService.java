package service;

import model.User;
import reponsitory.BaseRepo;
import reponsitory.IUsersRepo;
import reponsitory.impl.UsersRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersService implements IUsersService {
   IUsersRepo usersRepo = new UsersRepo();

    @Override
    public void insertUser(User user) throws SQLException {
        usersRepo.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return usersRepo.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return usersRepo.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return usersRepo.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return usersRepo.updateUser(user);
    }
}
