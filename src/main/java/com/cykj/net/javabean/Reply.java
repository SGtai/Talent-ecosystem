package com.cykj.net.javabean;


public class Reply {

  private long hfId;
  private long pjId;
  private long dfId;
  private String dxName;
  private String nrContent;
  private String dfName;
  private String dfPicture;
  private java.sql.Timestamp dfTime;


  public long getHfId() {
    return hfId;
  }

  public void setHfId(long hfId) {
    this.hfId = hfId;
  }


  public long getPjId() {
    return pjId;
  }

  public void setPjId(long pjId) {
    this.pjId = pjId;
  }


  public long getDfId() {
    return dfId;
  }

  public void setDfId(long dfId) {
    this.dfId = dfId;
  }


  public String getDxName() {
    return dxName;
  }

  public void setDxName(String dxName) {
    this.dxName = dxName;
  }


  public String getNrContent() {
    return nrContent;
  }

  public void setNrContent(String nrContent) {
    this.nrContent = nrContent;
  }


  public String getDfName() {
    return dfName;
  }

  public void setDfName(String dfName) {
    this.dfName = dfName;
  }


  public String getDfPicture() {
    return dfPicture;
  }

  public void setDfPicture(String dfPicture) {
    this.dfPicture = dfPicture;
  }


  public java.sql.Timestamp getDfTime() {
    return dfTime;
  }

  public void setDfTime(java.sql.Timestamp dfTime) {
    this.dfTime = dfTime;
  }

}
