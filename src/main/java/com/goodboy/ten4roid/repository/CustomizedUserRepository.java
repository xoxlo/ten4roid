package com.goodboy.ten4roid.repository;

import com.goodboy.ten4roid.model.User;

import java.util.List;

public interface CustomizedUserRepository {
    List<User> findByUsernameCustom(String username);
    List<User> findByUsernameJdbc(String username);
}