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

}
