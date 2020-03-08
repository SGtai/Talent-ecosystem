package com.cykj.net.javabean;

import com.fasterxml.jackson.annotation.JsonFormat;
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
  @JsonFormat(timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  private java.sql.Timestamp regTime;
  private String picture;
  private String by1;
  private String by2;
  private int state;
  private String tuijianren;

}
