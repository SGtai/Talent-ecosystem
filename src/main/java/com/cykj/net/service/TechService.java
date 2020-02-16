package com.cykj.net.service;
import com.cykj.net.javabean.Curriculum;
import com.cykj.net.javabean.Develop;
import com.cykj.net.mapper.TechDao;
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
    public ArrayList<Curriculum> getCurriculumList(String id){
        return techDao.getCurriculumList(id);
    };
    public ArrayList<Curriculum> getCurriculumListS(){
        return techDao.getCurriculumListS();
    };
}
