package com.cykj.net.controller;

import com.cykj.net.javabean.Chapters;
import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import com.cykj.net.javabean.Video;
import com.cykj.net.service.TechService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping()
public class TechController
{
	@Autowired
	private TechService techService;


	/**
	 *  施恭泰 Jx190719
	 *  技术专区主界面处理
	 * @return
	 */
	@RequestMapping("/techa")
	public ModelAndView techa(){
		ModelAndView mv = new ModelAndView();
		ArrayList<Develop> dl = techService.getDevelopList();
		ArrayList<Curriculum> al = techService.getCurriculumListS();
		HashMap<String,ArrayList<Curriculum>> getMap = new HashMap<>();
		for (int i = 0; i <dl.size() ; i++)
		{
			ArrayList<Curriculum>  alA = new ArrayList<>();
			for (int j = 0; j <al.size(); j++)
			{
				if (al.get(j).getFzTypeId()==dl.get(i).getDeid()){
					alA.add(al.get(j));
				}
			}
			getMap.put(String.valueOf(i+1),alA);
		}
		mv.addObject("getMap",getMap);
		mv.addObject("dl",dl);
		mv.setViewName("/WEB-INF/tech/techA");
		return mv;
	}

	/**
	 *
	 * @param name 施恭泰 jx190719
	 * @param id  章节界面处理
	 * @return
	 */
	@RequestMapping("/techb")
	public ModelAndView techb(String name , String id){
		ModelAndView mv = new ModelAndView();
		ArrayList<Chapters> ct = techService.getChaptersList(id);
		System.out.println(name);
		mv.addObject("ct",ct);
		mv.addObject("name",name);
		mv.setViewName("/WEB-INF/tech/techB");
		return mv;
	}

	/**
	 *
	 * 施恭泰 jx190719
	 * @param id  章节的视频界面处理
	 * @return
	 */
	@RequestMapping("/techc")
	public ModelAndView techc(String id){
		ModelAndView mv = new ModelAndView();
		ArrayList<Video> video = techService.getVideoList(id);
		for (int i = 0; i < video.size(); i++)
		{
			video.get(i).setSpId(i+1);
		}
		Chapters ct = techService.getChapters(id);
		Curriculum cc = techService.getCurriculum(String.valueOf(ct.getKjId()));
		mv.addObject("video",video);
		mv.addObject("ct",ct);
		mv.addObject("cc",cc);
		mv.setViewName("/WEB-INF/tech/techC");
		return mv;
	}


	/**
	 *
	 * 施恭泰 jx190719
	 * @param id  视频播放界面处理
	 * @return
	 */
	@RequestMapping("/techvideo")
	public ModelAndView techvideo(String id,String name,String path){
		ModelAndView mv = new ModelAndView();
		ArrayList<Video> video = techService.getVideoList(id);
		for (int i = 0; i < video.size(); i++)
		{
			video.get(i).setSpId(i+1);
		}
		String suffix = path.substring(path.lastIndexOf(".") + 1);
		System.out.println("后缀="+suffix);
		mv.addObject("video",video);
		mv.addObject("path",path);
		mv.addObject("name",name);
		mv.addObject("suffix",suffix);
		mv.setViewName("/WEB-INF/tech/techVideo");
		return mv;
	}

	@RequestMapping("/techUpload.data")
	@ResponseBody
	public HashMap<String, Object> myUpload(HttpServletRequest request, ServletResponse response)
			throws Exception {
		System.out.println("上传界面"+request.getParameter("type")+"type"+request.getParameter("name")+"name"+request.getParameter("xx")+"xx"+request.getParameter("jg")+"jg");

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
			upload.setHeaderEncoding("utf-8");
			String makeFileName = null;
			Curriculum cc= new Curriculum();
			StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;
			Iterator<String> iterator = req.getFileNames();
			while (iterator.hasNext()) {
				MultipartFile file = req.getFile(iterator.next());
				String fileNames = file.getOriginalFilename();
				int split = fileNames.lastIndexOf(".");
				System.out.println("111"+file+"222"+fileNames+"333"+split);
				//存储文件
				//文件名  fileNames.substring(0,split)
				//文件格式   fileNames.substring(split+1,fileNames.length())
				//文件内容 file.getBytes()
				makeFileName = makeFileName(fileNames);
				String savePath = ResourceUtils.getURL("classpath:").getPath()+"static/techS/other";
//				String savePath = request.getSession().getServletContext().getRealPath("/techS/other");
				File file2 = new File(savePath);
				//                        判断上传文件的保存目录是否存在
				if (!file2.exists() && !file2.isDirectory()) {
					System.out.println(savePath + "目录不存在，需要创建");
					//创建目录
					file2.mkdir();
				}
				System.out.println(savePath + "/" + makeFileName);
				file.transferTo(new File(savePath + "/" + makeFileName));
				int a = Integer.valueOf(request.getParameter("jg"));
				if (a>0){
					cc.setJgPrice(request.getParameter("jg"));
				}else{
					cc.setJgPrice("免费");
				}
				cc.setKcName(request.getParameter("name"));
				cc.setFzTypeId(Integer.valueOf(request.getParameter("type")));
				cc.setMsDescribe(request.getParameter("xx"));
				cc.setCkPicture(makeFileName);
				techService.addCurriculum(cc);
			}
			response.setContentType("application/json; charset=utf-8");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			Date utilDate = new Date();//util.Date
			try
			{
				utilDate = df.parse(df.format(new Date()));
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			HashMap<String, Object> myMap = new HashMap<>();
			myMap.put("code", 0);
			myMap.put("msg", "");
			myMap.put("kcid",cc.getKcId());
			return myMap;
		}
		return null;
	}

