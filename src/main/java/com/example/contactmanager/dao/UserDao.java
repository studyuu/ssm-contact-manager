package com.example.contactmanager.dao;

import com.example.contactmanager.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
    void registerUser(User user);
    User loginUser(String username, String password);
}