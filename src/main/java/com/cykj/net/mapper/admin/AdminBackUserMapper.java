package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.admin.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AdminBackUserMapper {

    /**
     * 查询管理员
     * @param account
     * @param name
     * @param limit
     * @param page
     * @param roid
     * @return
     */
    @Select("<script> " +
            "select a.account account,a.name name,a.registertime registertime,a.state state from admin a,adminrole b,role c " +
            "where a.account = b.account and b.roid = c.roid and c.roid = #{roid} " +
            "<if test = 'account != null'> " +
            "and a.account like CONCAT('%',#{account},'%') " +
            "</if> " +
            "<if test = 'name != null'> " +
            "and a.name like CONCAT('%',#{name},'%') " +
            "</if> " +
            "limit #{page},#{limit}" +
            " </script>")
    List<Admin> findAllAdmin(@Param("account")String account,@Param("name")String name,@Param("limit")int limit,@Param("page")int page,@Param("roid")int roid);

    /**
     * 查询管理员条数
     * @param account
     * @param name
     * @param roid
     * @return
     */
    @Select("<script> " +
            "select count(a.account) count from admin a,adminrole b,role c " +
            "where a.account = b.account and b.roid = c.roid and c.roid = #{roid} " +
            "<if test = 'account != null'> " +
            "and a.account like CONCAT('%',#{account},'%') " +
            "</if> " +
            "<if test = 'name != null'> " +
            "and a.name like CONCAT('%',#{name},'%') " +
            "</if> " +
            " </script>")
    int countAllAdmin(@Param("account")String account,@Param("name")String name,@Param("roid")int roid);

    @Update("<script> " +
            "update admin set " +
            "<trim suffixOverrides=','>" +
            "<if test = 'state != null'> " +
            " state = #{state}, " +
            "</if> " +
            "<if test = 'password != null'> " +
            " password = #{password} " +
            "</if> " +
            "</trim>" +
            "where account = #{account} " +
            "</script>")
    int updateAdmin(Admin admin);

}
