package com.cykj.net.service;

import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.mapper.SchoolDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SchoolService
{
	@Resource
	private SchoolDao schoolDao;
	public Schoolinfo findSchoolinfo(String scAccount)
	{
		Schoolinfo schoolinfo=schoolDao.findSchoolinfo(scAccount);
		return schoolinfo;
	}
	public int inserSchoolinfo(Schoolinfo schoolinfo)
	{
		int insertsum=schoolDao.inserSchoolinfo(schoolinfo);
		return insertsum;
	}

	public int updateSchoolinfo(Schoolinfo schoolinfo)
	{
		int updatesum=schoolDao.updateSchoolinfo(schoolinfo);
		return updatesum;
	}
}
