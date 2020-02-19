package com.cykj.net.controller;

import com.cykj.net.javabean.Chapters;
import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import com.cykj.net.javabean.Video;
import com.cykj.net.service.TechService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.HashMap;

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
}
