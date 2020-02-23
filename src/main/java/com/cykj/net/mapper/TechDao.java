package com.cykj.net.mapper;

import com.cykj.net.javabean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface TechDao
{
	public ArrayList<Develop> getDevelopList();
	public ArrayList<Curriculum> getCurriculumListS();
	public ArrayList<Curriculum> geCurriculumsel(Curriculum cu);
	public Curriculum getCurriculum(@Param("kcid") String id);
	public ArrayList<Chapters> getChaptersList(@Param("kjid") String id);
	public ArrayList<Video> getVideoList(@Param("zjid") String id);
	public ArrayList<Assess> getAssessList(@Param("spId") String id);
	public Chapters getChapters(@Param("zjid") String id);
	public ArrayList<Reply> getReplyList(@Param("pjId") String id);
	public Assist getAssist(Assist ast);
	public int addCurriculum(Curriculum cc);
	public int addChapters(Chapters ct);
	public int addVideo(Video vd);
	public int addAssess(Assess as);
	public int addAssist(Assist ast);
	public int addReply(Reply reply);
	public int upAssess(@Param("dzcs") String dzcs,@Param("pjId") Long pjId);
}
