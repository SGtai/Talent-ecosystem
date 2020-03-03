package com.cykj.net.service;

import com.cykj.net.javabean.*;
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
	public S1 findSchoolinfo(String scAccount)
	{
		S1 schoolinfo=schoolDao.findSchoolinfo(scAccount);
		return schoolinfo;
	}
	public S1 findphone(String phone)
	{
		S1 schoolinfo=schoolDao.findSchoolinfo(phone);
		return schoolinfo;
	}
	public S1 finddaima(String daima)
	{
		S1 schoolinfo=schoolDao.findSchoolinfo(daima);
		return schoolinfo;
	}
	public int inserSchoolinfo(S1 schoolinfo)
	{
		int insertsum=schoolDao.inserSchoolinfo(schoolinfo);
		return insertsum;
	}

	public int updateSchoolinfo(S1 schoolinfo)
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

	public List<Experience> findexperience(String account){
		List<Experience> experiences=schoolDao.findexperience(account);
		return experiences;
	}

	public List<Undergo> findegzjl(String account){
		List<Undergo> undergos=schoolDao.findegzjl(account);
		return undergos;
	}

	public int inseruserinfo(Userlist userlist){
		int Userlistnum=schoolDao.inseruserinfo(userlist);
		return Userlistnum;
	}

	public int fenyecount2(String position,String type){
		int fenyecount2=schoolDao.fenyecount2(position,type);
		return fenyecount2;
	}


	public List<J1> fenyeshuju2(String position,String type, RowBounds rowBounds){
		List<J1> fenyeshuju2=schoolDao.fenyeshuju2(position, type, rowBounds);
		return fenyeshuju2;
	}
}
