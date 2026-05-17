package com.example.model;

import java.util.Date;

/**
 * 名片实体类
 */
public class Card {
    private Integer id;            // 主键ID
    private String name;           // 姓名
    private String company;        // 公司
    private String position;       // 职位
    private String phone;          // 电话
    private String email;          // 邮箱
    private String address;        // 地址
    private String logo;           // Logo图片路径
    private String type;           // 名片类型（客户/供应商/朋友/同事等）
    private Integer userId;        // 所属用户ID
    private Date addTime;          // 添加时间

    // 分页辅助属性
    private Integer startIndex;    // 起始索引
    private Integer pageSize = 5;  // 每页条数

    public Card() {
    }

    public Card(Integer id, String name, String company, String position,
                String phone, String email, String address, String logo,
                String type, Integer userId, Date addTime) {
        this.id = id;
        this.name = name;
        this.company = company;
        this.position = position;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.logo = logo;
        this.type = type;
        this.userId = userId;
        this.addTime = addTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", company='" + company + '\'' +
                ", position='" + position + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", logo='" + logo + '\'' +
                ", type='" + type + '\'' +
                ", userId=" + userId +
                ", addTime=" + addTime +
                '}';
    }
}
