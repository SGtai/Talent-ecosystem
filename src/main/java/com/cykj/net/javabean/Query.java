package com.cykj.net.javabean;


import com.fasterxml.jackson.annotation.JsonFormat;

public class Query {

  private long cxrzId;
  private long jlId;
  private long qyId;
  private java.sql.Timestamp ckTime;
  private long zpxxid;
  private long paid;


  public long getCxrzId() {
    return cxrzId;
  }

  public void setCxrzId(long cxrzId) {
    this.cxrzId = cxrzId;
  }


  public long getJlId() {
    return jlId;
  }

  public void setJlId(long jlId) {
    this.jlId = jlId;
  }


  public long getQyId() {
    return qyId;
  }

  public void setQyId(long qyId) {
    this.qyId = qyId;
  }


  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  public java.sql.Timestamp getCkTime() {
    return ckTime;
  }

  public void setCkTime(java.sql.Timestamp ckTime) {
    this.ckTime = ckTime;
  }


  public long getZpxxid() {
    return zpxxid;
  }

  public void setZpxxid(long zpxxid) {
    this.zpxxid = zpxxid;
  }


  public long getPaid() {
    return paid;
  }

  public void setPaid(long paid) {
    this.paid = paid;
  }

}
