package com.cykj.net.javabean;


public class Tjjl {

  private long tjjlid;
  private long zpxxid;
  private long yhid;
  private String tuijianren;
  private java.sql.Timestamp datetime;

  public String getTuijianren()
  {
    return tuijianren;
  }

  public void setTuijianren(String tuijianren)
  {
    this.tuijianren = tuijianren;
  }

  public long getTjjlid() {
    return tjjlid;
  }

  public void setTjjlid(long tjjlid) {
    this.tjjlid = tjjlid;
  }


  public long getZpxxid() {
    return zpxxid;
  }

  public void setZpxxid(long zpxxid) {
    this.zpxxid = zpxxid;
  }


  public long getYhid() {
    return yhid;
  }

  public void setYhid(long yhid) {
    this.yhid = yhid;
  }


  public java.sql.Timestamp getDatetime() {
    return datetime;
  }

  public void setDatetime(java.sql.Timestamp datetime) {
    this.datetime = datetime;
  }

}
