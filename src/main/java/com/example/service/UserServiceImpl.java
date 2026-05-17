package com.example.service;

import com.example.dao.UserMapper;
import com.example.model.MyUser;
import com.example.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户业务实现类
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean checkUName(String username) {
        MyUser user = userMapper.selectByName(username);
        return user != null;
    }

    @Override
    public int register(MyUser user) {
        // 密码MD5加密
        user.setPassword(MD5Util.md5(user.getPassword()));
        return userMapper.register(user);
    }

    @Override
    public MyUser login(String username, String password) {
        MyUser user = userMapper.selectByName(username);
        if (user != null && user.getPassword().equals(MD5Util.md5(password))) {
            return user;
        }
        return null;
    }
}
