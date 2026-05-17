package com.example.model;

import java.util.Date;

/**
 * 用户实体类
 */
public class MyUser {
    private Integer id;            // 主键ID
    private String username;       // 用户名
    private String password;       // 密码
    private Date addTime;          // 注册时间

    public MyUser() {
    }

    public MyUser(Integer id, String username, String password, Date addTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.addTime = addTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "MyUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", addTime=" + addTime +
                '}';
    }
}
