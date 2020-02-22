package com.cykj.net.service;
import com.cykj.net.javabean.*;
import com.cykj.net.mapper.TechDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
@Service
public class TechService
{
    @Resource
    private TechDao techDao;
    public ArrayList<Develop> getDevelopList(){ return techDao.getDevelopList(); };
    public Curriculum getCurriculum(String id){
        return techDao.getCurriculum(id);
    };
	public ArrayList<Curriculum> geCurriculumsel(Curriculum cu){return techDao.geCurriculumsel(cu);};
    public ArrayList<Curriculum> getCurriculumListS(){ return techDao.getCurriculumListS(); };
    public ArrayList<Chapters> getChaptersList(String id){
        return techDao.getChaptersList(id);
    };
    public ArrayList<Video> getVideoList(String id){ return techDao.getVideoList(id); }
    public Chapters getChapters(String id){ return techDao.getChapters(id);}
    public int addCurriculum(Curriculum cc){ return techDao.addCurriculum(cc);}
    public int addChapters(Chapters ct){return techDao.addChapters(ct);};
    public int addVideo(Video vd){return techDao.addVideo(vd);};
	public int addAssess(Assess as){return techDao.addAssess(as);};
    public int addReply(Reply reply){return techDao.addReply(reply);};
    public ArrayList<Assess> getAssessList(String id){return techDao.getAssessList(id);};
    public ArrayList<Reply> getReplyList(String id){return techDao.getReplyList(id);};
    public Assist getAssist(Assist ast){return techDao.getAssist(ast);};
    public int addAssist(Assist ast){return techDao.addAssist(ast);};
    public int upAssess(String cs,Long pjId){return techDao.upAssess(cs,pjId);};
}
