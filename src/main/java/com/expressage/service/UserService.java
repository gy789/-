package com.expressage.service;

import com.expressage.entity.Users;

import java.util.List;

public interface UserService {
    Users ulogin(String username, String password);
    int uregister(Users users);
    List<Users> getAllUsers();//得到所有的用户
    int deleteUsers(int uid);//删除用户
    int updateUser(Users users);//修改密码
    Users getUsers(int uid);//得到用户详细信息
    int addUser(Users users);//添加用户
}
