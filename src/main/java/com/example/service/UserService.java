package com.example.service;

import com.example.model.MyUser;

/**
 * 用户业务接口
 */
public interface UserService {

    /**
     * 检查用户名是否已存在
     * @return true=已存在, false=可用
     */
    boolean checkUName(String username);

    /**
     * 用户注册
     */
    int register(MyUser user);

    /**
     * 用户登录
     * @return 登录成功返回用户对象，失败返回null
     */
    MyUser login(String username, String password);
}
