package com.cykj.net.javabean;

import lombok.Data;

import java.util.List;

//用于存放用户前台显示的职位信息
@Data
public class JobInfoIndex
{
	private int qyid;
	private String qyName;
	private String qyPicture;
	private int zpxxid;
	private String postion;  //招聘职位
	private int salaryLow;
	private int salaryHigh;
	private List<JobInfoIndex> list;

	private String gzAddress;
	private int replyRate;
	private String salary;
	private int time;


}
