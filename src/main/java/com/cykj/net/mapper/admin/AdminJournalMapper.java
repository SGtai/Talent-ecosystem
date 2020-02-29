package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Adjournal;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminJournalMapper {

    @Insert("insert into adjournal(account,date,event,type) values(#{account},#{date},#{event},#{type})")
    void addJournal(Adjournal adjournal);

    @Select("<script> " +
            "select count(a.joid) from adjournal a,admin b where " +
            "a.account = b.account " +
            "<if test = 'account != null'> " +
            "and a.account like CONCAT('%',#{account},'%') </if> " +
            "</script> ")
    int countJournal(String account);

    @Select("<script> " +
            "select a.*,b.name from adjournal a,admin b where " +
            "a.account = b.account " +
            "<if test = 'account != null'> " +
            "and a.account like CONCAT('%',#{account},'%') </if> " +
            "<if test = 'type != null'> " +
            "and a.type = #{type} </if> " +
            "order by a.date desc " +
            "limit #{page},#{limit} " +
            "</script> ")
    List<Adjournal> allJournal(String account,String type, int page, int limit);

    @Select("select distinct type from adjournal")
    List<Adjournal> getJournal();
}
