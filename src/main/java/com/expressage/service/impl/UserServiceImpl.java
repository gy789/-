package com.expressage.service.impl;

import com.expressage.entity.Users;
import com.expressage.mapper.UserMapper;
import com.expressage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public Users ulogin(String username,String password){
        return userMapper.ulogin(username,password);
    }

    public int uregister(Users user){
        return userMapper.uregister(user);
    }

    @Override
    public List<Users> getAllUsers() {
        return userMapper.getAllUsers();
    }

    @Override
    public int deleteUsers(int uid) {
        return userMapper.deleteUsers(uid);
    }

    @Override
    public Users getUsers(int uid) {
        return userMapper.getUsers(uid);
    }

    @Override
    public int updateUser(Users users) {
        return userMapper.updateUser(users);
    }

    @Override
    public int addUser(Users users) {
        return userMapper.addUser(users);
    }
}
