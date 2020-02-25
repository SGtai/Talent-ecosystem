package com.cykj.net.javabean;

import lombok.Data;

import java.util.List;

//用于存放用户前台显示的职位信息
@Data
public class JobInfoIndex
{
	private Integer qyid;
	private String qyName;
	private String qyPicture;
	private Integer zpxxid;
	private String postion;  //招聘职位
	private Integer postiontype;  //招聘类型
	private Integer salaryLow;
	private Integer salaryHigh;
	private List<JobInfoIndex> list;

	private String gzAddress;
	private Integer prid;
	private Integer ctid;
	private Integer replyRate;
	private String salary;
	private Integer time;
	//学历
	private String eduction;
	//已工作时间
	private String workTime;
	//工作类型 全职/兼职
	private String workState;
	//企业人数
	private String qyPeople;
	//五险
	private String baoxian;
	//公积金
	private String gjijin;
	//奖金
	private String jiangjin;
	//双休日
	private String shuangxiu;
	//八小时工作制
	private String baxiaoshi;
	//住宿
	private String zhusu;
	private int limit;
	private int page;



}
