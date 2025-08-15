package com.example.contactmanager.service;

import com.example.contactmanager.entity.User;

public interface UserService {
    void registerUser(User user);
    User loginUser(String username, String password);
}