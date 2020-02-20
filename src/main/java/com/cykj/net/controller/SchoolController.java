package com.cykj.net.controller;

import com.cykj.net.javabean.Admin;
import com.cykj.net.javabean.Adminrole;
import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.service.AdminroleService;
import com.cykj.net.service.SchoolService;
import com.cykj.net.service.admin.AdminService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/school")
public class SchoolController
{
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminroleService adminroleService;

	/**
	 * 该功能只记录reg1当中的账户密码到session
	 * @param schoolinfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/reg1")
	@ResponseBody
	public String screg1(Schoolinfo schoolinfo, HttpServletRequest request){
		System.out.println("学校注册１启动。。。");
		Schoolinfo sc=schoolService.findSchoolinfo(schoolinfo.getScAccount());
		if(sc!=null){
			//该账户存在的情况下，不给注册
			System.out.println("不给注册");
			return "0";
		}else{
			//该账户不存在的情况下，下一步
			//将数据存在session里面方便后面信息填写
			System.out.println("给注册");
			request.getSession().setAttribute("reg1need",schoolinfo);
		}
			return "1";
	}

	/**
	 * 该功能真正实现注册，并插入管理员的表以及高校的表
	 * @param schoolinfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/reg2")
	@ResponseBody
	public String screg2(Schoolinfo schoolinfo, HttpServletRequest request,@RequestParam("file") MultipartFile file){
		System.out.println("学校注册２启动。。。");
		String filename = file.getOriginalFilename();
		System.out.println("filename="+filename);
		//session里面取值
		Schoolinfo sess= (Schoolinfo) request.getSession().getAttribute("reg1need");
		//注入账户密码
		schoolinfo.setScAccount(sess.getScAccount());
		schoolinfo.setPassword(sess.getPassword());
		//查找这个账户存在不，是否被其他管理员在这个期间注册了
		Schoolinfo scnamecheck=schoolService.findSchoolinfo(schoolinfo.getScAccount());
		//查找手机号是否唯一
		Schoolinfo scphonecheck=schoolService.findphone(schoolinfo.getScAccount());
		//查找信用代码是否唯一
		Schoolinfo scdaimachenk=schoolService.finddaima(schoolinfo.getScAccount());
		if(scnamecheck!=null){
			//被其他管理员注册了，注册失败
			return "0";
		}else if(scphonecheck!=null){
			//手机不唯一
			return "-1";
		}else if(scdaimachenk!=null){
			//社会信用代码不唯一
			return "-2";
		} else{
			//可以注册
			//插入注册时间
			schoolinfo.setRegTime(new Timestamp(System.currentTimeMillis()));
			//插入图片路径
			schoolinfo.setScpicture("路径我也不知道多少??");
			schoolinfo.setScState("启用");

			Admin a=new Admin();
			a=adminService.findAdmin(schoolinfo.getScAccount());
			if(a!=null){
				return "0";
			}else{
				//插入管理员表
				Admin admin=new Admin();
				admin.setAccount(schoolinfo.getScAccount());
				admin.setPassword(schoolinfo.getPassword());
				admin.setRegistertime(schoolinfo.getRegTime());
				admin.setName(schoolinfo.getScName());
				adminService.regAdmin(admin);
				//插入管理角色表
				Adminrole adminrole=new Adminrole();
				adminrole.setAccount(schoolinfo.getScAccount());
				adminrole.setRoid(4);
				adminroleService.regAdminRole(adminrole);
				int i=schoolService.inserSchoolinfo(schoolinfo);
				if(i>0){
					System.out.println("学校表插入成功");
				}

			}


		}
		return "1";
	}

	/**
	 *
	 * @param account
	 * @param password
	 * @param newpassword
	 * @param request
	 * @param response
	 */
	@RequestMapping("/pwd")
	public void changepwd(String account,String password,String newpassword,HttpServletRequest request, HttpServletResponse response){
		utf8(request,response);
		Schoolinfo sc=new Schoolinfo();
		if(schoolService.findSchoolinfo(getParameter("account",request))!=null){
			if(schoolService.findSchoolinfo(getParameter("account",request)).getPassword().equals(getParameter("password",request))){
				sc.setScAccount(getParameter("account",request));
				sc.setPassword(getParameter("newpassword",request));
				int i=schoolService.updateSchoolinfo(sc);
				if(i>0){
					gsonString("1",response);
				}
			}else{
				gsonString("0",response);
			}
		}else{
			gsonString("0",response);
		}
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
