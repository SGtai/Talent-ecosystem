package com.cykj.net.mapper;

import com.cykj.net.javabean.Alluserinfo;
import com.cykj.net.javabean.C1;
import com.cykj.net.javabean.P1;
import com.cykj.net.javabean.Schoolinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

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
	 * @param daima
	 * @return
	 */
	public Schoolinfo finddaima(@Param("daima") String daima);

	/**
	 * 查相同社会信用代码
	 * @param phone
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

	/**
	 * 分页信息页数
	 * @param account
	 * @param username
	 * @param zy
	 * @param lasttime
	 * @param nowtime
	 * @return
	 */
	public int fenyecount1(@Param("account") String account,@Param("username") String username,@Param("zy") String zy, @Param("lasttime") String lasttime, @Param("nowtime") String nowtime);


	/**
	 * 分页查询
	 * @param account
	 * @param username
	 * @param zy
	 * @param lasttime
	 * @param nowtime
	 * @param rowBounds
	 * @return
	 */
	public List<Alluserinfo> fenyeshuju1(@Param("account") String account,@Param("username") String username,@Param("zy") String zy, @Param("lasttime") String lasttime, @Param("nowtime") String nowtime, RowBounds rowBounds);

	/**
	 * 查找省
	 * @return
	 */
	public List<P1> findpro();

	/**
	 * 查找城市
	 * @param prid
	 * @return
	 */
	public List<C1> findcity(@Param("prid") String prid);
}
