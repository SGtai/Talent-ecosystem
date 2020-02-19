package com.cykj.net.service;

import com.cykj.net.javabean.Advert;
import com.cykj.net.javabean.JobInfoIndex;
import com.cykj.net.mapper.HomeDao;
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
}
