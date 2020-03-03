package com.cykj.net.controller;

import com.cykj.net.javabean.*;
import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.javabean.Adminrole;
import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.AdminroleService;
import com.cykj.net.service.CompanyService;
import com.cykj.net.service.UserService;
import com.cykj.net.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

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
	private UserService userService;


	@RequestMapping("/companyLogin")
	public @ResponseBody
	ModelAndView companyLogin()
	{
		ModelAndView mv = new ModelAndView();
		List<Province> list = companyService.findProvince();
		mv.addObject("province2", list);
		mv.setViewName("/WEB-INF/company/companylogin");
		return mv;
	}

	/**
	 * 注册企业账号
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
		if (companyService.findById(qyinfo.getQyAccount()) == null)
		{
			//插入企业信息表
			qyinfo.setRegTime(new Timestamp(System.currentTimeMillis()));
			companyService.regQyAccount(qyinfo);
			//插入管理员表
			Admin admin = new Admin();
			admin.setAccount(qyinfo.getQyAccount());
			admin.setPassword(qyinfo.getPassword());
			admin.setRegistertime(qyinfo.getRegTime());
			admin.setName(qyinfo.getQyName());
			adminService.regAdmin(admin);
			//插入管理角色表
			Adminrole adminrole = new Adminrole();
			adminrole.setAccount(qyinfo.getQyAccount());
			adminrole.setRoid(6);
			adminroleService.regAdminRole(adminrole);


			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 * 注册账户查重
	 *
	 * @param qyinfo
	 * @return
	 */
	@RequestMapping("/doAccount")
	public @ResponseBody
	String doAccount(Qyinfo qyinfo)
	{
		String result = "";
		if (companyService.findById(qyinfo.getQyAccount()) == null)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	@RequestMapping("/regCompanyInfo")
	public @ResponseBody
	ModelAndView regCompanyInfo(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/WEB-INF/company/regcompanyinfo");

		return mv;
	}

	@RequestMapping("/doRegQyinfo")
	public @ResponseBody
	String doRegQyinfo(Qyinfo qyinfo)
	{
		String result = "";
		int a = companyService.doRegQyinfo(qyinfo);
		System.out.println(a);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	@RequestMapping("/doRegQyKind")
	public @ResponseBody
	String doRegQyKind(Qyinfo qyinfo)
	{
		String result = "";
		int a = companyService.doRegQyKind(qyinfo);
		System.out.println(a);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 * 原始密码验证
	 *
	 * @param qyAccount
	 * @param password
	 * @return
	 */
	@RequestMapping("/verifyPwd")
	public @ResponseBody
	String verifyPwd(String qyAccount, String password)
	{
		String result = "";
		Qyinfo qyinfo = companyService.findById(qyAccount);

		if (qyinfo.getPassword().equals(password))
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 * 修改密码
	 *
	 * @param qyinfo
	 * @return
	 */
	@RequestMapping("/changePassword")
	public @ResponseBody
	String changePassword(Qyinfo qyinfo)
	{
		String result = "";
		int a = companyService.changePassword(qyinfo);
		Admin admin = new Admin();
		admin.setAccount(qyinfo.getQyAccount());
		admin.setPassword(qyinfo.getPassword());
		int b = adminService.changeAdminPassword(admin);
		if (a > 0 && b > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 * 打开发布招聘 页面
	 *
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/jobinfo")
	public ModelAndView jobinfo(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		List<Province> list = companyService.findProvince();
		mv.addObject("province", list);
		mv.setViewName("/WEB-INF/company/jobinfo");
		return mv;
	}

	/**
	 * 根据省份选择城市
	 *
	 * @param city
	 * @return
	 */
	@RequestMapping("/chooseCity")
	public @ResponseBody
	List<City> chooseCity(City city)
	{
		List<City> list = companyService.chooseCity(city);
		System.out.println(list);
		return list;
	}

	/**
	 * 根据行业选择岗位
	 *
	 * @param station
	 * @return
	 */
	@RequestMapping("/chooseStation")
	public @ResponseBody
	List<Station> chooseStation(Station station)
	{
		List<Station> list = companyService.chooseStation(station);
		System.out.println(list);
		return list;
	}

	/**
	 * 发布招聘信息
	 *
	 * @param jobinfo
	 * @param session
	 * @return
	 */
	@RequestMapping("/releaseJobinfo")
	public @ResponseBody
	String releaseJobinfo(Jobinfo jobinfo, HttpSession session)
	{
		String result = "";
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		jobinfo.setQyid(qyinfo.getQyid());
		jobinfo.setTime(new Timestamp(System.currentTimeMillis()));
		int a = companyService.releaseJobinfo(jobinfo);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	@RequestMapping("/updateJobinfo")
	public @ResponseBody
	String updateJobinfo(Jobinfo jobinfo, HttpSession session)
	{
		String result = "";
		jobinfo.setTime(new Timestamp(System.currentTimeMillis()));
		int a = companyService.updateJobinfo(jobinfo);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 * 打开招聘信息管理页面
	 *
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/searchJobinfoTable")
	@ResponseBody
	public LayuiData searchJobinfoTable(String page, String limit, String jobinfoState, String zwid, String type, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Jobinfo jobinfo = new Jobinfo();
		jobinfo.setJobinfoState(jobinfoState);
		jobinfo.setZwid(zwid);
		jobinfo.setType(type);
		jobinfo.setQyid(qyinfo.getQyid());
		List<Jobinfo> list1 = companyService.searchJobinfoTable(jobinfo);
		System.out.println(list1);
		LayuiData layuiData = new LayuiData();
		layuiData.setCode(0);
		layuiData.setMsg("");
		int nowPage;
		List<Jobinfo> data = new ArrayList<>();
		if (list1.size() < Integer.valueOf(page) * Integer.valueOf(limit))
		{
			nowPage = list1.size();
		} else
		{
			nowPage = Integer.valueOf(page) * Integer.valueOf(limit);
		}

		for (int i = (Integer.valueOf(page) - 1) * Integer.valueOf(limit); i < nowPage; i++)
		{
			//计算完成进度
			int a=Integer.valueOf(list1.get(i).getZpNumEnd());
			int b=Integer.valueOf(list1.get(i).getZpNum());
			DecimalFormat df = new DecimalFormat("0.00");//格式化小数
			String num = df.format((float)a/b*100);//返回的是String类型
			list1.get(i).setSchedule(num+"%");
			data.add(list1.get(i));
		}

		layuiData.setCount(list1.size());
		System.out.println(list1.size());
		layuiData.setData(data);
		System.out.println(data);

		return layuiData;
	}

	/**
	 * 根据zpxxi的查询对应数据
	 *
	 * @param jobinfo
	 * @return
	 */
	@RequestMapping(value = "/searchJobinfo")
	public @ResponseBody
	List<Jobinfo> searchJobinfo(Jobinfo jobinfo, HttpSession session)
	{
		List<Jobinfo> jobinfo1 = companyService.searchJobinfoTable(jobinfo);
		System.out.println(jobinfo.getZpxxid());
		session.setAttribute("zpxxid",jobinfo.getZpxxid());
		return jobinfo1;
	}

	/**
	 * 修改招聘信息状态
	 * @param jobinfo
	 * @return
	 */
	@RequestMapping("/updateJobinfoState")
	public @ResponseBody
	String updateJobinfoState(Jobinfo jobinfo)
	{
		String result = "";
		int a = companyService.updateJobinfoState(jobinfo);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		System.out.println("返回值"+result);
		return result;
	}

	/**
	 * 删除招聘信息
	 * @param jobinfo
	 * @return
	 */
	@RequestMapping("/deleteJobinfo")
	public @ResponseBody
	String deleteJobinfo(Jobinfo jobinfo)
	{
		String result = "";
		int a = companyService.deleteJobinfo(jobinfo);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	/**
	 *
	 * @param
	 * @return
	 */
	@RequestMapping("/searchResume")
	public @ResponseBody
	LayuiData searchResume(String page, String limit, String postion, String type, HttpSession session)
	{
		Resume resume=new Resume();
		resume.setPostion(postion);
		resume.setType(type);
		List<Resume> list1 = companyService.searchResume(resume);
		System.out.println(list1);
		LayuiData layuiData = new LayuiData();
		layuiData.setCode(0);
		layuiData.setMsg("");
		int nowPage;
		List<Resume> data = new ArrayList<>();
		if (list1.size() < Integer.valueOf(page) * Integer.valueOf(limit))
		{
			nowPage = list1.size();
		} else
		{
			nowPage = Integer.valueOf(page) * Integer.valueOf(limit);
		}

		for (int i = (Integer.valueOf(page) - 1) * Integer.valueOf(limit); i < nowPage; i++)
		{
			data.add(list1.get(i));
		}

		layuiData.setCount(list1.size());
		layuiData.setData(data);

		return layuiData;

	}

	@RequestMapping("/yulan")
	public ModelAndView yulan(int jlid){
		ModelAndView mv = new ModelAndView();
		List<Jianli> yulan = userService.yulanxml(jlid);
		mv.addObject("yulan",yulan);
		mv.setViewName("WEB-INF/company/personal2");
		return mv;
	}


	/**
	 *
	 * @param
	 * @return
	 */
	@RequestMapping("/searchResumeCompany")
	public @ResponseBody
	LayuiData searchResumeCompany(String page, String limit, String postion, String type, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Resume resume=new Resume();
		resume.setQyId(qyinfo.getQyid());
		//字段状态
		resume.setPaid(10);
		resume.setPostion(postion);
		resume.setType(type);
		List<Resume> list1 = companyService.searchResumeCompany(resume);
		LayuiData layuiData = new LayuiData();
		layuiData.setCode(0);
		layuiData.setMsg("");
		int nowPage;
		List<Resume> data = new ArrayList<>();
		if (list1.size() < Integer.valueOf(page) * Integer.valueOf(limit))
		{
			nowPage = list1.size();
		} else
		{
			nowPage = Integer.valueOf(page) * Integer.valueOf(limit);
		}

		for (int i = (Integer.valueOf(page) - 1) * Integer.valueOf(limit); i < nowPage; i++)
		{
			data.add(list1.get(i));
		}

		layuiData.setCount(list1.size());
		layuiData.setData(data);

		return layuiData;

	}

	@RequestMapping("/updateQuery")
	public @ResponseBody
	String updateQuery(Query query,HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		query.setQyId(qyinfo.getQyid());
		query.setCkTime(new Timestamp(System.currentTimeMillis()));
		query.setPaid(12);
		String result = "";
		int a = companyService.updateQuery(query);
		if (a > 0)
		{
			result = "success";
		} else
		{
			result = "nosuccess";
		}
		return result;
	}

	@RequestMapping("/selectQuery")
	public @ResponseBody
	String selectQuery(Query query,HttpSession session)
	{
		String result = "";
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		query.setQyId(qyinfo.getQyid());
		Query query1 = companyService.selectQuery(query);
		if(query1!=null){
			result = "nosuccess";
		}else {
			query.setCkTime(new Timestamp(System.currentTimeMillis()));
			query.setPaid(12);
			int a=companyService.insertQuery(query);
					if (a > 0)
					{
						result = "success";
					} else
					{
						result = "nosuccess";
					}
		}
		return result;
	}


	/**
	 *
	 * @param
	 * @return
	 */
	@RequestMapping("/feedback")
	public @ResponseBody
	LayuiData feedback(String page, String limit,String paid,HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Resume resume=new Resume();
		resume.setQyId(qyinfo.getQyid());
		System.out.println(paid);
		if(paid!=null){
			resume.setPaid(Long.valueOf(paid));
		}
		List<Resume> list1 = companyService.feedbackQuery(resume);
		LayuiData layuiData = new LayuiData();
		layuiData.setCode(0);
		layuiData.setMsg("");
		int nowPage;
		List<Resume> data = new ArrayList<>();
		if (list1.size() < Integer.valueOf(page) * Integer.valueOf(limit))
		{
			nowPage = list1.size();
		} else
		{
			nowPage = Integer.valueOf(page) * Integer.valueOf(limit);
		}

		for (int i = (Integer.valueOf(page) - 1) * Integer.valueOf(limit); i < nowPage; i++)
		{
			if(list1.get(i).getPaid()==12){
				list1.get(i).setFeedback("等待回复");
			} else if (list1.get(i).getPaid()==13) {
				list1.get(i).setFeedback("接受面试");
			} else if(list1.get(i).getPaid()==14){
				list1.get(i).setFeedback("已应聘");
			}
			data.add(list1.get(i));
		}

		layuiData.setCount(list1.size());
		layuiData.setData(data);

		return layuiData;

	}

	@RequestMapping("/yingpin")
	public @ResponseBody
	String yingpin(Query query,HttpSession session)
	{
		String result = "";
		int a=companyService.yingpin(query);
		if (a > 0) {
			result = "success";
		} else {
			result = "nosuccess";
		}
		return result;
	}

}


