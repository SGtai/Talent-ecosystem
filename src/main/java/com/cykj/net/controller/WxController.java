package com.cykj.net.controller;

import com.cykj.net.javabean.Userlist;
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

	@RequestMapping("/login")
	@ResponseBody
	public String login(String phone, String password, HttpServletRequest request){
		System.out.println("phone="+phone+"password="+password);
		Userlist userlist = userService.findPhone(phone);
		if (userlist == null){
			return "noAccount";
		}else{
			if (userlist.getState() == 1){
				return "prohibit";
			}else {
				if (userlist.getPassword().equals(password)){
					request.getSession().setAttribute("user",userlist);
					return "success";
				}else {
					return "fail"; } } }
	}
}
