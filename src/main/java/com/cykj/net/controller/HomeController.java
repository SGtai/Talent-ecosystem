package com.cykj.net.controller;

import com.cykj.net.javabean.Advert;
import com.cykj.net.javabean.JobInfoIndex;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.HomeService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController
{

	@Autowired
	private HomeService homeService;
	//打开首页的时候，获取薪资最高的10个招聘信息
	@RequestMapping("/getTenHJob")
	@ResponseBody
	public String getTenHighCompany(HttpServletRequest request)
	{
		List<JobInfoIndex> jobInfolist = homeService.getTenHCom();
		List<JobInfoIndex> compAndJobList = homeService.compAndJob();
		List<Advert> advertList = homeService.advertTen();
		request.getSession().setAttribute("jobInfolist",jobInfolist);
		request.getSession().setAttribute("compAndJobList",compAndJobList);
		request.getSession().setAttribute("advertList",advertList);
		return "success";
	}

	@RequestMapping("/searchJob")
	@ResponseBody
	public LayuiData searchJob(int limit, int page)
	{
		LayuiData layuiData = new LayuiData();
		RowBounds rowBounds = new RowBounds(page - 1, limit);
		List<JobInfoIndex> list = homeService.searchJob(rowBounds);
		int num = homeService.searchJobCount();
		layuiData.setData(list);
		layuiData.setCount(num);
		return layuiData;
	}

}
