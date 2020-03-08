package com.cykj.net.controller;
import com.cykj.net.javabean.*;
import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.service.AdminroleService;
import com.cykj.net.service.SchoolService;
import com.cykj.net.service.admin.AdminService;
import com.cykj.net.util.MD5;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.cykj.net.javabean.S1.*;

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




	//注册－－－－－－－－－－－－－－－－－－－－－－－－
	/**
	 * 该功能只记录reg1当中的账户密码到session
	 * @param schoolinfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/reg1")
	@ResponseBody
	public String screg1(S1 schoolinfo, HttpServletRequest request){
		System.out.println("学校注册１启动。。。");
		S1 sc=schoolService.findSchoolinfo(schoolinfo.getScAccount());
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
	 * 获取省份跳转页面
	 * @return
	 */
	@RequestMapping("/returnreg2")
	@ResponseBody
	public ModelAndView returnreg2(){
		System.out.println("获取省份");
		ModelAndView mv=new ModelAndView();
		List<P1> p=schoolService.findpro();
		mv.setViewName("/WEB-INF/school/reg2");
		mv.addObject("province",p);
		return mv;
	}
	@RequestMapping("/findcity")
	@ResponseBody
	public List<C1> getcity(String province){
		System.out.println("获取城市");
		ModelAndView mv=new ModelAndView();
		List<C1> c=schoolService.findcity(province);
		return c;
	}
	/**
	 * 该功能真正实现注册，并插入管理员的表以及高校的表
	 * @param schoolinfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/reg2")
	@ResponseBody
	public String screg2(S1 schoolinfo, HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IOException, NoSuchAlgorithmException
	{
		System.out.println("学校注册２启动。。。");
		//session里面取值
		S1 sess= (S1) request.getSession().getAttribute("reg1need");
		//注入账户密码
		schoolinfo.setScAccount(sess.getScAccount());
		schoolinfo.setPassword(MD5.EncoderByMd5(sess.getPassword()));
		//查找这个账户存在不，是否被其他管理员在这个期间注册了
		S1 scnamecheck=schoolService.findSchoolinfo(schoolinfo.getScAccount());
		//查找手机号是否唯一
		S1 scphonecheck=schoolService.findphone(schoolinfo.getScPhone());
		//查找信用代码是否唯一
		S1 scdaimachenk=schoolService.finddaima(schoolinfo.getXinyongDaima());
		if(scnamecheck!=null){
			//被其他管理员注册了，注册失败
			return "0";
		}else if(scphonecheck!=null){
			//手机不唯一
			return "-1";
		}else if(scdaimachenk!=null){
			//社会信用代码不唯一
			return "-2";
		} else if(schoolinfo.getScAccount()==null||schoolinfo.getPassword()==null){
			return "erro";
		}
		else{
			//插入注册时间
			Date date = new Date();
			Timestamp nousedate = new Timestamp(date.getTime());
			schoolinfo.setRegTime(nousedate);
			//插入图片路径  图片
			String path=request.getServletContext().getRealPath("/cunchu");
			System.out.println("path="+path);
			//判断logo目录的是否存在
			File pathlogo=new File(path+"/"+"logo"); //图片
			System.out.println("pathlogo="+pathlogo);
			if(!pathlogo.exists()){
				pathlogo.mkdir();
			}
			//判断以这个账号为命名目录的是否存在
			File logoacc=new File(path+"/"+"logo"+"/"+schoolinfo.getScAccount()); //图片
			if(!logoacc.exists()){
				logoacc.mkdir();
			}
			System.out.println(path+"/"+"logo"+"/"+schoolinfo.getScAccount()); //图片
			String filename = file.getOriginalFilename();
			file.transferTo(new File(path+"/"+"logo"+"/"+schoolinfo.getScAccount()+"/"+ filename)); //插入成功
			schoolinfo.setScpicture("/cunchu/logo/"+schoolinfo.getScAccount()+"/"+ filename);
			schoolinfo.setScState("0");
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
				adminrole.setRoid(7);
				adminroleService.regAdminRole(adminrole);
				int i=schoolService.inserSchoolinfo(schoolinfo);
				if(i>0){
					System.out.println("学校表插入成功");
				}
			}
		}
		return "1";
	}
	//修改高校信息－－－－－－－－－－－－－－－－－－－－－－－－
	/**
	 * 跳转到修改信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/changeinfo")
	public ModelAndView changeinfo(HttpServletRequest request){
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		System.out.println(admin.getAccount());
		S1 scinfo=schoolService.findSchoolinfo(admin.getAccount());
		ModelAndView mv=new ModelAndView();
		List<P1> p=schoolService.findpro();
		List<C1> c=schoolService.findcity(String.valueOf(scinfo.getPrid()));
		mv.setViewName("/WEB-INF/school/changeinfo");
		mv.addObject("scinfo",scinfo);
		mv.addObject("province",p);
		mv.addObject("city",c);
		return mv;
	}
	/**
	 * 修改高校信息，有修改图片
	 * @param sc
	 * @param request
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/changeInfo1")
	@ResponseBody
	public String changeInfo1(S1 sc,HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IOException
	{

		Admin admin= (Admin) request.getSession().getAttribute("admin");
			sc.setScAccount(admin.getAccount());
			S1 ssc=schoolService.findSchoolinfo(admin.getAccount());
			//判断电话号码是否唯一
			int a=panduanphone(admin.getAccount(),sc.getScPhone());
			if(a==1){}else{return "-1";}
			//判断信用代码是否唯一
			int b=panduandaima(admin.getAccount(),sc.getXinyongDaima());
			if(b==1){}else{return "-2";}
			//插入图片路径
			String path=request.getServletContext().getRealPath("/cunchu");
			File logoacc=new File(path+"/"+"logo"+"/"+admin.getAccount());
			//删除这个用户文件夹下的所有文件
			File[] files = logoacc.listFiles();
			//遍历删除文件
			for(File f: files){
				f.delete();
			}
			String filename = file.getOriginalFilename();
			file.transferTo(new File(path+"/"+"logo"+"/"+admin.getAccount()+"/"+ filename));
			sc.setScpicture("/cunchu/"+"logo"+"/"+admin.getAccount()+"/"+ filename);
			System.out.println("/"+"logo"+"/"+admin.getAccount()+"/"+ filename);
			int i=schoolService.updateSchoolinfo(sc);
			if(i>0)
			{
				return "1";
			}
		return "0";
	}

	/**
	 * 修改高校信息，不修改图片
	 * @param sc
	 * @param request
	 * @return
	 */
	@RequestMapping("/changeInfo2")
	@ResponseBody
	public String changeInfo2(S1 sc,HttpServletRequest request)
	{
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		sc.setScAccount(admin.getAccount());
		//判断电话号码是否唯一
		int a=panduanphone(admin.getAccount(),sc.getScPhone());
		if(a==1){}else{return "-1";}
		//判断信用代码是否唯一
		int b=panduandaima(admin.getAccount(),sc.getXinyongDaima());
		if(b==1){}else{return "-2";}
		int i=schoolService.updateSchoolinfo(sc);
		if(i>0)
		{
			return "1";
		}
		return "0";
	}

	//修改密码－－－－－－－－－－－－－－－－－－－－－－－－

	/**
	 * 跳转到修改密码页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/changepassword")
	public ModelAndView changepassword(HttpServletRequest request){
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		S1 scinfo=schoolService.findSchoolinfo(admin.getAccount());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/WEB-INF/school/changepwd");
		mv.addObject("scinfo",scinfo);
		return mv;
	}
	/**
	 *修改密码
	 * @param request
	 */
	@RequestMapping("/pwd")
	@ResponseBody
	public String changepwd(S1 sc,String newpass,HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{

		Admin admin= (Admin) request.getSession().getAttribute("admin");
		if(admin!=null){
			if(schoolService.findSchoolinfo(admin.getAccount()).getPassword().equals(MD5.EncoderByMd5(sc.getPassword()))){
				System.out.println("密码一致");
				sc.setScAccount(admin.getAccount());
				sc.setPassword(MD5.EncoderByMd5(newpass));
				int i=schoolService.updateSchoolinfo(sc);
				admin.setPassword(MD5.EncoderByMd5(newpass));
				int k=adminService.changeAdminPassword(admin);
				if(i>0&&k>0){
					return "1";
				}
			}
		}else{
			return "erro";
		}
		return "0";
	}


	//人才信息

	/**
	 * 跳转到人才信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/rencaiinfo")
	public ModelAndView rencaiinfo(HttpServletRequest request){
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		S1 scinfo=schoolService.findSchoolinfo(admin.getAccount());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/WEB-INF/school/rencaiinfo");
		mv.addObject("scinfo",scinfo);
		return mv;
	}

	/**
	 * 分页查询人才信息
	 *
	 */
	@RequestMapping("/rencaiinfoquery")
	public void rencaiquery(HttpServletRequest request,HttpServletResponse response,String time,String name,String zy,String page,String limit)throws Exception{
		utf8(request,response);
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		String lasttime="";
		String nowtime="";
		if(time!=null&&time!=""&&!time.equals("to")){
			String arr[]=time.split("to");
			lasttime=arr[0].trim();
			nowtime=arr[1].trim();
			System.out.println(lasttime);
			System.out.println(nowtime);
		}
		int page1 = Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds(page1-1, limit1);
		int count=schoolService.fenyecount1(admin.getAccount(),name,zy,lasttime,nowtime);
		System.out.println(count);
		List<Alluserinfo> list=schoolService.fenyeshuju1(admin.getAccount(),name,zy,lasttime,nowtime,rowBounds);
		Table t=new Table();
		t.setCode(0);
		t.setCount(count);
		t.setMsg("");
		t.setData(list);
		gsonbean(t,response);
	}

	@RequestMapping("/myschool")
	public void myschool(HttpServletRequest request,HttpServletResponse response,String time,String name,String zy,String page,String limit)throws Exception{
		utf8(request,response);
		Userlist userlist= (Userlist) request.getSession().getAttribute("user");
		Userlist userlist1=schoolService.finduser(userlist.getPhone());
		String lasttime="";
		String nowtime="";
		if(time!=null&&time!=""&&!time.equals("to")){
			String arr[]=time.split("to");
			lasttime=arr[0].trim();
			nowtime=arr[1].trim();
			System.out.println(lasttime);
			System.out.println(nowtime);
		}
		int page1 = Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds(page1-1, limit1);
		int count=schoolService.fenyecount1(userlist1.getTuijianren(),name,zy,lasttime,nowtime);
		System.out.println(count);
		List<Alluserinfo> list=schoolService.fenyeshuju1(userlist1.getTuijianren(),name,zy,lasttime,nowtime,rowBounds);
		Table t=new Table();
		t.setCode(0);
		t.setCount(count);
		t.setMsg("");
		t.setData(list);
		gsonbean(t,response);
	}

	/**
	 * 查询工作经历和学习经历
	 * @param account
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exgz")
	public void exgz(String account,HttpServletRequest request,HttpServletResponse response){
		utf8(request,response);
		System.out.println("account="+account);
		List<Experience> experiences=schoolService.findexperience(account);
		List<Undergo> undergos=schoolService.findegzjl(account);
		Table t=new Table();
		t.setExperiences(experiences);
		t.setUndergos(undergos);
		gsonbean(t,response);
	}

//	/**
//	 * 下载模板
//	 * @return
//	 * @throws IOException
//	 */
//	@RequestMapping("/xiazaimoban")
//	@ResponseBody
//	public String xiazaimoban() throws IOException
//	{
//		//new一个工作本
//		Workbook wb=new HSSFWorkbook();
//		//创建sheet页
//		Sheet sheet1=wb.createSheet("第一个sheet页");
//		//创建一个行
//		Row row=sheet1.createRow(0);
//		//给单元格赋值，列
//		row.createCell(0).setCellValue("账号");
//		row.createCell(1).setCellValue("密码");
//		row.createCell(2).setCellValue("姓名");
//		row.createCell(3).setCellValue("电话");
//		row.createCell(4).setCellValue("性别");
//		row.createCell(5).setCellValue("最高学历");
//		row.createCell(6).setCellValue("证件号");
//		row.createCell(7).setCellValue("证件类型");
//		row.createCell(8).setCellValue("出生日期");
//		FileOutputStream fileOut=new FileOutputStream("C:\\简历模板.xls");
//		//打印流
//		wb.write(fileOut);
//		//关闭流
//		fileOut.close();
//		return "ok";
//	}

	@RequestMapping("/daoru")
	@ResponseBody
	public Map<String,Object> daoru(HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IOException
	{
		System.out.println("开始导入数据");

		Admin admin= (Admin) request.getSession().getAttribute("admin");

		System.out.println("文件大小为"+file .getSize());

		String filename = file.getOriginalFilename();
		Map map=new HashMap<String,Object>();

		if(checkFile(file)==false){
			//文件不存在或者格式错误
			System.out.println("文件不存在或者格式错误");
			map.put("msg","fail1");
			return map;
		}


		if(file .getSize()>10*1024*1024){
			//上传文件超过10M
			System.out.println("上传文件超过10M");
			map.put("msg","fail2");
			return map;
		}

		if(checkFileexcel(file)==false){
			//上传文件不是xsl文件
			System.out.println("上传文件不是xsl文件");
			map.put("msg","fail3");
			return map;
		}



		//获取excel文件的io流
		InputStream is = file.getInputStream();

		HSSFWorkbook wb=new HSSFWorkbook(is);

		HSSFSheet hssfSheet=wb.getSheetAt(0);

		if (hssfSheet!=null){
			for (int rowNum = 1; rowNum < hssfSheet.getLastRowNum()+1; rowNum++)
			{
				System.out.println("一次循环");
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if (hssfRow==null){
					continue;
				}
				Userlist userlist=new Userlist();
				userlist.setPhone(formatCell(hssfRow.getCell(0)));
				userlist.setPassword(formatCell(hssfRow.getCell(1)));
				userlist.setName(formatCell(hssfRow.getCell(2)));
				userlist.setSex(formatCell(hssfRow.getCell(3)));
				Date date1 = hssfRow.getCell(4).getDateCellValue();
				DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String dateStr = sdf.format(date1);
				userlist.setBirthday(dateStr);
				userlist.setIdCard(formatCell(hssfRow.getCell(5)));
				userlist.setIdCardType(formatCell(hssfRow.getCell(6)));
				userlist.setDegree(formatCell(hssfRow.getCell(7)));
				Date date = new Date();
				Timestamp nousedate = new Timestamp(date.getTime());
				userlist.setRegTime(nousedate);
				userlist.setState(0);
				userlist.setTuijianren(admin.getAccount());
				int intuser=schoolService.inseruserinfo(userlist);
				if(intuser>0){
					System.out.println("用户表插入一条成功");
				}
				//插入简历表
				Userlist userlist1=schoolService.finduser(userlist.getPhone());
				Resume resume=new Resume();
				resume.setYhId(userlist1.getYhid());
				resume.setScTime(userlist.getRegTime());
				resume.setYhname(userlist1.getName());
				resume.setYcHide("0");
				resume.setSjPhone(userlist.getPhone());
				resume.setXbSex(userlist.getSex());

//				resume.setCsTime(userlist.getBirthday());
				resume.setJlname(formatCell(hssfRow.getCell(8)));
				resume.setZsCertificate(formatCell(hssfRow.getCell(9)));
				resume.setGjNationality(formatCell(hssfRow.getCell(10)));
				resume.setYxMailbox(formatCell(hssfRow.getCell(11)));
				resume.setPjEvaluation(formatCell(hssfRow.getCell(12)));
				resume.setJzdResidence(formatCell(hssfRow.getCell(13)));
				resume.setMmFace(formatCell(hssfRow.getCell(14)));
				resume.setMinzu(formatCell(hssfRow.getCell(15)));
				resume.setJzstate(formatCell(hssfRow.getCell(16)));
				resume.setByschool(formatCell(hssfRow.getCell(17)));
				resume.setXl(formatCell(hssfRow.getCell(18)));
				resume.setZy(formatCell(hssfRow.getCell(19)));
				int intres=schoolService.inserjl(resume);
				if(intres>0){
					System.out.println("简历表插入一条成功");
				}
				//插入就职意向表
				Resume resume1=schoolService.findjl(userlist1.getYhid());
				Jobintension jobintension=new Jobintension();
				jobintension.setJlid(resume1.getJlId());
				jobintension.setYhid(userlist1.getYhid());
				jobintension.setWorkstate(formatCell(hssfRow.getCell(20)));
				jobintension.setWorkPlace(formatCell(hssfRow.getCell(21)));
				jobintension.setMonthlyPay(formatCell(hssfRow.getCell(22)));
				jobintension.setGwid(0);
				jobintension.setOther(formatCell(hssfRow.getCell(23)));
				jobintension.setPoid(0);
				int intjobint=schoolService.inserjobint(jobintension);
				if(intjobint>0){
					System.out.println("就业意向表插入一条成功");
				}
				Experience experience=new Experience();
				experience.setJlId(resume1.getJlId());
				Undergo undergo=new Undergo();
				undergo.setJlId(resume1.getJlId());
				schoolService.inserxx(experience);
				schoolService.insergz(undergo);
//				//插入管理员表
//				Admin a=new Admin();
//				a.setAccount(userlist.getPhone());
//				a.setPassword(userlist.getPassword());
//				a.setRegistertime(userlist.getRegTime());
//				a.setName(userlist.getName());
//				adminService.regAdmin(a);
//
//				//插入管理角色表
//				Adminrole adminrole=new Adminrole();
//				adminrole.setAccount(userlist.getPhone());
//				adminrole.setRoid(5);
//				adminroleService.regAdminRole(adminrole);


			}

		}
		map.put("msg","ok");
		return map;
	}


	/**
	 * 判断文件是否存在以及是否是excel文件
	 * @param file
	 * @throws IOException
	 */
	public static boolean checkFile(MultipartFile file) throws IOException {
		//判断文件是否存在
		if (null == file) {
			System.err.println("文件不存在！");
			return false;
		}
		//获得文件名
		String fileName = file.getOriginalFilename();
		//判断文件是否是excel文件
		if (!fileName.endsWith("xls") && !fileName.endsWith("xlsx")) {
			System.err.println("不是excel文件");
			return false;
		}
		return  true;
	}


	/**
	 * 判断文件类型是xls还是xlsx
	 * @param file
	 * @return
	 */
	public static boolean checkFileexcel(MultipartFile file) {
		//获得文件名
		String fileName = file.getOriginalFilename();
			//根据文件后缀名不同(xls)
			if (fileName.endsWith("xls")) {
			return true;
			}

		return false;
	}

	/**
	 * 返回类型
	 * @param hssfCell
	 * @return
	 */
	public static String formatCell(HSSFCell hssfCell){
		String value = "";
		if (hssfCell != null) {
			switch (hssfCell.getCellType()) {
				case HSSFCell.CELL_TYPE_FORMULA:
					break;
				case HSSFCell.CELL_TYPE_NUMERIC:
					DecimalFormat df = new DecimalFormat("0");
					value = df.format(hssfCell.getNumericCellValue());
					break;
				case HSSFCell.CELL_TYPE_STRING:
					value = hssfCell.getStringCellValue().trim();
					break;
				default:
					value = "";
					break;
			}
		}
		return value.trim();
	}

	/**
	 * 跳转到推荐人才页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/tjrencai")
	@ResponseBody
	public ModelAndView turntjrc(HttpServletRequest request){
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		S1 scinfo=schoolService.findSchoolinfo(admin.getAccount());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/WEB-INF/school/tuijianrencai");
		mv.addObject("scinfo",scinfo);
		return mv;
	}

	/**
	 * 分页企业信息
	 *
	 */
	@RequestMapping("/rgxg")
	public void tjrcquery(HttpServletRequest request,HttpServletResponse response,String position,String type,String page,String limit)throws Exception{
		utf8(request,response);
		int page1 = Integer.valueOf(page);
		int limit1=Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds(page1-1, limit1);
		int count=schoolService.fenyecount2(position,type);
		System.out.println(count);
		List<J1> list=schoolService.fenyeshuju2(position,type,rowBounds);
		Table t=new Table();
		t.setCode(0);
		t.setCount(count);
		t.setMsg("");
		t.setData(list);
		gsonbean(t,response);
	}

	@RequestMapping("/cguserinfo")
	@ResponseBody
	public String cguserinfo(Alluserinfo alluserinfo){
		int i=schoolService.updateuser(alluserinfo);
		int k=schoolService.upadtejl1(alluserinfo);
		if(i>0&&k>0){
			return "1";
		}
		return "0";
	}

	@RequestMapping("/tj")
	@ResponseBody
	public String tj(String yhid,String jlid,String xxzpid,HttpServletRequest request){
		Jobinfo jobinfo=schoolService.findjobinfo(Long.valueOf(xxzpid));
		Query check=schoolService.findjljl(Long.valueOf(jlid),Long.valueOf(xxzpid));
		if(check==null){
			Query query=new Query();
			Date date = new Date();
			Timestamp nousedate = new Timestamp(date.getTime());
			query.setCkTime(nousedate);
			query.setJlId(Long.valueOf(jlid));
			query.setPaid(Long.valueOf(10));
			query.setZpxxid(jobinfo.getZpxxid());
			query.setQyId(jobinfo.getQyid());
			int i=schoolService.inserquery(query);
			if(i>0){
				Tjjl tjjl=new Tjjl();
				Admin admin= (Admin) request.getSession().getAttribute("admin");
				tjjl.setYhid(Long.valueOf(yhid));

				tjjl.setDatetime(nousedate);
				tjjl.setTuijianren(admin.getAccount());
				tjjl.setZpxxid(Long.valueOf(xxzpid));
				tjjl.setTjjlid(Long.valueOf(jlid));
				int k=schoolService.insertjjl(tjjl);
				return "1";
			}else{
				return "0";
			}

		}
		return "0";
	}

	@RequestMapping("/tjbb")
	@ResponseBody
	public ModelAndView tjbb(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		mv.setViewName("/WEB-INF/school/tjbb");
		mv.addObject("tuijianren",admin.getAccount());
		return mv;
	}

	@RequestMapping("/tjbbuse")
	@ResponseBody
	public ModelAndView tjbbuse(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		Admin admin= (Admin) request.getSession().getAttribute("admin");
		mv.setViewName("/WEB-INF/school/tjbbuse");
		mv.addObject("tuijianren",admin.getAccount());
		return mv;
	}


































	public int panduanphone(String account,String phone){
		S1 ssc=schoolService.findSchoolinfo(account);
		if(ssc.getScPhone().equals(phone)){}else{
			//查找手机号是否唯一
			System.out.println("yyy"+ssc.getScPhone());
			System.out.println("xxx"+phone);
			S1 scphonecheck=schoolService.findphone(phone);
			if(scphonecheck!=null){return 0;}
		}
		return 1;
	}
	public int panduandaima(String account,String daima){
		S1 ssc=schoolService.findSchoolinfo(account);
		if(ssc.getXinyongDaima().equals(daima)){}else{
			//查找手机号是否唯一
			S1 scdaimacheck=schoolService.finddaima(daima);
			if(scdaimacheck!=null){return 0;}
		}
		return 1;
	}
	//时间
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat s = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		String format = s.format(date);
		return format;
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
}

