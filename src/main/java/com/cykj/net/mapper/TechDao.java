package com.cykj.net.mapper;

import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface TechDao
{
	public ArrayList<Develop> getDevelopList();
	public ArrayList<Curriculum> getCurriculumListS();
	public ArrayList<Curriculum> getCurriculumList(@Param("typeid") String id);

}
