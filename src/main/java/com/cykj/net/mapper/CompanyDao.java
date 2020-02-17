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

}
