package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.City;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AdminCityMapper {

    @Select("<script> " +
            "select count(*) from city where 1=1 " +
            "<if test = 'prid != null'> " +
            " and prid = #{prid} </if> " +
            "</script>")
    int countCity(String prid, int page, int limit);

    @Select("<script> " +
            "select a.ctid,a.prid,a.name ctname,b.name prname from city a,province b where a.prid = b.prid " +
            "<if test = 'prid != null'> " +
            "and a.prid = #{prid} </if> " +
            "limit #{page},#{limit}" +
            "</script>")
    List<City> findCityList(String prid, int page, int limit);


    @Select("select prid,name prname from province")
    List<City> findAllProvince();

    @Select("select count(*) from city where prid = #{prid} and name = #{ctname}")
    int findCity(City city);

    @Insert("insert into city (prid,name) values (#{prid},#{ctname})")
    int addCity(City city);

    @Update("update city set prid = #{prid},name = #{ctname} where " +
            "prid = #{ctid} and name = #{name}")
    int updateCity(City city);

    @Delete("delete from city where ctid = #{ctid} and name = #{ctname} and prid = #{prid}")
    int deleteCity(City city);

    @Select("select prid,name prname from province limit #{page},#{limit}" )
    List<City> findProvinceList(int page, int limit);

    @Select("select count(*) from province where name = #{prname}")
    int findProvince(City city);

    @Insert("insert into province (name) values (#{prname})")
    int addProvince(City city);

    @Update("update province set name = #{prname} where " +
            " name = #{name}")
    int updateProvince(City city);

    @Select("select count(*) from city where prid = #{prid}")
    int findCitys(City city);

    @Delete("delete from province where name = #{prname}")
    int deleteProvince(City city);
}
