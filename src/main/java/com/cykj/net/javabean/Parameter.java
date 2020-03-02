package com.cykj.net.javabean;

public class Parameter {

  private long paid;
  private String name;
  private String type;
  private long value;
  private int id;
  private String upName;
  private String upType;

  public String getUpName() {
    return upName;
  }

  public void setUpName(String upName) {
    this.upName = upName;
  }

  public String getUpType() {
    return upType;
  }

  public void setUpType(String upType) {
    this.upType = upType;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public long getPaid() {
    return paid;
  }

  public void setPaid(long paid) {
    this.paid = paid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public long getValue() {
    return value;
  }

  public void setValue(long value) {
    this.value = value;
  }

}
