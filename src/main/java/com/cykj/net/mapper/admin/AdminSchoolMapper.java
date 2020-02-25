package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Schoolinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminSchoolMapper {

    @Select("<script> " +
            "select count(a.scid) from schoolinfo a,admin b where a.scAccount = b.account " +
            "<if test = 'scName != null'> " +
            "and a.scName  like CONCAT('%',#{scName},'%') </if> " +
            "<if test = 'type != null'> " +
            "and a.type = #{type} </if> " +
            "<if test = 'prid != null'> " +
            "and a.prid = #{prid} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state} </if> " +
            "</script> ")
    int countSchool(@Param("scName")String scName, @Param("type")String type, @Param("prid")String prid, @Param("ctid")String ctid, @Param("state")String state);

    @Select("<script> " +
            "select a.scid,a.scAccount,a.scdata,a.scName,a.scAddress,a.scfdMan,a.moneyLaiyuan,a.kaibanMoney,a.jubanDanwei," +
            "a.xinyongDaima,a.scAbout,a.scpicture,a.scState,a.scPhone,a.regTime,a.ctid," +
            "a.type,a.prid,b.state " +
            "from schoolinfo a,admin b where a.scAccount = b.account " +
            "<if test = 'scName != null'> " +
            "and a.scName  like CONCAT('%',#{scName},'%') </if> " +
            "<if test = 'type != null'> " +
            "and a.type = #{type} </if> " +
            "<if test = 'prid != null'> " +
            "and a.prid = #{prid} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state} </if> " +
            "limit #{page},#{limit}" +
            "</script> ")
    List<Schoolinfo> allSchool(@Param("scName")String scName, @Param("type")String type, @Param("prid")String prid, @Param("ctid")String ctid, @Param("state")String state, @Param("page")int page, @Param("limit")int limit);
}
