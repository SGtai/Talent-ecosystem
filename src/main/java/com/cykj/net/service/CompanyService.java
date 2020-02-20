package com.cykj.net.service;

import com.cykj.net.javabean.*;
import com.cykj.net.mapper.CompanyDao;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

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

	public int doRegQyKind(Qyinfo qyinfo){
		int sum=companyDao.doRegQyKind(qyinfo);
		return sum;
	}

	public int changePassword(Qyinfo qyinfo){
		int sum=companyDao.changePassword(qyinfo);
		return sum;
	}

	public List<Province> findProvince(){
		List<Province> list=companyDao.findProvince();
		return list;
	}

	public List<City> chooseCity(City city){
		List<City> list=companyDao.chooseCity(city);
		return list;
	}

	public List<Position> findPosition(){
		List<Position> list=companyDao.findPosition();
		return list;
	}

	public List<Station> chooseStation(Station station){
		List<Station> list=companyDao.chooseStation(station);
		return list;
	}

	public int releaseJobinfo(Jobinfo jobinfo) {
		int sum=companyDao.releaseJobinfo(jobinfo);
		return sum;
	}

}