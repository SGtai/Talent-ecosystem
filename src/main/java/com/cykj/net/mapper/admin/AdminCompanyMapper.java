package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Qyinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminCompanyMapper {
//,jdbcType=INT
    @Select("<script> " +
            "select count(a.qyid) from qyinfo a,admin b where a.qyAccount = b.account " +
            "<if test = 'qyName != null'> " +
            "and a.qyName  like CONCAT('%',#{qyName},'%') </if> " +
            "<if test = 'qyType != null'> " +
            "and a.qyType = #{qyType} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state,jdbcType=INT} </if> " +
            "</script> ")
    int countCompany(@Param("qyName")String qyName, @Param("qyType")String qyType, @Param("ctid")String ctid,@Param("state")String state);

    @Select("<script> " +
            "select a.qyid,a.qyAccount,a.qyName,a.qyAddress,a.qyfdMan,a.qyType,a.jyScope,a.jyTime," +
            "a.qyKind,a.regMoney,a.vipLevel,a.xinyongDu,a.qyPicture,a.regTime,a.replyRate,a.ctid," +
            "a.qyPeople,b.state " +
            "from qyinfo a,admin b where a.qyAccount = b.account " +
            "<if test = 'qyName != null'> " +
            "and a.qyName  like CONCAT('%',#{qyName},'%') </if> " +
            "<if test = 'qyType != null'> " +
            "and a.qyType = #{qyType} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid,jdbcType=INT} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state,jdbcType=INT} </if> " +
            "limit #{page},#{limit}" +
            "</script> ")
    List<Qyinfo> allCompany(@Param("qyName")String qyName, @Param("qyType")String qyType, @Param("ctid")String ctid, @Param("state")String state, @Param("page")int page, @Param("limit")int limit);

    @Select("select name from city where ctid = #{ctid}")
    String findCityName(String ctid);
}
