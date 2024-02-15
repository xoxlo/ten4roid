package com.goodboy.ten4roid.controller;

import com.goodboy.ten4roid.model.User;
import com.goodboy.ten4roid.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private UserService userService;
    @GetMapping("/login")
    public String login(){
        return "account/login";
    }
    @GetMapping("/register")
    public String register(){
        return "account/register";
    }
    @PostMapping("/register")
    public String register(User user) throws Exception {
//        userService.save(user);
        userService.save(user);
        return "redirect:/";
    }

    @Transactional
    void save(){

    }
}
