package com.cykj.net.mapper;


import com.cykj.net.javabean.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdminMapper {

    @Select("select * from admin where account = #{account} ")
    Admin findAdmin(String account);

}
