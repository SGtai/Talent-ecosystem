package com.cykj.net.controller;

import com.cykj.net.javabean.Admin;
import com.cykj.net.javabean.Adminrole;
import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.mapper.AdminDao;
import com.cykj.net.service.AdminroleService;
import com.cykj.net.service.CompanyService;
import com.cykj.net.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@Controller
@RequestMapping("/company")
public class CompanyController
{
	@Autowired
	private CompanyService companyService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminroleService adminroleService;
	@Autowired
	private AdminDao adminDao;
	/**
	 * 注册企业账号
	 * @param qyinfo
	 * @return
	 */
	@RequestMapping("/doReg")
	public @ResponseBody
	String doReg(Qyinfo qyinfo)
	{
		System.out.println("准备注册");
		String result = "";
		if(companyService.findById(qyinfo.getQyAccount())==null){
			//插入企业信息表
			qyinfo.setRegTime( new Timestamp(System.currentTimeMillis()));
			companyService.regQyAccount(qyinfo);
			//插入管理员表
			Admin admin=new Admin();
			admin.setAccount(qyinfo.getQyAccount());
			admin.setPassword(qyinfo.getPassword());
			admin.setRegistertime(qyinfo.getRegTime());
			admin.setName(qyinfo.getQyName());
			adminService.regAdmin(admin);
			//插入管理角色表
			Adminrole adminrole=new Adminrole();
			adminrole.setAccount(qyinfo.getQyAccount());
			adminrole.setRoid(3);
			adminroleService.regAdminRole(adminrole);


			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	/**
	 * 注册账户查重
	 * @param qyinfo
	 * @return
	 */
	@RequestMapping("/doAccount")
	public @ResponseBody
	String doAccount(Qyinfo qyinfo)
	{
		String result = "";
		if(companyService.findById(qyinfo.getQyAccount())==null){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	@RequestMapping("/regCompanyInfo")
	public @ResponseBody
	ModelAndView regCompanyInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/WEB-INF/company/regcompanyinfo");

		return mv;
}
	@RequestMapping("/doRegQyinfo")
	public @ResponseBody
	String doRegQyinfo(Qyinfo qyinfo)
	{
		String result = "";
		int a=companyService.doRegQyinfo(qyinfo);
		System.out.println(a);
		if(a>0){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	@RequestMapping("/doRegQyKind")
	public @ResponseBody
	String doRegQyKind(Qyinfo qyinfo)
	{
		String result = "";
		int a=companyService.doRegQyKind(qyinfo);
		System.out.println(a);
		if(a>0){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	/**
	 * 原始密码验证
	 * @param qyAccount
	 * @param password
	 * @return
	 */
	@RequestMapping("/verifyPwd")
	public @ResponseBody
	String verifyPwd(String qyAccount,String password)
	{
		String result = "";
		Qyinfo qyinfo=companyService.findById(qyAccount);

		if(qyinfo.getPassword().equals(password)){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	@RequestMapping("/changePassword")
	public @ResponseBody
	String changePassword(Qyinfo qyinfo)
	{
		String result = "";
		int a=companyService.changePassword(qyinfo);
		Admin admin=new Admin();
		admin.setAccount(qyinfo.getQyAccount());
		admin.setPassword(qyinfo.getPassword());
		int b=adminDao.changeAdminPassword(admin);
		if(a>0&&b>0){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}
}
