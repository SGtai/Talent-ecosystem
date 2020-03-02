package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Parameter;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AdminParameterMapper {


    @Select("<script> " +
            "select count(*) from parameter " +
            "where 1=1  " +
            "<if test = 'name != null'> " +
            "and name like CONCAT('%',#{name},'%') " +
            "</if> " +
            "<if test = 'type != null'> " +
            "and type = #{type} " +
            "</if> " +
            "</script>")
    int countParameter(String name, String type);

    @Select("<script> " +
            "select * from parameter " +
            "where 1=1  " +
            "<if test = 'name != null'> " +
            "and name like CONCAT('%',#{name},'%') " +
            "</if> " +
            "<if test = 'type != null'> " +
            "and type = #{type} " +
            "</if> " +
            "limit #{page},#{limit} " +
            "</script>")
    List<Parameter> findAllParameter(String name, String type, int page, int limit);

    @Select("select distinct type from parameter")
    List<Parameter> getParameter();

    @Select("select count(*) from parameter where type = #{type} and name = #{name} ")
    int findParameter(Parameter parameter);

    @Insert("insert into parameter (name,type,value) values (#{name},#{type},#{value})")
    int addParameter(Parameter parameter);

    @Update("update parameter set type = #{type},name = #{name},value = #{value}  where paid = #{paid} ")
    int updateParameter(Parameter parameter);

    @Select("select value from parameter where paid = #{i}")
    String findPassword(int i);
}
