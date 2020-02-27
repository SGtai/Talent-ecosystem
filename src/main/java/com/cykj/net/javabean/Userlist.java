package com.cykj.net.javabean;

import lombok.Data;

@Data
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
  private int state;
  private String tuijianren;

}
