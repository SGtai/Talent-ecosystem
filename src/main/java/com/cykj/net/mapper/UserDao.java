package com.cykj.net.mapper;

import com.cykj.net.javabean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserDao
{

	public Userlist findPhone(String phone);
	public int reg(@Param("phone")String phone,@Param("password") String password);
	public int gerenInfo(Userlist userlist);
	public void addbasejl(Resume resume);
	public void addJobIntension(Jobintension jobintension);
	public void addexperience(Experience experience);
	public void addundergo(Undergo undergo);
	public int userInfojl(Resume resume);
	public int yixiang(Jobintension jobintension);
	public int jiaoyu(Experience experience);
	public int gongzuo(Undergo undergo);
	public int zhengshu(Resume resume);
	public int pingjia(Resume resume);
	public List<Jianli> yulanxml(@Param("jlid") int jlid);
	public List<Resume> jliList(@Param("yhId") int yhId);
	public int deletejl(@Param("jlid") int jlid);
	public int openjl(@Param("jlid") int jlid);
	public int closejl(@Param("jlid") int jlid);
	public int toudi(@Param("jlid") int jlid,@Param("qyId") int qyId,@Param("zpxxid") int zpxxid);
	public int toudijiancha(@Param("jlid") int jlid,@Param("qyId") int qyId,@Param("zpxxid") int zpxxid);
	public int shoucang(@Param("zpxxid") int zpxxid,@Param("hyid") int hyid);
	public int shoucangCount(@Param("zpxxid") int zpxxid,@Param("hyid") int hyid);
	public List<Shoucang> shoucanglist(@Param("hyid") int hyid);
	public List<Shoucang> shenqinglist(@Param("hyid") int hyid);
	public List<Shoucang> mianshi(@Param("hyid") int hyid);
	public List<Shoucang> yaoyue(@Param("hyid") int hyid);
	public int msresultOk(@Param("cxrzId") int cxrzId);
	public int msresultNo(@Param("cxrzId") int cxrzId);

}
