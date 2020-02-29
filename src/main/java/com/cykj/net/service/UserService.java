package com.cykj.net.service;

import com.cykj.net.javabean.*;
import com.cykj.net.mapper.UserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService
{
	@Resource
	private UserDao userDao;

	public Userlist findPhone(String phone){
		Userlist userlist =userDao.findPhone(phone);
		return userlist;
	}

	public int reg(String phone,String password){
		int num = userDao.reg(phone,password);
		return num;
	}
	public int gerenInfo(Userlist userlist){
		int gerenInfo = userDao.gerenInfo(userlist);
		return gerenInfo;
	}
	public void addbasejl(Resume resume){
		userDao.addbasejl(resume);
	}
	public void addJobIntension(Jobintension jobintension){
		userDao.addJobIntension(jobintension);
	}
	public void addexperience(Experience experience){
		userDao.addexperience(experience);
	}
	public void addundergo(Undergo undergo){
		userDao.addundergo(undergo);
	}
	public int userInfojl(Resume resume){
		int num = userDao.userInfojl(resume);
		return num;
	}
	public int yixiang(Jobintension jobintension){
		int num = userDao.yixiang(jobintension);
		return num;
	}
	public int jiaoyu(Experience experience){
		int num = userDao.jiaoyu(experience);
		return num;
	}
	public int gongzuo(Undergo undergo){
		int num = userDao.gongzuo(undergo);
		return num;
	}
	public int zhengshu(Resume resume){
		int num = userDao.zhengshu(resume);
		return num;
	}
	public int pingjia(Resume resume){
		int num = userDao.pingjia(resume);
		return num;
	}
}
