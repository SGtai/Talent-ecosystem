package com.cykj.net.mapper;

import com.cykj.net.javabean.Adminrole;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 杨德禄 JX190714
 * @create 2020-02-17 21:43
 * @desc
 **/
@Mapper
public interface AdminRoleDao
{
	//单条插入
	public int regAdminRole(Adminrole adminrole);
}
