package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Userlist;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AdminFrontUserMapper {

    @Select("<script> " +
            "select count(*) from userlist " +
            "where 1=1  " +
            "<if test = 'phone != null'> " +
            "and phone like CONCAT('%',#{phone},'%') " +
            "</if> " +
            "<if test = 'name != null'> " +
            "and name like CONCAT('%',#{name},'%') " +
            "</if> " +
            " </script>")
    int countFrontUser(String phone, String name);

    @Select("<script> " +
            "select * from userlist " +
            "where 1=1  " +
            "<if test = 'phone != null'> " +
            "and phone like CONCAT('%',#{phone},'%') " +
            "</if> " +
            "<if test = 'name != null'> " +
            "and name like CONCAT('%',#{name},'%') " +
            "</if> " +
            "order by regTime desc " +
            "limit #{page},#{limit}" +
            " </script>")
    List<Userlist> findAllFrontUser(String phone, String name, int page, int limit);

    @Update("update userlist set state = #{state} where phone = #{phone}")
    int updateState(String phone, String state);
    @Update("update userlist set password = #{updatePassword} where phone = #{phone}")
    int updatePassword(String phone, String updatePassword);
}
