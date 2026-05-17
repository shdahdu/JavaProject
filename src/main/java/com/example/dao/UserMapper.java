package com.example.dao;

import com.example.model.MyUser;

/**
 * 用户数据访问接口
 */
public interface UserMapper {

    /**
     * 根据用户名查询用户
     */
    MyUser selectByName(String username);

    /**
     * 注册用户
     */
    int register(MyUser user);
}
