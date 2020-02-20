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
	 * 查相同手机号
	 * @param scAccount
	 * @return
	 */
	public Schoolinfo finddaima(@Param("daima") String daima);

	/**
	 * 查相同社会信用代码
	 * @param scAccount
	 * @return
	 */
	public Schoolinfo findphone(@Param("phone") String phone);
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
