package com.cykj.net.controller;

import com.cykj.net.javabean.*;
import com.cykj.net.service.HomeService;
import com.google.gson.Gson;
import com.sun.org.apache.xalan.internal.xsltc.dom.SAXImpl;
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
	//打开首页的时候，页面初始化
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
		int gaoxiaocount = homeService.gaoxiaocount();
		request.getSession().setAttribute("jobInfolist",jobInfolist);
		request.getSession().setAttribute("compAndJobList",compAndJobList);
		request.getSession().setAttribute("advertList",advertList);
		request.getSession().setAttribute("gangweiNew",gangweiNew);
		request.getSession().setAttribute("gangweicount",gangweicount);
		request.getSession().setAttribute("usercount",usercount);
		request.getSession().setAttribute("qiuzhiSuccess",qiuzhiSuccess);
		request.getSession().setAttribute("gaoxiaocount",gaoxiaocount);
		return "success";
	}

//	多条件搜索职位
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

//前端页跳职位搜索页面
	@RequestMapping("/jumpsearch")
	public ModelAndView jumpsearch(String searchText,int type,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		List<Position> p = homeService.position();
		List<City> province = homeService.province();
		mv.addObject("type",type);
		mv.addObject("pList",p);
		mv.addObject("province",province);
		mv.addObject("text",searchText);
		mv.setViewName("/WEB-INF/home/searchJob");
		return mv;
	}

//	点击省出现市
	@RequestMapping("/getcity")
	@ResponseBody
	public String getcity(int prid){
		List<City> cityList = homeService.city(prid);
		String s = new Gson().toJson(cityList);
		return s;
	}



}
