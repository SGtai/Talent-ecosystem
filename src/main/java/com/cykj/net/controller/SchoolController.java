package com.cykj.net.controller;

import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.service.SchoolService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/school")
public class SchoolController
{
	@Autowired
	private SchoolService schoolService;

	/**
	 *
	 * @param schoolinfo
	 * 该功能只记录reg1当中的账户密码到session
	 */
	@RequestMapping("/reg1")
	public String screg(Schoolinfo schoolinfo,HttpServletRequest request){
		System.out.println("学校注册启动。。。");
		Schoolinfo sc=schoolService.findSchoolinfo(schoolinfo.getScAccount());
		if(sc!=null){
			//该账户存在的情况下，不给注册
			System.out.println("不给注册");
			return "0";
		}else{
			//该账户不存在的情况下，下一步
			//将数据存在session里面方便后面信息填写
			System.out.println("给注册");
			request.getSession().setAttribute("reg1need",sc);
			return "1";
		}

	}

	//登陆业务
	public void sclogin(){
		System.out.println("学校登陆启动。。。");

	}





	//utf封装
	public void utf8(HttpServletRequest request, HttpServletResponse response){
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
	}


	//传值为String类型
	public void gsonString(String arr,HttpServletResponse response){
		Gson g=new Gson();
		try
		{
			response.getWriter().write(g.toJson(arr).toString());
			response.setContentType("text/html; charset =utf-8");
			response.getWriter().flush();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	//传值为bean类型
	public void gsonbean(Object object,HttpServletResponse response){
		Gson g=new Gson();
		try
		{
			response.getWriter().write(g.toJson(object));
			response.setContentType("text/html; charset =utf-8");
			response.getWriter().flush();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	//时间
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat s = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		String format = s.format(date);
		return format;
	}
	//	@ResponseBody
	public String getParameter(String arr, HttpServletRequest request){
		String l=request.getParameter(arr);
		return l;
	}
	//判断文档类型
	public String panduantype(String filename){
		String[] arr=filename.split("\\.");
		if(arr.length>0){
			System.out.println(arr[1]);
			return arr[1];
		}
		return "无类型";
	}
}
