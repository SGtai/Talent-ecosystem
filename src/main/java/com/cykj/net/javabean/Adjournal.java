package com.cykj.net.javabean;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Adjournal {

  private long joid;
  private String account;
  private java.sql.Timestamp date;
  private String event;
  private String type;
  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getJoid() {
    return joid;
  }

  public void setJoid(long joid) {
    this.joid = joid;
  }


  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  @JsonFormat(timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  public java.sql.Timestamp getDate() {
    return date;
  }

  public void setDate(java.sql.Timestamp date) {
    this.date = date;
  }


  public String getEvent() {
    return event;
  }

  public void setEvent(String event) {
    this.event = event;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

}
