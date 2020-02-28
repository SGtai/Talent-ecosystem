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
}
