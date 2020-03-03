package com.cykj.net.mapper.admin;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdminCensusMapper {

    @Select("select count(*) from ${tableName} where regTime like  CONCAT(#{s},'%') ")
    int countQueryWeek(String s,String tableName);

    @Select("select count(*) from ${tableName} where regTime between #{s} and #{s1} ")
    int countQueryMonth(String s, String s1,String tableName);

    @Select("select count(*) from ${tableName} where regTime like  CONCAT(#{s},'%') ")
    int countQueryHalf(String s,String tableName);
}
