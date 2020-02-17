package com.cykj.net.javabean;


public class Menu {

  private long meid;
  private long firstmenuid;
  private long secondmenuid;
  private String menuname;
  private String menuurl;


  public long getMeid() {
    return meid;
  }

  public void setMeid(long meid) {
    this.meid = meid;
  }


  public long getFirstmenuid() {
    return firstmenuid;
  }

  public void setFirstmenuid(long firstmenuid) {
    this.firstmenuid = firstmenuid;
  }


  public long getSecondmenuid() {
    return secondmenuid;
  }

  public void setSecondmenuid(long secondmenuid) {
    this.secondmenuid = secondmenuid;
  }


  public String getMenuname() {
    return menuname;
  }

  public void setMenuname(String menuname) {
    this.menuname = menuname;
  }


  public String getMenuurl() {
    return menuurl;
  }

  public void setMenuurl(String menuurl) {
    this.menuurl = menuurl;
  }

}
