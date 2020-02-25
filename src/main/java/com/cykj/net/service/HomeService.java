package com.cykj.net.service;

import com.cykj.net.javabean.Advert;
import com.cykj.net.javabean.City;
import com.cykj.net.javabean.JobInfoIndex;
import com.cykj.net.javabean.Position;
import com.cykj.net.mapper.HomeDao;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HomeService
{
	@Resource
	private HomeDao homeDao;

	public List<JobInfoIndex> getTenHCom(){
		List<JobInfoIndex> list = homeDao.getTenHCom();
		return list;
	}

	public List<JobInfoIndex> compAndJob(){
		List<JobInfoIndex> list = homeDao.compAndJob();
		return list;
	}
	public List<Advert> advertTen(){
		List<Advert> list = homeDao.advertTen();
		return list;
	}

	public List<JobInfoIndex> searchJob(RowBounds rowBounds,JobInfoIndex tijiao){
		List<JobInfoIndex> list = homeDao.searchJob(rowBounds,tijiao);
		return list;
	}

	public int searchJobCount(JobInfoIndex tijiao){
		int num = homeDao.searchJobCount(tijiao);
		return num;
	}
	public int gangweiNew(){
		int num = homeDao.gangweiNew();
		return num;
	}
	public int gangweicount(){
		int num = homeDao.gangweicount();
		return num;
	}
	public int usercount(){
		int num = homeDao.usercount();
		return num;
	}
	public int qiuzhiSuccess(){
		int num = homeDao.qiuzhiSuccess();
		return num;
	}
	public int gaoxiaocount(){
		int num = homeDao.gaoxiaocount();
		return num;
	}
	//找所有的职位
	public List<Position> position(){
		List<Position> position = homeDao.position();
		return position;
	}
	//找所有的省/市
	public List<City> province(){
		List<City> position = homeDao.province();
		return position;
	}
	public List<City> city(int prid){
		List<City> city = homeDao.city(prid);
		return city;
	}
}
