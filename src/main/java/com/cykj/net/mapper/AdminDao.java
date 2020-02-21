package com.cykj.net.mapper;


import com.cykj.net.javabean.admin.Admin;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 杨德禄 JX190714
 * @create 2020-02-17 20:09
 * @desc
 **/
@Mapper
public interface AdminDao
{
	//单条插入
	public int regAdmin(Admin admin);
	//修改密码
	public int changeAdminPassword(Admin admin);
}