	@RequestMapping("/techUploadCt.data")
	@ResponseBody
	public HashMap<String, Object> myUploadS(HttpServletRequest request, ServletResponse response)
			throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
			upload.setHeaderEncoding("utf-8");
			String makeFileName = null;
			Chapters ct= new Chapters();
			StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;
			Iterator<String> iterator = req.getFileNames();
			while (iterator.hasNext()) {
				MultipartFile file = req.getFile(iterator.next());
				String fileNames = file.getOriginalFilename();
				makeFileName = makeFileName(fileNames);
				String savePath = ResourceUtils.getURL("classpath:").getPath()+"static/techS/other";
				File file2 = new File(savePath);
				//                        判断上传文件的保存目录是否存在
				if (!file2.exists() && !file2.isDirectory()) {
					System.out.println(savePath + "目录不存在，需要创建");
					//创建目录
					file2.mkdir();
				}
				file.transferTo(new File(savePath + "/" + makeFileName));
				ct.setZjName(request.getParameter("name"));
				ct.setMsDescribe(request.getParameter("xx"));
				ct.setZjPicture(makeFileName);
				ct.setKjId(Integer.valueOf(request.getParameter("id")));
				techService.addChapters(ct);
			}
			response.setContentType("application/json; charset=utf-8");
			HashMap<String, Object> myMap = new HashMap<>();
			myMap.put("code", 0);
			myMap.put("msg", "");
			myMap.put("zjid",ct.getZjId());
			return myMap;
		}
		return null;
	}

	@RequestMapping("/techUploadV.data")
	@ResponseBody
	public HashMap<String, Object> myUploadS2(HttpServletRequest request, ServletResponse response)
			throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
			upload.setHeaderEncoding("utf-8");
			String makeFileName = null;
			Video vd= new Video();
			StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;
			Iterator<String> iterator = req.getFileNames();
			while (iterator.hasNext()) {
				MultipartFile file = req.getFile(iterator.next());
				String fileNames = file.getOriginalFilename();
				makeFileName = makeFileName(fileNames);
				String savePath = ResourceUtils.getURL("classpath:").getPath()+"static/techS/other/video";
				File file2 = new File(savePath);
				//                        判断上传文件的保存目录是否存在
				if (!file2.exists() && !file2.isDirectory()) {
					System.out.println(savePath + "目录不存在，需要创建");
					//创建目录
					file2.mkdir();
				}
				file.transferTo(new File(savePath + "/" + makeFileName));
				vd.setSpName(request.getParameter("name"));
				vd.setSpPath(makeFileName);
				vd.setSpDescribe(request.getParameter("xx"));
				vd.setZjId(Integer.valueOf(request.getParameter("id")));
				techService.addVideo(vd);
			}
			response.setContentType("application/json; charset=utf-8");
			HashMap<String, Object> myMap = new HashMap<>();
			myMap.put("code", 0);
			myMap.put("msg", "");
			myMap.put("spid",vd.getZjId());
			return myMap;
		}
		return null;
	}

	@RequestMapping("/techUpload")
	public ModelAndView jumpfront() {
		ModelAndView mv = new ModelAndView();
		ArrayList<Develop> dl = techService.getDevelopList();
		mv.addObject("dl",dl);
		mv.setViewName("/WEB-INF/tech/techUpload");
		return mv;
	}

	private String makeFileName(String filename) {  //2.jpg
		//为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		return UUID.randomUUID().toString() + "_" + filename;
	}


}