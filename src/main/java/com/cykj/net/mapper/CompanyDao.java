package com.cykj.net.mapper;

import com.cykj.net.javabean.Qyinfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyDao
{
	//单条插入
	public int regQyAccount(Qyinfo qyinfo);
	//查询账号
	public Qyinfo findById(String account);
	//完善企业信息
	public int doRegQyinfo(Qyinfo qyinfo);
	//填写企业简介
	public int doRegQyKind(Qyinfo qyinfo);
	//修改密码
	public int changePassword(Qyinfo qyinfo);
}
