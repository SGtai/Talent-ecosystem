package com.cykj.net.controller;

import com.cykj.net.javabean.*;
import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.javabean.Adminrole;
import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.admin.CensusUtil;
import com.cykj.net.service.AdminroleService;
import com.cykj.net.service.CompanyService;
import com.cykj.net.service.UserService;
import com.cykj.net.service.admin.AdminService;
import com.cykj.net.util.MD5;
import com.cykj.net.util.UtilTool;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
	String doReg(Qyinfo qyinfo) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{
		System.out.println("准备注册");
		String result = "";
		if (companyService.findById(qyinfo.getQyAccount()) == null)
		{
			String pwd=MD5.EncoderByMd5(qyinfo.getPassword());
			qyinfo.setPassword(pwd);
			//插入企业信息表
			companyService.regQyAccount(qyinfo);
			//插入管理员表
			Admin admin = new Admin();
			admin.setAccount(qyinfo.getQyAccount());
			admin.setPassword(pwd);
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
	String verifyPwd(String qyAccount, String password) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{
		String result = "";
		Qyinfo qyinfo = companyService.findById(qyAccount);

		if (qyinfo.getPassword().equals(MD5.EncoderByMd5(password)))
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
	String changePassword(Qyinfo qyinfo) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{
		String result = "";
		String pwd=MD5.EncoderByMd5(qyinfo.getPassword());
		qyinfo.setPassword(pwd);
		int a = companyService.changePassword(qyinfo);
		Admin admin = new Admin();
		admin.setAccount(qyinfo.getQyAccount());
		admin.setPassword(pwd);
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
			int a = Integer.valueOf(list1.get(i).getZpNumEnd());
			int b = Integer.valueOf(list1.get(i).getZpNum());
			DecimalFormat df = new DecimalFormat("0.00");//格式化小数
			String num = df.format((float) a / b * 100);//返回的是String类型
			list1.get(i).setSchedule(num + "%");
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
		session.setAttribute("zpxxid", jobinfo.getZpxxid());
		return jobinfo1;
	}

	/**
	 * 修改招聘信息状态
	 *
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
		System.out.println("返回值" + result);
		return result;
	}

	/**
	 * 删除招聘信息
	 *
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
	 * @param
	 * @return
	 */
	@RequestMapping("/searchResume")
	public @ResponseBody
	LayuiData searchResume(String page, String limit, String postion, String type, HttpSession session)
	{
		Resume resume = new Resume();
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
			if(list1.get(i).getGwid()==0){
				list1.get(i).setPostion("在校生");
				list1.get(i).setType("在校生");
			}
			data.add(list1.get(i));
		}

		layuiData.setCount(list1.size());
		layuiData.setData(data);

		return layuiData;

	}

	@RequestMapping("/yulan")
	public ModelAndView yulan(int jlid)
	{
		ModelAndView mv = new ModelAndView();
		List<Jianli> yulan = userService.yulanxml(jlid);
		mv.addObject("yulan", yulan);
		mv.setViewName("WEB-INF/company/personal2");
		return mv;
	}


	/**
	 * @param
	 * @return
	 */
	@RequestMapping("/searchResumeCompany")
	public @ResponseBody
	LayuiData searchResumeCompany(String page, String limit, String postion, String type, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Resume resume = new Resume();
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
	String updateQuery(Query query, HttpSession session)
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
	String selectQuery(Query query, HttpSession session)
	{
		String result = "";
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		query.setQyId(qyinfo.getQyid());
		List<Query> query1 = companyService.selectQuery(query);
		if (query1.size()>0)
		{
			result = "nosuccess";
		} else
		{
			query.setCkTime(new Timestamp(System.currentTimeMillis()));
			query.setPaid(12);
			int a = companyService.insertQuery(query);
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
	 * @param
	 * @return
	 */
	@RequestMapping("/feedback")
	public @ResponseBody
	LayuiData feedback(String page, String limit, String paid, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Resume resume = new Resume();
		resume.setQyId(qyinfo.getQyid());
		System.out.println(paid);
		if (paid != null)
		{
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
			if (list1.get(i).getPaid() == 12)
			{
				list1.get(i).setFeedback("等待回复");
			} else if (list1.get(i).getPaid() == 13)
			{
				list1.get(i).setFeedback("接受面试");
			} else if (list1.get(i).getPaid() == 14)
			{
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
	String yingpin(Query query, Jobinfo jobinfo, HttpSession session)
	{
		String result = "";

		//先完成应聘人数里面插入
		jobinfo.setZpxxid(query.getZpxxid());
		Jobinfo jobinfo1 = companyService.searchJobinfo(jobinfo);
		int zpNum = Integer.valueOf(jobinfo1.getZpNum());
		int zpNumEnd = Integer.valueOf(jobinfo1.getZpNumEnd());
		//完成插入后进行更改状态
		if (zpNum >= zpNumEnd + 1)
		{
			jobinfo1.setZpNumEnd(String.valueOf(zpNumEnd + 1));
			companyService.yingpinNum(jobinfo1);
			System.out.println(query.getCkTime());
			int a = companyService.yingpin(query);
			if (a > 0)
			{
				result = "success";
			} else
			{
				result = "nosuccess";
			}
		} else
		{
			result = "nosuccess";
		}
		;
		return result;
	}


	@RequestMapping("/photo")
	@ResponseBody
	public String photo(@RequestParam("file") MultipartFile file, HttpServletRequest request)
	{
		Qyinfo qyinfo = (Qyinfo) request.getSession().getAttribute("Qyinfo");
		int qyid = (int) qyinfo.getQyid();
		try
		{
			String filename = file.getOriginalFilename();
			String urldb = new Date().getTime() + filename;
			//user.dir:用户的当前工作目录
			//			String projectPath = System.getProperty("user.dir")+"\\target\\classes\\static\\images\\"+urldb;
			String projectPath1 =request.getSession().getServletContext().getRealPath("/uploadS/images/")+urldb;
			file.transferTo(new File(projectPath1));
			//			file.transferTo(new File(projectPath));
			int num = companyService.qyPicture(urldb, qyid);
			Qyinfo qyinfo1 = companyService.findById(qyinfo.getQyAccount());
			request.getSession().setAttribute("Qyinfo", qyinfo1);

		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return "1";
	}

	@RequestMapping("/weekJobinfo")
	@ResponseBody
	public String weekJobinfo(HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		;
		int qyid = (int) qyinfo.getQyid();
		ArrayList<CensusUtil> arrayList = new ArrayList<>();
		List<String> dateWeekList = UtilTool.week(new Date());
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
		int sum = 0;

		for (int i = 0; i < dateWeekList.size(); i++)
		{
			int count = companyService.weekJobinfo(dateWeekList.get(i), qyid);
			CensusUtil censusUtil = new CensusUtil();
			censusUtil.setCount(count);
			censusUtil.setName(weekDays[i]);
			arrayList.add(censusUtil);
			sum = count + sum;
		}

		Gson gson = new Gson();
		String jsonStr = gson.toJson(arrayList);
		String msg = jsonStr + "://" + sum;
		return msg;
	}

	@RequestMapping("/monthJobinfo")
	@ResponseBody
	public String monthJobinfo(String date, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		;
		int qyid = (int) qyinfo.getQyid();
		ArrayList<CensusUtil> arrayList = new ArrayList<>();
		List<String> dateHalfList = null;
		dateHalfList = UtilTool.month(date);

		int sum = 0;
		for (int i = 0; i < dateHalfList.size(); i++)
		{
			String[] time = dateHalfList.get(i).split(" ");
			int count = companyService.monthJobinfo(time[0], time[1] + " 23:59:59", qyid);
			CensusUtil censusUtil = new CensusUtil();
			censusUtil.setCount(count);
			censusUtil.setName("第" + (i + 1) + "周");
			arrayList.add(censusUtil);

			sum = count + sum;
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(arrayList);
		String msg = jsonStr + "://" + sum;
		return msg;
	}

	@RequestMapping("/halfJobinfo")
	@ResponseBody
	public String halfJobinfo(HttpSession session) throws ParseException
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		;
		int qyid = (int) qyinfo.getQyid();
		ArrayList<CensusUtil> arrayList = new ArrayList<>();
		List<String> dateHalfList = null;

		dateHalfList = UtilTool.half();

		int sum = 0;
		for (int i = 0; i < dateHalfList.size(); i++)
		{
			int count = companyService.weekJobinfo(dateHalfList.get(i), qyid);
			CensusUtil censusUtil = new CensusUtil();
			censusUtil.setCount(count);
			censusUtil.setName(dateHalfList.get(i));
			arrayList.add(censusUtil);

			sum = count + sum;
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(arrayList);

		String msg = jsonStr + "://" + sum;
		return msg;
	}

	/**
	 * @param
	 * @return
	 */
	@RequestMapping("/finishJob")
	public @ResponseBody
	LayuiData finishJob(String page, String limit, String zpxxid, HttpSession session)
	{
		Qyinfo qyinfo = (Qyinfo) session.getAttribute("Qyinfo");
		Resume resume = new Resume();
		resume.setQyId(qyinfo.getQyid());
		System.out.println("zp1" + zpxxid);
		resume.setZpxxid(Integer.valueOf(zpxxid));
		List<Resume> list1 = companyService.finishJob(resume);
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


	@RequestMapping("/yulanJobinfo")
	public @ResponseBody
	ModelAndView yulanJobinfo(Jobinfo jobinfo,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		List<Jobinfo> jobinfo1 = companyService.searchJobinfoTable(jobinfo);
		mv.addObject("yulan",jobinfo1);
		mv.setViewName("/WEB-INF/company/job-yulan");
		return mv;
	}
}



