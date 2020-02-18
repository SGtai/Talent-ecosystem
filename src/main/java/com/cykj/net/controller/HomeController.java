package com.cykj.net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController
{

	//打开首页的时候，获取薪资最高的10个招聘信息
	@RequestMapping("/getTenHCom")
	public void getTenHighCompany()
	{


	}
}
