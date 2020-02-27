package com.cykj.net.javabean;


import com.fasterxml.jackson.annotation.JsonFormat;

public class Qyinfo {

  private int id;
  private long qyid;
  private String qyAccount;
  private String password;
  private String qyData;
  private String qyName;
  private String qyAddress;
  private String qyfdMan;
  private String qyType;
  private String jyScope;
  private String jyTime;
  private String qyKind;
  private String regMoney;
  private String vipLevel;
  private String yingyepicture;
  private String xinyongDu;
  private String qyPicture;
  private java.sql.Timestamp regTime;
  private long replyRate;
  private String ctid;
  private String qyPeople;
  private long qyState;
  private String prid;
  private long state;

  public long getState() {
    return state;
  }

  public void setState(long state) {
    this.state = state;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public long getQyid() {
    return qyid;
  }

  public void setQyid(long qyid) {
    this.qyid = qyid;
  }


  public String getQyAccount() {
    return qyAccount;
  }

  public void setQyAccount(String qyAccount) {
    this.qyAccount = qyAccount;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getQyData() {
    return qyData;
  }

  public void setQyData(String qyData) {
    this.qyData = qyData;
  }


  public String getQyName() {
    return qyName;
  }

  public void setQyName(String qyName) {
    this.qyName = qyName;
  }


  public String getQyAddress() {
    return qyAddress;
  }

  public void setQyAddress(String qyAddress) {
    this.qyAddress = qyAddress;
  }


  public String getQyfdMan() {
    return qyfdMan;
  }

  public void setQyfdMan(String qyfdMan) {
    this.qyfdMan = qyfdMan;
  }


  public String getQyType() {
    return qyType;
  }

  public void setQyType(String qyType) {
    this.qyType = qyType;
  }


  public String getJyScope() {
    return jyScope;
  }

  public void setJyScope(String jyScope) {
    this.jyScope = jyScope;
  }


  public String getJyTime() {
    return jyTime;
  }

  public void setJyTime(String jyTime) {
    this.jyTime = jyTime;
  }


  public String getQyKind() {
    return qyKind;
  }

  public void setQyKind(String qyKind) {
    this.qyKind = qyKind;
  }


  public String getRegMoney() {
    return regMoney;
  }

  public void setRegMoney(String regMoney) {
    this.regMoney = regMoney;
  }


  public String getVipLevel() {
    return vipLevel;
  }

  public void setVipLevel(String vipLevel) {
    this.vipLevel = vipLevel;
  }


  public String getYingyepicture() {
    return yingyepicture;
  }

  public void setYingyepicture(String yingyepicture) {
    this.yingyepicture = yingyepicture;
  }


  public String getXinyongDu() {
    return xinyongDu;
  }

  public void setXinyongDu(String xinyongDu) {
    this.xinyongDu = xinyongDu;
  }


  public String getQyPicture() {
    return qyPicture;
  }

  public void setQyPicture(String qyPicture) {
    this.qyPicture = qyPicture;
  }

  @JsonFormat(timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  public java.sql.Timestamp getRegTime() {
    return regTime;
  }

  public void setRegTime(java.sql.Timestamp regTime) {
    this.regTime = regTime;
  }


  public long getReplyRate() {
    return replyRate;
  }

  public void setReplyRate(long replyRate) {
    this.replyRate = replyRate;
  }


  public String getCtid() {
    return ctid;
  }

  public void setCtid(String ctid) {
    this.ctid = ctid;
  }


  public String getQyPeople() {
    return qyPeople;
  }

  public void setQyPeople(String qyPeople) {
    this.qyPeople = qyPeople;
  }


  public long getQyState() {
    return qyState;
  }

  public void setQyState(long qyState) {
    this.qyState = qyState;
  }


  public String getPrid() {
    return prid;
  }

  public void setPrid(String prid) {
    this.prid = prid;
  }

}
