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

    @Select("select count(*) from ${tableName} where regTime like  CONCAT(#{s},'%') and tuijianren=#{tjr}")
    int countQueryWeek1(String s,String tableName,String tjr);

    @Select("select count(*) from ${tableName} where regTime between #{s} and #{s1}  and tuijianren=#{tjr}")
    int countQueryMonth1(String s, String s1,String tableName,String tjr);

    @Select("select count(*) from ${tableName} where regTime like  CONCAT(#{s},'%')  and tuijianren=#{tjr}")
    int countQueryHalf1(String s,String tableName,String tjr);

	@Select("select count(*) from ${tableName} where datetime like  CONCAT(#{s},'%') and tuijianren=#{tjr}")
	int countQueryWeek2(String s,String tableName,String tjr);

	@Select("select count(*) from ${tableName} where datetime between #{s} and #{s1}  and tuijianren=#{tjr}")
	int countQueryMonth2(String s, String s1,String tableName,String tjr);

	@Select("select count(*) from ${tableName} where datetime like  CONCAT(#{s},'%')  and tuijianren=#{tjr}")
	int countQueryHalf2(String s,String tableName,String tjr);

}
