package com.cykj.net.mapper;

import com.cykj.net.javabean.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CompanyDao
{
	//单条插入
	public int regQyAccount(Qyinfo qyinfo);

	//查询账号
	public Qyinfo findById(String account);

	//完善企业信息
	public int doRegQyinfo(Qyinfo qyinfo);

	//填写企业简介
	public int doRegQyKind(Qyinfo qyinfo);

	//修改密码
	public int changePassword(Qyinfo qyinfo);

	//查询省份
	public List<Province> findProvince();

	//查询城市
	public List<City> chooseCity(City city);

	//查询行业
	public List<Position> findPosition();

	//查询岗位
	public List<Station> chooseStation(Station station);

	//发布招聘信息
	public int releaseJobinfo(Jobinfo jobinfo);

	//修改招聘信息
	public int updateJobinfo(Jobinfo jobinfo);

	//招聘表查询
	public List<Jobinfo> searchJobinfoTable(Jobinfo jobinfo);

	//根据ZPXXID查询招聘表
	public Jobinfo searchJobinfo(Jobinfo jobinfo);

	//修改招聘信息发布状态
	public int updateJobinfoState(Jobinfo jobinfo);

	//删除招聘信息
	public int deleteJobinfo(Jobinfo jobinfo);

	//搜索简历表
	public List<Resume> searchResume(Resume resume);

	//搜索符合状态简历表
	public List<Resume> searchResumeCompany(Resume resume);

	//投递公司简历的邀请面试
	public int updateQuery(Query query);

	//搜索简历日志表
	public Query selectQuery(Query query);

	//插入日志表信息
	public int insertQuery(Query query);

	//搜索简历日志表
	public List<Resume> feedbackQuery(Resume resume);

	//应聘
	public int yingpin(Query query);
}