package com.example.controller;

import com.example.model.MyUser;
import com.example.service.UserService;
import com.example.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录/注册控制器
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    /**
     * 跳转到注册页面
     */
    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    /**
     * 检查用户名是否可用（AJAX）
     */
    @RequestMapping("/checkUName")
    @ResponseBody
    public String checkUName(String username) {
        boolean exists = userService.checkUName(username);
        if (exists) {
            return "false";  // 用户名已存在
        } else {
            return "true";   // 用户名可用
        }
    }

    /**
     * 用户注册
     */
    @RequestMapping("/register")
    public String register(MyUser user, HttpServletRequest request) {
        // 检查用户名是否已存在
        if (userService.checkUName(user.getUsername())) {
            request.setAttribute("msg", "用户名已存在！");
            return "register";
        }

        // 注册用户
        user.setAddTime(new Date());
        int result = userService.register(user);
        if (result > 0) {
            request.setAttribute("msg", "注册成功，请登录！");
            return "login";
        } else {
            request.setAttribute("msg", "注册失败，请稍后重试！");
            return "register";
        }
    }

    /**
     * 用户登录
     */
    @RequestMapping("/login")
    public String login(String username, String password, String code,
                        HttpServletRequest request, HttpSession session) {
        // 获取Session中的验证码
        String realCode = (String) session.getAttribute("code");

        // 验证验证码
        if (realCode == null || !realCode.equalsIgnoreCase(code)) {
            request.setAttribute("msg", "验证码错误！");
            return "login";
        }

        // 验证用户名和密码
        MyUser user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/cardList";
        } else {
            request.setAttribute("msg", "用户名或密码错误！");
            return "login";
        }
    }

    /**
     * 用户注销
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/toLogin";
    }
}
