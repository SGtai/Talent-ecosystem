package com.cykj.net.mapper;

import com.cykj.net.javabean.Chapters;
import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import com.cykj.net.javabean.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface TechDao
{
	public ArrayList<Develop> getDevelopList();
	public ArrayList<Curriculum> getCurriculumListS();
	public Curriculum getCurriculum(@Param("kcid") String id);
	public ArrayList<Chapters> getChaptersList(@Param("kjid") String id);
	public ArrayList<Video> getVideoList(@Param("zjid") String id);
	public Chapters getChapters(@Param("zjid") String id);
	public int addCurriculum(Curriculum cc);
	public int addChapters(Chapters ct);
	public int addVideo(Video vd);
}
