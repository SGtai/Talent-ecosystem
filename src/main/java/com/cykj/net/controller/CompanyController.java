package com.cykj.net.controller;

import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/company")
public class CompanyController
{
	@Autowired
	private CompanyService companyService;

	/**
	 *
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
			qyinfo.setRegTime( new Timestamp(System.currentTimeMillis()));
			companyService.regQyAccount(qyinfo);
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	/**
	 *
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

}
