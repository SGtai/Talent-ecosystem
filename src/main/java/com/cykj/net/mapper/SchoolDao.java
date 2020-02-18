package com.cykj.net.mapper;

import com.cykj.net.javabean.Schoolinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SchoolDao
{
	/**
	 * 查找学校信息
	 * @param scAccount
	 * @return
	 */
	public Schoolinfo findSchoolinfo(@Param("account") String scAccount);
	/**
	 * 插入学校信息
	 * @param schoolinfo
	 * @return
	 */
	public int inserSchoolinfo(Schoolinfo schoolinfo);

	/**
	 * 修改学校信息
	 * @param schoolinfo
	 * @return
	 */
	public int updateSchoolinfo(Schoolinfo schoolinfo);
}
