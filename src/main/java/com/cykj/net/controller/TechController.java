package com.cykj.net.controller;

import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
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
	@RequestMapping("/techa")
	public ModelAndView tologin(){
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

}
