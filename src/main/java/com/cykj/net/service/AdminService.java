package com.cykj.net.service;

import com.cykj.net.javabean.Admin;
import com.cykj.net.mapper.AdminDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 杨德禄 JX190714
 * @create 2020-02-17 20:15
 * @desc
 **/
@Service
public class AdminService
{
	@Resource
	private AdminDao adminDao;
	public int regAdmin(Admin admin) {
		int sum=adminDao.regAdmin(admin);
		return sum;
	}
}
