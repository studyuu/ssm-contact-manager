package com.example.contactmanager.service.impl;

import com.example.contactmanager.dao.UserDao;
import com.example.contactmanager.entity.User;
import com.example.contactmanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void registerUser(User user) {
        userDao.registerUser(user);
    }

    @Override
    public User loginUser(String username, String password) {
        return userDao.loginUser(username, password);
    }
}