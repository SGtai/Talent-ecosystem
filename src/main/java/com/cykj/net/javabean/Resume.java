package com.cykj.net.javabean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class Resume {

  private long jlId;
  private long yhId;
  private String zsCertificate;
  private String zpPhoto;


  private java.sql.Timestamp scTime;
  private String ycHide;
  private String gjNationality;
  private String yxMailbox;
  private String sjPhone;
  private String pjEvaluation;
  private String xbSex;
  private String jzdResidence;
  private String mmFace;
  private String scPath;
  private String ztStatus;
  private String minzu;
  private String demo2;
  private String csTime;
  private String jzstate;
  private String byschool;
  private String zy;
  private String xl;
  private String yhname;
  private String jlname;
  //拼接jobintension
  private long jzyxid;
//  private long yhid;
  private long id;
  private long gwid;
//  private long jlid;
  private String workPlace;
  private String intentionWork;
  private String monthlyPay;
  private String workstate;
  private String other;
  private String by1;
  private String by2;
  private String type;
  private String postion;
  //加入Query表字段
  private long cxrzId;
  private long qyId;
  private java.sql.Timestamp ckTime;
  private long zpxxid;
  private long paid;
  private String feedback;//反馈状态

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  public Timestamp getScTime()
  {
    return scTime;
  }

  public void setScTime(Timestamp scTime)
  {
    this.scTime = scTime;
  }

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  public Timestamp getCkTime()
  {
    return ckTime;
  }

  public void setCkTime(Timestamp ckTime)
  {
    this.ckTime = ckTime;
  }
}
