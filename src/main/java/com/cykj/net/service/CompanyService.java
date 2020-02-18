package com.cykj.net.service;

import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.mapper.CompanyDao;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * @author Lenovo
 */
@Service
public class CompanyService
{
	@Resource
	private CompanyDao companyDao;

	public int regQyAccount(Qyinfo qyinfo) {
	int sum=companyDao.regQyAccount(qyinfo);
	return sum;
	}

	public Qyinfo findById(String account)
	{
		Qyinfo id=companyDao.findById(account);
		return id;
	}

	public int doRegQyinfo(Qyinfo qyinfo){
		int sum=companyDao.doRegQyinfo(qyinfo);
		return sum;
	}

}