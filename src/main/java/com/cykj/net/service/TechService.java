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
    public ArrayList<Finance> geFinanceSel(Finance fe){return techDao.geFinanceSel(fe);};
    public ArrayList<Chapters> getChaptersList(String id){
        return techDao.getChaptersList(id);
    };
	public ArrayList<Chapters> geChapterssel(Chapters cp){return techDao.geChapterssel(cp);};
	public ArrayList<Chapters> geChaptersData(Chapters cp){return techDao.geChaptersData(cp);};
    public ArrayList<Video> getVideoList(String id){ return techDao.getVideoList(id); }
    public Chapters getChapters(String id){ return techDao.getChapters(id);}
    public ArrayList<Finance> geFinanceData(Finance fe){return techDao.geFinanceData(fe);};
    public int addCurriculum(Curriculum cc){ return techDao.addCurriculum(cc);}
    public int addChapters(Chapters ct){return techDao.addChapters(ct);};
    public int addVideo(Video vd){return techDao.addVideo(vd);};
    public ArrayList<Video> geVideossel(Video vo){return techDao.geVideossel(vo);};
    public ArrayList<Video>	geVideoData(Video vo){return techDao.geVideoData(vo);};
	public int addAssess(Assess as){return techDao.addAssess(as);};
    public int addFinance(Finance fe){return techDao.addFinance(fe);};
    public int upVideoD(Video vo){return techDao.upVideoD(vo);};
    public ArrayList<Finance> getFinance(Finance fe){return techDao.getFinance(fe);};
    public int deleteSp(@Param("spId") String spId){return techDao.deleteSp(spId);};
    public int addReply(Reply reply){return techDao.addReply(reply);};
    public ArrayList<Chapters> getChaptersKcId(@Param("zjId") String id){return techDao.getChaptersKcId(id);};
    public int upCurriculumPj(@Param("kcId") Long kcId){return techDao.upCurriculumPj(kcId);};
    public int deleteKc(String kcId){return techDao.deleteKc(kcId);};
    public int upCurriculumGm(@Param("kcId") Long kcId){return techDao.upCurriculumGm(kcId);};
    public int deleteFi(@Param("cwId") String cwId){return techDao.deleteFi(cwId);};
    public int deleteZj(String zjId){return techDao.deleteZj(zjId);};
	public int upChaptersD(Chapters cp){return techDao.upChaptersD(cp);};
    public ArrayList<Assess> getAssessList(String id){return techDao.getAssessList(id);};
    public ArrayList<Reply> getReplyList(String id){return techDao.getReplyList(id);};
    public Assist getAssist(Assist ast){return techDao.getAssist(ast);};
    public int addAssist(Assist ast){return techDao.addAssist(ast);};
    public int upAssess(String cs,Long pjId){return techDao.upAssess(cs,pjId);};
    public int upCurriculum(Long jgPrice,Long kcId){return techDao.upCurriculum(jgPrice,kcId);};
    public int upCurriculumD(Curriculum curriculum){return techDao.upCurriculumD(curriculum);};
    public ArrayList<Curriculum> geCurriculumData(Curriculum cu){return techDao.geCurriculumData(cu);};
}
