package com.cykj.net.service;

import com.cykj.net.javabean.*;
import com.cykj.net.mapper.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
	public List<Jianli> yulanxml(int jlid){
		List<Jianli> jianli = userDao.yulanxml(jlid);
		return jianli;
	}
	public List<Resume> jliList(int yhId){
		List<Resume> list = userDao.jliList(yhId);
		return list;
	}
	public int deletejl(int jlid){
		int num = userDao.deletejl(jlid);
		return num;
	}
	public int openjl(int jlid){
		int num = userDao.openjl(jlid);
		return num;
	}
	public int closejl(int jlid){
		int num = userDao.closejl(jlid);
		return num;
	}
	public int toudi(int jlid,int qyId, int zpxxid){
		int num = userDao.toudi(jlid,qyId,zpxxid);
		return num;
	}
	public int toudijiancha(int jlid,int qyId, int zpxxid){
		int num = userDao.toudijiancha(jlid,qyId,zpxxid);
		return num;
	}
	public int shoucang(int zpxxid,int hyid){
		int num = userDao.shoucang(zpxxid,hyid);
		return num;
	}
	public int shoucangCount(int zpxxid,int hyid){
		int num = userDao.shoucangCount(zpxxid,hyid);
		return num;
	}
	public List<Shoucang> shoucanglist(int hyid){
		List<Shoucang> shoucanglist = userDao.shoucanglist(hyid);
		return shoucanglist;
	}

	public List<Shoucang> shenqinglist(int hyid){
		List<Shoucang> shoucanglist = userDao.shenqinglist(hyid);
		return shoucanglist;
	}
	public List<Shoucang> mianshi(@Param("hyid") int hyid){
		List<Shoucang> shoucanglist = userDao.mianshi(hyid);
		return shoucanglist;
	}
	public List<Shoucang> yaoyue(@Param("hyid") int hyid){
		List<Shoucang> shoucanglist = userDao.yaoyue(hyid);
		return shoucanglist;
	}
	public int msresultOk(int cxrzId){
		int num = userDao.msresultOk(cxrzId);
		return num;
	}
	public int msresultNo(int cxrzId){
		int num = userDao.msresultNo(cxrzId);
		return num;
	}
	public int password(String password,int yhid){
		int num = userDao.password(password,yhid);
		return num;
	}
}
