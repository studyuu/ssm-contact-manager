package com.example.contactmanager.controller;

import com.example.contactmanager.entity.User;
import com.example.contactmanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 显示注册页面
     */
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    /**
     * 处理用户注册
     */
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        try {
            userService.registerUser(user);
            model.addAttribute("message", "注册成功，请登录！");
            return "login";
        } catch (Exception e) {
            model.addAttribute("error", "注册失败: " + e.getMessage());
            model.addAttribute("user", user); // 保留已输入的表单数据
            return "register";
        }
    }

    /**
     * 显示登录页面
     */
    @GetMapping("/login")
    public String showLoginForm(@RequestParam(value = "logout", required = false) String logout, Model model) {
        if (logout != null) {
            model.addAttribute("message", "您已成功退出登录");
        }
        return "login";
    }

    /**
     * 处理用户登录
     */
    @PostMapping("/login")
    public String loginUser(@RequestParam String username, 
                          @RequestParam String password, 
                          Model model, 
                          HttpSession session) {
        User user = userService.loginUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/contacts/list";
        } else {
            model.addAttribute("error", "用户名或密码错误，请重试！");
            return "login";
        }
    }

    /**
     * 处理用户退出
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login?logout";
    }
}