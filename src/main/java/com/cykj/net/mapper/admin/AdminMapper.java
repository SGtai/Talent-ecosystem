package com.cykj.net.mapper.admin;


import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.javabean.admin.AdminMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminMapper {

    @Select("select * from admin where account = #{account} ")
    Admin findAdmin(String account);

    @Select("select roid from adminrole where account = #{account} ")
    int findRoid(String account);

    @Select("select a.menuname firstmenuname,b.menuname sencondmenuname,b.menuurl from " +
            "(select b.* from rolemenu a,menu b where a.meid = b.meid and a.roid = #{roid} and a.status = 1)a," +
            "(select b.* from rolemenu a,menu b where a.meid = b.meid and a.roid = #{roid} and a.status = 1)b " +
            "where a.firstmenuid = b.secondmenuid")
    List<AdminMenu> findRoleMenus(int roid);

}
