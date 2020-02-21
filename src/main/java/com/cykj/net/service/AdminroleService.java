package com.cykj.net.service;

import com.cykj.net.javabean.Adminrole;
import com.cykj.net.mapper.AdminRoleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 杨德禄 JX190714
 * @create 2020-02-17 21:51
 * @desc
 **/
@Service
public class AdminroleService
{
	@Resource
	private AdminRoleDao adminRoleDao;
	public int regAdminRole(Adminrole adminrole) {
		int sum=adminRoleDao.regAdminRole(adminrole);
		return sum;
	}
}
