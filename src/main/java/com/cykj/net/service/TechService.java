package com.cykj.net.service;
import com.cykj.net.javabean.Chapters;
import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import com.cykj.net.javabean.Video;
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
    public ArrayList<Develop> getDevelopList(){
        return techDao.getDevelopList();
    };
    public Curriculum getCurriculum(String id){
        return techDao.getCurriculum(id);
    };
    public ArrayList<Curriculum> getCurriculumListS(){ return techDao.getCurriculumListS(); };
    public ArrayList<Chapters> getChaptersList(String id){
        return techDao.getChaptersList(id);
    };
    public ArrayList<Video> getVideoList(String id){ return techDao.getVideoList(id); }
    public Chapters getChapters(String id){ return techDao.getChapters(id);

    }
}
