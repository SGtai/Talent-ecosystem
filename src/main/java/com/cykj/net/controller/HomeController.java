package com.cykj.net.controller;

import com.cykj.net.javabean.Advert;
import com.cykj.net.javabean.JobInfoIndex;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.HomeService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/homeS")
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
		int gangweiNew = homeService.gangweiNew();
		int gangweicount =homeService.gangweicount();
		int usercount =homeService.usercount();
		int qiuzhiSuccess = homeService.qiuzhiSuccess();
		request.getSession().setAttribute("jobInfolist",jobInfolist);
		request.getSession().setAttribute("compAndJobList",compAndJobList);
		request.getSession().setAttribute("advertList",advertList);
		request.getSession().setAttribute("gangweiNew",gangweiNew);
		request.getSession().setAttribute("gangweicount",gangweicount);
		request.getSession().setAttribute("usercount",usercount);
		request.getSession().setAttribute("qiuzhiSuccess",qiuzhiSuccess);
		return "success";
	}

	@RequestMapping("/searchJob")
	@ResponseBody
	public LayuiData searchJob(JobInfoIndex tijiao)
	{
		LayuiData layuiData = new LayuiData();
		RowBounds rowBounds = new RowBounds(tijiao.getPage()-1, tijiao.getLimit());
		List<JobInfoIndex> list = homeService.searchJob(rowBounds,tijiao);
		int num = homeService.searchJobCount(tijiao);
		layuiData.setData(list);
		layuiData.setCount(num);
		return layuiData;
	}

	@RequestMapping("/jumpsearch")
	public ModelAndView jumpsearch(String searchText){
		ModelAndView mv = new ModelAndView();
		mv.addObject("text",searchText);
		mv.setViewName("/WEB-INF/home/searchJob");
		return mv;
	}

}
