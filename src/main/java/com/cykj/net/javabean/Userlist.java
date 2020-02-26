package com.cykj.net.javabean;


import com.fasterxml.jackson.annotation.JsonFormat;

public class Userlist {

    private long yhid;
    private String account;
    private String password;
    private String name;
    private String phone;
    private String sex;
    private String degree;
    private String idCard;
    private String idCardType;
    private String birthday;
    private java.sql.Timestamp regTime;
    private String picture;
    private String by1;
    private String by2;
    private String tuijianren;
    private int state;

    public String getTuijianren() {
        return tuijianren;
    }

    public void setTuijianren(String tuijianren) {
        this.tuijianren = tuijianren;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public long getYhid() {
        return yhid;
    }

    public void setYhid(long yhid) {
        this.yhid = yhid;
    }


    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }


    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }


    public String getIdCardType() {
        return idCardType;
    }

    public void setIdCardType(String idCardType) {
        this.idCardType = idCardType;
    }


    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    public java.sql.Timestamp getRegTime() {
        return regTime;
    }

    public void setRegTime(java.sql.Timestamp regTime) {
        this.regTime = regTime;
    }


    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }


    public String getBy1() {
        return by1;
    }

    public void setBy1(String by1) {
        this.by1 = by1;
    }


    public String getBy2() {
        return by2;
    }

    public void setBy2(String by2) {
        this.by2 = by2;
    }

}
