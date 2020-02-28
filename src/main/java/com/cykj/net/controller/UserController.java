package com.cykj.net.controller;

import com.cykj.net.javabean.Userlist;
import com.cykj.net.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public String login(String phone, String password, HttpServletRequest request){

		Userlist userlist = userService.findPhone(phone);
		if (userlist == null){
			return "noAccount";
		}else{
			if (userlist.getState() == 1){
				return "prohibit";
			}else {
				if (userlist.getPassword().equals(password)){
					request.getSession().setAttribute("user",userlist);
					return "true";
				}else {
					return "false"; } } }
	}

	@RequestMapping("/reg")
	@ResponseBody
	public String reg(String phoneReg,String passwordReg){

		int num = userService.reg(phoneReg,passwordReg);
		if (num > 0){
			return "true";
		}else {
			return "false";
		}
	}

//	退出注销
	@RequestMapping("/tuichu")
	@ResponseBody
	public String tuichu(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "success";
	}

//	简历--个人信息
	@RequestMapping("/gerenInfo")
	@ResponseBody
	public String gerenInfo(Userlist userlist,HttpServletRequest request){
		Userlist user = (Userlist) request.getSession().getAttribute("user");
		userlist.setPhone(user.getPhone());
		int num = userService.gerenInfo(userlist);
		if (num > 0){
			return "success";
		}else {
			return "false";
		}

	}


}
