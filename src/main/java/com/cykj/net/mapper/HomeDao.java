package com.cykj.net.mapper;

import com.cykj.net.javabean.Advert;
import com.cykj.net.javabean.City;
import com.cykj.net.javabean.JobInfoIndex;
import com.cykj.net.javabean.Position;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface HomeDao
{
	public List<JobInfoIndex> getTenHCom();
	public List<JobInfoIndex> compAndJob();
	public List<Advert> advertTen();
	public List<JobInfoIndex> searchJob(RowBounds rowBounds,JobInfoIndex tijiao);
	public int searchJobCount(JobInfoIndex tijiao);
	//本月新增岗位/岗位总数/用户总数/求职成功人数/高校人数
	public int gangweiNew();
	public int gangweicount();
	public int usercount();
	public int qiuzhiSuccess();
	public int gaoxiaocount();

	//岗位类型/省/市
	public List<Position> position();
	public List<City> province();
	public List<City> city(int prid);


}
