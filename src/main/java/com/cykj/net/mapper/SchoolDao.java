package com.cykj.net.mapper;

import com.cykj.net.javabean.*;
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
	public S1 findSchoolinfo(@Param("account") String scAccount);

	/**
	 * 查相同手机号
	 * @param daima
	 * @return
	 */
	public S1 finddaima(@Param("daima") String daima);

	/**
	 * 查相同社会信用代码
	 * @param phone
	 * @return
	 */
	public S1 findphone(@Param("phone") String phone);
	/**
	 * 插入学校信息
	 * @param schoolinfo
	 * @return
	 */
	public int inserSchoolinfo(S1 schoolinfo);

	/**
	 * 修改学校信息
	 * @param schoolinfo
	 * @return
	 */
	public int updateSchoolinfo(S1 schoolinfo);

	/**
	 * 查看人才信息
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
	 * 查看人才信息
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
	 * 查找教育经历
	 * @param account
	 * @return
	 */
	public List<Experience> findexperience(@Param("phone") String phone);
	/**
	 * 查找工作经历
	 * @param account
	 * @return
	 */
	public List<Undergo> findegzjl(@Param("phone") String phone);
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

	/**
	 * 插入用户信息
	 * @param userlist
	 * @return
	 */
	public int inseruserinfo(Userlist userlist);

	/**
	 * 插入简历表
	 * @param resume
	 * @return
	 */
	public int inserjl(Resume resume);

	/**
	 * 插入工作经历表
	 * @param undergo
	 * @return
	 */
	public int insergz(Undergo undergo);

	/**
	 * 插入学习经历表
	 * @param experience
	 * @return
	 */
	public int inserxx(Experience experience);


	/**
	 * 插入就职意向表
	 * @param jobintension
	 * @return
	 */
	public int inserjobint(Jobintension jobintension);

	/**
	 * 查找用户表
	 * @param phone
	 * @return
	 */
	public Userlist finduser(@Param("phone") String phone);

	/**
	 * 查找简历表
	 * @param yhId
	 * @return
	 */
	public Resume findjl(@Param("yhId") Long yhId);
	/**
	 * 修改用户信息
	 * @param alluserinfo
	 * @return
	 */
	public int updateuser(Alluserinfo alluserinfo);

	/**
	 * 修改简历表1
	 * @param alluserinfo
	 * @return
	 */
	public int upadtejl1(Alluserinfo alluserinfo);

	/**
	 * 分页查询发布信息
	 * @param postion
	 * @param type
	 * @return
	 */
	public int fenyecount2(@Param("postion") String postion,@Param("type") String type);

	/**
	 * 查询发布信息
	 * @param postion
	 * @param type
	 * @param rowBounds
	 * @return
	 */
	public List<J1> fenyeshuju2(@Param("postion") String postion, @Param("type") String type, RowBounds rowBounds);

	/**
	 * 查询招聘信息
	 * @param zpxxid
	 * @return
	 */
	public Jobinfo findjobinfo(@Param("zpxxid") Long zpxxid);

	/**
	 * 查询简历是否交了
	 * @param zpxxid
	 * @param jlid
	 * @return
	 */
	public Query findjljl(@Param("jlid") Long jlid,@Param("zpxxid") Long zpxxid);

	/**
	 * 插入query
	 * @param query
	 * @return
	 */
	public int inserquery(Query query);

	/**
	 * 推荐简历记录
	 * @param tjjl
	 * @return
	 */
	public int insertjjl(Tjjl tjjl);
}
