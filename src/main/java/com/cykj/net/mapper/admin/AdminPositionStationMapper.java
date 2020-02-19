package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.AdminPositionStation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminPositionStationMapper {

    @Select("select poid id,type position from position")
    List<AdminPositionStation> findPositionList();

    @Select("<script>" +
            " select position.type position,station.postion station,station.poid poid from station,position" +
            " where station.poid=position.poid " +
            "<if test = 'poid != null'> " +
            " and station.poid = #{poid} </if> " +
            " limit #{page},#{limit}" +
            "</script>")
    List<AdminPositionStation> findStation(@Param("poid")String poid, @Param("page")int page, @Param("limit")int limit);


    @Select("<script>" +
            " select count(*) from station where 1=1 " +
            "<if test = 'poid != null'> " +
            " and poid = #{poid} </if> " +
            "</script>")
    int countStation(@Param("poid")String poid, @Param("page")int page, @Param("limit")int limit);
}
