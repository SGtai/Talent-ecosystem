package com.cykj.net.service;

import com.cykj.net.javabean.Alluserinfo;
import com.cykj.net.javabean.C1;
import com.cykj.net.javabean.P1;
import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.mapper.SchoolDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
	public Schoolinfo findphone(String phone)
	{
		Schoolinfo schoolinfo=schoolDao.findSchoolinfo(phone);
		return schoolinfo;
	}
	public Schoolinfo finddaima(String daima)
	{
		Schoolinfo schoolinfo=schoolDao.findSchoolinfo(daima);
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

	public int fenyecount1(String account,String username,String zy,String lasttime,String nowtime){
		int fenyecount1=schoolDao.fenyecount1(account,username,zy,lasttime,nowtime);
		return fenyecount1;
	}

	public List<Alluserinfo> fenyeshuju1(String account,String username,String zy,String lasttime,String nowtime, RowBounds rowBounds){
		List<Alluserinfo> fenyeshuju1=schoolDao.fenyeshuju1(account, username, zy, lasttime, nowtime, rowBounds);
		return fenyeshuju1;
	}

	public List<P1> findpro(){
		List<P1> p=schoolDao.findpro();
		return p;
	}

	public List<C1> findcity(String prid){
		List<C1> c=schoolDao.findcity(prid);
		return c;
	}

}
