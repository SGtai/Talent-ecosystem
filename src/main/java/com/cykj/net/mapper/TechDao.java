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
	public ArrayList<Curriculum> geCurriculumData(Curriculum cu);
	public ArrayList<Finance> geFinanceSel(Finance fe);
	public ArrayList<Finance> geFinanceData(Finance fe);
	public ArrayList<Chapters> geChapterssel(Chapters cp);
	public ArrayList<Chapters> geChaptersData(Chapters cp);
	public ArrayList<Video> geVideossel(Video vo);
	public ArrayList<Video>	geVideoData(Video vo);
	public Curriculum getCurriculum(@Param("kcid") String id);
	public ArrayList<Chapters> getChaptersList(@Param("kjid") String id);
	public ArrayList<Video> getVideoList(@Param("zjid") String id);
	public ArrayList<Assess> getAssessList(@Param("spId") String id);
	public Chapters getChapters(@Param("zjid") String id);
	public ArrayList<LearningLog> getLearningLog(@Param("yhId") String id);
	public ArrayList<Reply> getReplyList(@Param("pjId") String id);
	public Assist getAssist(Assist ast);
	public ArrayList<Chapters> getChaptersKcId(@Param("zjId") String id);
	public  ArrayList<Finance> getFinance(Finance fe);
	public int addCurriculum(Curriculum cc);
	public int  addLearningLog(LearningLog learningLog);
	public int wxreg(Userlist userlist);
	public int addFinance(Finance fe);
	public int addChapters(Chapters ct);
	public int addVideo(Video vd);
	public int addAssess(Assess as);
	public int addAssist(Assist ast);
	public int addReply(Reply reply);
	public int deleteKc(@Param("kcId") String kcId);
	public int deleteZj(@Param("zjId") String zjId);
	public int deleteSp(@Param("spId") String spId);
	public int deleteJl(@Param("spId") String spId);
	public int deleteFi(@Param("cwId") String cwId);
	public int upCurriculumD(Curriculum curriculum);
	public int upChaptersD(Chapters cp);
	public int upVideoD(Video vo);
	public int upAssess(@Param("dzcs") String dzcs,@Param("pjId") Long pjId);
	public int upCurriculum(@Param("jgPrice") Long jgPrice,@Param("kcId") Long kcId);
	public int upCurriculumPj(@Param("kcId") Long kcId);
	public int upCurriculumGm(@Param("kcId") Long kcId);

}
