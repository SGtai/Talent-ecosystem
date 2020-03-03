package com.cykj.net.javabean;

import lombok.Data;

//页面简历表
import java.util.List;

@Data
public class Jianli
{
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
	private String minzu;
	private String csTime;
	private String yhname;
	private String jlname;
	private String xl;
	private String byschool;
	private String zy;
	private List<Jobintension> jobintension;
	private List<Experience> experienceList;
	private List<Undergo> undergoList;
}
