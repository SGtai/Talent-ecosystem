package com.cykj.net.controller;

import com.cykj.net.javabean.Userlist;
import com.cykj.net.service.TechService;
import com.cykj.net.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/wx")
public class WxController
{
	@Autowired
	private UserService userService;
	@Autowired
	private TechService techService;

	@RequestMapping("/login")
	@ResponseBody
	public String login(String account, String password, HttpServletRequest request){
		System.out.println("account="+account+"password="+password);
		Userlist userlist = userService.findPhone(account);
		if (userlist == null){
			return "myfalse";
		}else{
			if (userlist.getState() == 1){
				return "fasleError";
			}else {
				if (userlist.getPassword().equals(password)){
					request.getSession().setAttribute("user",userlist);
					System.out.println("123");
					return "success";
				}else {
					return "fail"; } } }
	}

	@RequestMapping("/reg")
	@ResponseBody
	public String reg(String number, String pwd,String account){
		System.out.println("account="+number+"password="+pwd+"paws="+account);
		Userlist userlists = userService.findPhone(number);
		if (userlists == null){
			Userlist userlist = new Userlist();
			userlist.setName(account);
			userlist.setPassword(pwd);
			userlist.setPhone(number);
			userlist.setRegTime(new java.sql.Timestamp(System.currentTimeMillis()));
			int a = techService.wxreg(userlist);
			return "success";
		}else{
			return "fail";
		}

	}
}
