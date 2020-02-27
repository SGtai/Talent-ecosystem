package com.cykj.net.service;

import com.cykj.net.javabean.Userlist;
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
}
