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

	public int updateJobinfo(Jobinfo jobinfo) {
		int sum=companyDao.updateJobinfo(jobinfo);
		return sum;
	}

	public int releaseJobinfo(Jobinfo jobinfo) {
		int sum=companyDao.releaseJobinfo(jobinfo);
		return sum;
	}

	public List<Jobinfo> searchJobinfoTable(Jobinfo jobinfo){
		List<Jobinfo> list=companyDao.searchJobinfoTable(jobinfo);
		return list;
	}

	public Jobinfo searchJobinfo(Jobinfo jobinfo){
		Jobinfo jobinfo1=companyDao.searchJobinfo(jobinfo);
		return jobinfo1;
	}

	public int updateJobinfoState(Jobinfo jobinfo){
		int sum=companyDao.updateJobinfoState(jobinfo);
		return sum;
	}

	public int deleteJobinfo(Jobinfo jobinfo){
		int sum=companyDao.deleteJobinfo(jobinfo);
		return sum;
	}

	public List<Resume> searchResume(Resume resume){
		List<Resume> resume1=companyDao.searchResume(resume);
		return resume1;
	}

	public List<Resume> searchResumeCompany(Resume resume){
		List<Resume> resume1=companyDao.searchResumeCompany(resume);
		return resume1;
	}

	public int updateQuery(Query query){
		int sum=companyDao.updateQuery(query);
		return sum;
	}

	public Query selectQuery(Query query){
		Query query1=companyDao.selectQuery(query);
		return query1;
	}

	public int insertQuery(Query query){
		int sum=companyDao.insertQuery(query);
		return sum;
	}

	public List<Resume> feedbackQuery(Resume resume){
		List<Resume> resume1=companyDao.feedbackQuery(resume);
		return resume1;
	}

	public int yingpin(Query query){
		int sum=companyDao.yingpin(query);
		return sum;
	}

	public int yingpinNum(Jobinfo jobinfo){
		int sum=companyDao.yingpinNum(jobinfo);
		return sum;
	}

}

