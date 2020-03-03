package com.cykj.net.controller;

import com.cykj.net.javabean.*;
import com.cykj.net.service.CompanyService;
import com.cykj.net.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;

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

//	跳转简历列表界面
	@RequestMapping("/gopersonaljl")
	public ModelAndView gopersonaljl(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Userlist userlist = (Userlist) request.getSession().getAttribute("user");
		List<Resume> list = userService.jliList((int) userlist.getYhid());
		mv.addObject("jllist",list);
		mv.setViewName("/WEB-INF/user/personal_jl");
		return mv;
	}
	//	用户投递简历的时候，获取简历列表
	@RequestMapping("/getjllist")
	@ResponseBody
	public List<Resume> getjllist(HttpServletRequest request){
		Userlist userlist = (Userlist) request.getSession().getAttribute("user");
		List<Resume> list = userService.jliList((int) userlist.getYhid());
		return list;
	}


//   修改简历页面，将数据库原有的数据返回出来
	@RequestMapping("/gojlseeforupdate")
	public ModelAndView gojlseeforupdate(int jlid){
		List<Jianli> jianlis = userService.yulanxml(jlid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("upatelist",jianlis);
		mv.setViewName("/WEB-INF/user/personal_jlsee");
		return mv;
	}

	//简历页面点击新建简历，重新获取用户的基础信息，并往数据库写上一行简历表，拿到该序号，然后返回到页面上
	@RequestMapping("/gojl")
	public ModelAndView gojl(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Userlist userlist = (Userlist) request.getSession().getAttribute("user");
		//更新session域的user值
		Userlist user = userService.findPhone(userlist.getPhone());
		request.getSession().setAttribute("user",user);
//		往简历表/学校表/意向表/工作经历表里面插一条简历数据，并拿到id，后面的简历数据才能插入
		Resume resume = new Resume();
		resume.setYhId(user.getYhid());
		resume.setSjPhone(user.getPhone());
		userService.addbasejl(resume);
		int jlid = (int) resume.getJlId();
		Experience experience = new Experience();
		experience.setJlId(jlid);
		Jobintension jobintension =new Jobintension();
		jobintension.setJlid(jlid);
		jobintension.setYhid((int) user.getYhid());
		Undergo undergo = new Undergo();
		undergo.setJlId(jlid);
		//将值都放入实体类后，通过mybatis获取到插入后的自增长的主键id
		userService.addexperience(experience);
		userService.addJobIntension(jobintension);
		userService.addundergo(undergo);
		//将这些id，传回页面，后面页面进行信息提交时，凭此id获取对应数据进行修改
		mv.addObject("jyid",experience.getJyId());
		mv.addObject("gzjlId",undergo.getGzjlId());
		mv.addObject("jzyxid",jobintension.getJzyxid());
		mv.addObject("jlId",jlid);
		mv.addObject("userinfo",user);
		mv.setViewName("/WEB-INF/user/personal_jlsee");
		return mv;
	}
//	完善个人信息
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

//	简历——个人基础信息
	@RequestMapping("/userInfojl")
	@ResponseBody
	public String gerenInfo(Resume resume){

		int num = userService.userInfojl(resume);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}

//	求职意向表的更新
	@RequestMapping("/yixiang")
	@ResponseBody
	public String yixiang(Jobintension jobintension){

		int num = userService.yixiang(jobintension);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}

	//	求职教育表的更新
	@RequestMapping("/jiaoyu")
	@ResponseBody
	public String jiaoyu(Experience experience){

		int num = userService.jiaoyu(experience);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}
//求职工作经历
	@RequestMapping("/gongzuo")
	@ResponseBody
	public String gongzuo(Undergo undergo){

		int num = userService.gongzuo(undergo);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}
//证书
	@RequestMapping("/zhengshu")
	@ResponseBody
	public String zhengshu(Resume resume){

		int num = userService.zhengshu(resume);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}

//	个人介绍
	@RequestMapping("/pingjia")
	@ResponseBody
	public String pingjia(Resume resume){

		int num = userService.pingjia(resume);
		if (num > 0){
			return "true";
		}else{
			return "false";
		}
	}

//	新增教育经历
	@RequestMapping("/morejiaoyu")
	@ResponseBody
	public String morejiaoyu(int jlid){
		Experience experience = new Experience();
		experience.setJlId(jlid);
		//将值都放入实体类后，通过mybatis获取到插入后的自增长的主键id
		userService.addexperience(experience);
		return String.valueOf(experience.getJyId());
	}
//	新增工作经验
	@RequestMapping("/moregongzuo")
	@ResponseBody
	public String moregongzuo(int jlid){
		Undergo undergo = new Undergo();
		undergo.setJlId(jlid);
		//将值都放入实体类后，通过mybatis获取到插入后的自增长的主键id
		userService.addundergo(undergo);
		return String.valueOf(undergo.getGzjlId());
	}

//	跳转预览界面
//	新增工作经验
	@RequestMapping("/yulan")
	public ModelAndView yulan(int jlid){
		ModelAndView mv = new ModelAndView();
		List<Jianli> yulan = userService.yulanxml(jlid);
		mv.addObject("yulan",yulan);
		mv.setViewName("/WEB-INF/user/personal_jlyulan");
		return mv;
	}

	//	删除简历
	@RequestMapping("/deletejl")
	@ResponseBody
	public String deletejl(int jlid){
		int num = userService.deletejl(jlid);
		if (num > 0){
			return "true";
		}else {
			return "false";
		}
	}

	//	打开关闭简历
	@RequestMapping("/openjl")
	@ResponseBody
	public String openjl(int jlid){
		int num = userService.openjl(jlid);
		if (num > 0){
			return "true";
		}else {
			return "false";
		}
	}
	@RequestMapping("/closejl")
	@ResponseBody
	public String closejl(int jlid){
		int num = userService.closejl(jlid);
		if (num > 0){
			return "true";
		}else {
			return "false";
		}
	}

//	查看某家企业的招聘信息
	@RequestMapping("/jobinfo")
	public ModelAndView jobinfo(int id1,int id2){
		Jobinfo jobinfo = new Jobinfo();
		jobinfo.setQyid(id1);
		jobinfo.setZpxxid(id2);
		List<Jobinfo> jobinfo1 = companyService.searchJobinfoTable(jobinfo);
		System.out.println(jobinfo1.toString());
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobinfo",jobinfo1);
		mv.setViewName("WEB-INF/user/Jobinfo");
		return mv;
	}

//	投递简历，往简历日志表插入简历id，qyid和zpxxid以及状态
	@RequestMapping("/toudi")
	@ResponseBody
	public String toudi(int jlid,int qyid,int zpxxid){
		if (userService.toudijiancha(jlid,qyid,zpxxid) == 0){
			int num = userService.toudi(jlid,qyid,zpxxid);
			if (num > 0){
				return "true";
			}else {
				return "false";
			}
		}else {
			return "notoudi";
		}
	}

	//	投递简历，往简历日志表插入简历id，qyid和zpxxid以及状态
	@RequestMapping("/shoucang")
	@ResponseBody
	public String shoucang(int zpxxid,HttpServletRequest request){
		Userlist user = (Userlist) request.getSession().getAttribute("user");
		int yhid = (int) user.getYhid();
		int num = userService.shoucang(zpxxid,yhid);
		if (num > 0){
			return "true";
		}else {
			return "false";
		}
	}
}
