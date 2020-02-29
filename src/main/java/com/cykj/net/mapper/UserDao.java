package com.cykj.net.mapper;

import com.cykj.net.javabean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserDao
{

	public Userlist findPhone(String phone);
	public int reg(@Param("phone")String phone,@Param("password") String password);
	public int gerenInfo(Userlist userlist);
	public void addbasejl(Resume resume);
	public void addJobIntension(Jobintension jobintension);
	public void addexperience(Experience experience);
	public void addundergo(Undergo undergo);
	public int userInfojl(Resume resume);
	public int yixiang(Jobintension jobintension);
	public int jiaoyu(Experience experience);
	public int gongzuo(Undergo undergo);
	public int zhengshu(Resume resume);
	public int pingjia(Resume resume);
	public List<Jianli> yulanxml();

}
