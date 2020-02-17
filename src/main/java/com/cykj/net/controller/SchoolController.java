package com.cykj.net.controller;

import com.cykj.net.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/school")
public class SchoolController
{
	@Autowired
	private SchoolService schoolService;
	//注册业务

	public void screg(){
		System.out.println("学校注册启动。。。");

	}

	//登陆业务
	public void sclogin(){
		System.out.println("学校登陆启动。。。");

	}
	//修改密码业务
}
