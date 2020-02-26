package com.cykj.net.javabean;


import com.fasterxml.jackson.annotation.JsonFormat;

public class Schoolinfo {

    private long scid;
    private String scAccount;
    private String password;
    private String scdata;
    private String scName;
    private String scAddress;
    private String scfdMan;
    private String moneyLaiyuan;
    private String kaibanMoney;
    private String jubanDanwei;
    private String xinyongDaima;
    private String scAbout;
    private String scpicture;
    private String scState;
    private String scPhone;
    private java.sql.Timestamp regTime;
    private String ctid;
    private String prid;
    private String type;
    private int id;
    private int state;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getCtid() {
        return ctid;
    }

    public String getPrid() {
        return prid;
    }

    public void setCtid(String ctid) {
        this.ctid = ctid;
    }

    public void setPrid(String prid) {
        this.prid = prid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getScid() {
        return scid;
    }

    public void setScid(long scid) {
        this.scid = scid;
    }


    public String getScAccount() {
        return scAccount;
    }

    public void setScAccount(String scAccount) {
        this.scAccount = scAccount;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getScdata() {
        return scdata;
    }

    public void setScdata(String scdata) {
        this.scdata = scdata;
    }


    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName;
    }


    public String getScAddress() {
        return scAddress;
    }

    public void setScAddress(String scAddress) {
        this.scAddress = scAddress;
    }


    public String getScfdMan() {
        return scfdMan;
    }

    public void setScfdMan(String scfdMan) {
        this.scfdMan = scfdMan;
    }


    public String getMoneyLaiyuan() {
        return moneyLaiyuan;
    }

    public void setMoneyLaiyuan(String moneyLaiyuan) {
        this.moneyLaiyuan = moneyLaiyuan;
    }


    public String getKaibanMoney() {
        return kaibanMoney;
    }

    public void setKaibanMoney(String kaibanMoney) {
        this.kaibanMoney = kaibanMoney;
    }


    public String getJubanDanwei() {
        return jubanDanwei;
    }

    public void setJubanDanwei(String jubanDanwei) {
        this.jubanDanwei = jubanDanwei;
    }


    public String getXinyongDaima() {
        return xinyongDaima;
    }

    public void setXinyongDaima(String xinyongDaima) {
        this.xinyongDaima = xinyongDaima;
    }


    public String getScAbout() {
        return scAbout;
    }

    public void setScAbout(String scAbout) {
        this.scAbout = scAbout;
    }


    public String getScpicture() {
        return scpicture;
    }

    public void setScpicture(String scpicture) {
        this.scpicture = scpicture;
    }


    public String getScState() {
        return scState;
    }

    public void setScState(String scState) {
        this.scState = scState;
    }


    public String getScPhone() {
        return scPhone;
    }

    public void setScPhone(String scPhone) {
        this.scPhone = scPhone;
    }

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    public java.sql.Timestamp getRegTime() {
        return regTime;
    }

    public void setRegTime(java.sql.Timestamp regTime) {
        this.regTime = regTime;
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
