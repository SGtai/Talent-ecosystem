package com.cykj.net.mapper;

import com.cykj.net.javabean.Userlist;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao
{

	public Userlist findPhone(String phone);
	public int reg(@Param("phone")String phone,@Param("password") String password);
	public int gerenInfo(Userlist userlist);
}
