package com.cykj.net.javabean;


public class Finance {

  private long cwId;
  private long kcId;
  private long yhId;
  private String kcName;
  private String yhName;
  private long jgPrice;
  private java.sql.Timestamp time;
  private String msDescribe;
  private String ddNumber;


  public long getCwId() {
    return cwId;
  }

  public void setCwId(long cwId) {
    this.cwId = cwId;
  }


  public long getKcId() {
    return kcId;
  }

  public void setKcId(long kcId) {
    this.kcId = kcId;
  }


  public long getYhId() {
    return yhId;
  }

  public void setYhId(long yhId) {
    this.yhId = yhId;
  }


  public String getKcName() {
    return kcName;
  }

  public void setKcName(String kcName) {
    this.kcName = kcName;
  }


  public String getYhName() {
    return yhName;
  }

  public void setYhName(String yhName) {
    this.yhName = yhName;
  }


  public long getJgPrice() {
    return jgPrice;
  }

  public void setJgPrice(long jgPrice) {
    this.jgPrice = jgPrice;
  }


  public java.sql.Timestamp getTime() {
    return time;
  }

  public void setTime(java.sql.Timestamp time) {
    this.time = time;
  }


  public String getMsDescribe() {
    return msDescribe;
  }

  public void setMsDescribe(String msDescribe) {
    this.msDescribe = msDescribe;
  }


  public String getDdNumber() {
    return ddNumber;
  }

  public void setDdNumber(String ddNumber) {
    this.ddNumber = ddNumber;
  }

}
