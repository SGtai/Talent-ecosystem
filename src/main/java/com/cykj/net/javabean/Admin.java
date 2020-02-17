package com.cykj.net.javabean;


public class Admin {

    private long adid;
    private String account;
    private String password;
    private java.sql.Timestamp registertime;
    private String code;
    private String name;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public long getAdid() {
        return adid;
    }

    public void setAdid(long adid) {
        this.adid = adid;
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


    public java.sql.Timestamp getRegistertime() {
        return registertime;
    }

    public void setRegistertime(java.sql.Timestamp registertime) {
        this.registertime = registertime;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
