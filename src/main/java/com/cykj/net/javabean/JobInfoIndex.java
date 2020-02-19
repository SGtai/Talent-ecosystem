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
	private String postion;
	private int salaryLow;
	private int salaryHigh;
	private List<JobInfoIndex> list;
}
