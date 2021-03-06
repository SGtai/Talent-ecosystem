package com.cykj.net.javabean;

import lombok.Data;

@Data
public class Jobintension {

  private long jzyxid;
  private long yhid;
  private long id;
  private long gwid;
  private long jlid;
  private String workPlace;
  private String intentionWork;
  private String monthlyPay;
  private String workstate;
  private String other;
  private String by1;
  private String by2;
  private String type;
  private String postion;
  private long poid;

  public long getJzyxid()
  {
    return jzyxid;
  }

  public void setJzyxid(long jzyxid)
  {
    this.jzyxid = jzyxid;
  }

  public long getYhid()
  {
    return yhid;
  }

  public void setYhid(long yhid)
  {
    this.yhid = yhid;
  }

  public long getId()
  {
    return id;
  }

  public void setId(long id)
  {
    this.id = id;
  }

  public long getGwid()
  {
    return gwid;
  }

  public void setGwid(long gwid)
  {
    this.gwid = gwid;
  }

  public long getJlid()
  {
    return jlid;
  }

  public void setJlid(long jlid)
  {
    this.jlid = jlid;
  }

  public String getWorkPlace()
  {
    return workPlace;
  }

  public void setWorkPlace(String workPlace)
  {
    this.workPlace = workPlace;
  }

  public String getIntentionWork()
  {
    return intentionWork;
  }

  public void setIntentionWork(String intentionWork)
  {
    this.intentionWork = intentionWork;
  }

  public String getMonthlyPay()
  {
    return monthlyPay;
  }

  public void setMonthlyPay(String monthlyPay)
  {
    this.monthlyPay = monthlyPay;
  }

  public String getWorkstate()
  {
    return workstate;
  }

  public void setWorkstate(String workstate)
  {
    this.workstate = workstate;
  }

  public String getOther()
  {
    return other;
  }

  public void setOther(String other)
  {
    this.other = other;
  }

  public String getBy1()
  {
    return by1;
  }

  public void setBy1(String by1)
  {
    this.by1 = by1;
  }

  public String getBy2()
  {
    return by2;
  }

  public void setBy2(String by2)
  {
    this.by2 = by2;
  }

  public String getType()
  {
    return type;
  }

  public void setType(String type)
  {
    this.type = type;
  }

  public String getPostion()
  {
    return postion;
  }

  public void setPostion(String postion)
  {
    this.postion = postion;
  }

  public long getPoid()
  {
    return poid;
  }

  public void setPoid(long poid)
  {
    this.poid = poid;
  }
}
