package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.City;
import com.cykj.net.javabean.Province;
import com.cykj.net.javabean.Qyinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AdminCompanyMapper {

    @Select("<script> " +
            "select count(a.qyid) from qyinfo a,admin b where a.qyAccount = b.account " +
            "<if test = 'qyName != null'> " +
            "and a.qyName  like CONCAT('%',#{qyName},'%') </if> " +
            "<if test = 'qyType != null'> " +
            "and a.qyType = #{qyType} </if> " +
            "<if test = 'prid != null'> " +
            "and a.prid = #{prid} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state} </if> " +
            "</script> ")
    int countCompany(@Param("qyName")String qyName, @Param("qyType")String qyType, @Param("prid")String prid, @Param("ctid")String ctid,@Param("state")String state);

    @Select("<script> " +
            "select a.qyData,a.qyid,a.qyAccount,a.qyName,a.qyAddress,a.qyfdMan,a.qyType,a.jyScope,a.jyTime," +
            "a.qyKind,a.regMoney,a.vipLevel,a.xinyongDu,a.qyPicture,a.regTime,a.replyRate,a.ctid," +
            "a.qyPeople,a.prid,b.state " +
            "from qyinfo a,admin b where a.qyAccount = b.account " +
            "<if test = 'qyName != null'> " +
            "and a.qyName  like CONCAT('%',#{qyName},'%') </if> " +
            "<if test = 'qyType != null'> " +
            "and a.qyType = #{qyType} </if> " +
            "<if test = 'prid != null'> " +
            "and a.prid = #{prid} </if> " +
            "<if test = 'ctid != null'> " +
            "and a.ctid = #{ctid} </if> " +
            "<if test = 'state != null'> " +
            "and b.state = #{state} </if> " +
            "limit #{page},#{limit}" +
            "</script> ")
    List<Qyinfo> allCompany(@Param("qyName")String qyName, @Param("qyType")String qyType, @Param("prid")String prid, @Param("ctid")String ctid, @Param("state")String state, @Param("page")int page, @Param("limit")int limit);

    @Select("select name from city where ctid = #{ctid}")
    String findCityName(String ctid);

    @Select("select name from province where prid = #{prid}")
    String findProvinceName(String prid);

    @Select("select * from province")
    List<Province> getProvinces();

    @Select("select name ctname,ctid ctid from city where prid = #{prid}")
    List<City> getCitys(String prid);

    @Update("update admin set state = #{state} where account = #{qyAccount}")
    int updateState(@Param("qyAccount")String qyAccount, @Param("state")String state);

    @Update("update admin set password = #{password} where account = #{qyAccount}")
    int updatePassword(String qyAccount,String password);

}
