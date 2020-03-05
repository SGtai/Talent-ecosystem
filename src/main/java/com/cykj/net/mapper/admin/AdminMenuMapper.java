package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.admin.ZtreeMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface AdminMenuMapper {


    @Select("select a.pid,a.menuname name,a.meid id,b.status checked from menu a,rolemenu b " +
            "where a.meid = b.meid and b.roid = #{rid}")
    List<ZtreeMenu> initMenuChange(int rid);

    @Update("update rolemenu set status = 0 where roid = #{rid}")
    int initMenuRoid(int rid);

    @Update("update rolemenu set status = 1 where roid = #{rid} and meid = #{check}")
    int updateMenuRoid(int rid, String check);
}
