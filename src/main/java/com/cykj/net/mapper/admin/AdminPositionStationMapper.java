package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.admin.AdminPositionStation;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AdminPositionStationMapper {

    /**
     * 查询所有的行业
     * @return
     */
    @Select("select poid id,type position from position where state = 0 ")
    List<AdminPositionStation> findPositionList();

    /**
     * 根据行业条件查询岗位
     * @param poid
     * @param page
     * @param limit
     * @return
     */
    @Select("<script>" +
            " select station.stid stid,position.type position,station.postion station,station.poid poid from station,position" +
            " where station.poid=position.poid and station.state = 0 and position.state = 0 " +
            "<if test = 'poid != null'> " +
            " and station.poid = #{poid} </if> " +
            " limit #{page},#{limit}" +
            "</script>")
    List<AdminPositionStation> findStation(@Param("poid")String poid, @Param("page")int page, @Param("limit")int limit);


    /**
     * 根据行业条件查询岗位总数量
     * @param poid
     * @param page
     * @param limit
     * @return
     */
    @Select("<script>" +
            " select count(*) from station where 1=1 " +
            "<if test = 'poid != null'> " +
            " and poid = #{poid} </if> " +
            "</script>")
    int countStation(@Param("poid")String poid, @Param("page")int page, @Param("limit")int limit);

    /**
     * 删除岗位
     * @param aps
     * @return
     */
    @Delete("delete from station where postion = #{station} and poid = #{poid}")
    int deleteStation(AdminPositionStation aps);

    /**
     * 更新岗位信息
     * @param aps
     * @return
     */
    @Update("update station set poid = #{poid},postion = #{station} " +
            "where postion = #{initStation} and poid = #{id}")
    int updateStation(AdminPositionStation aps);

    /**
     * 岗位查找
     * @param aps
     * @return
     */
    @Select("select count(*) from station where postion = #{station} and poid = #{poid}")
    int findStationName(AdminPositionStation aps);

    /**
     * 添加岗位
     * @param aps
     * @return
     */
    @Insert("insert into station (poid,postion) values (#{poid},#{station})")
    int addStation(AdminPositionStation aps);

    @Select("select count(*) count from jobinfo where zwid = #{stid} ")
    int findJobStid(String stid);


    /**
     * 查询行业条数
     * @return
     */
    @Select("select count(*) from position where state = 0 ")
    int countPosition();

    /**
     * 根据条件查询行业
     * @param page
     * @param limit
     * @return
     */
    @Select("select poid,type position from position limit #{page},#{limit}")
    List<AdminPositionStation> findAllPosition(@Param("page")int page,@Param("limit")int limit);

    /**
     * 查询有无这个行业
     * @param position
     * @return
     */
    @Select("select count(*) from position where type = #{position}")
    int findPosition(String position);

    /**
     * 添加行业
     * @param position
     * @return
     */
    @Insert("insert into position (type) values (#{position})")
    int addPosition(String position);

    /**
     * 删除行业
     * @param position
     * @return
     */
    @Delete("delete from position where type = #{position}")
    int deletePosition(String position);

    /**
     * 修改行业
     * @param aps
     * @return
     */
    @Update("update position set type = #{position} where type = #{initPosition}")
    int updatePosition(AdminPositionStation aps);

    /**
     * 查找行业下面有没有岗位
     * @param poid
     * @return
     */
    @Select("select count(*) count from station where poid = #{poid}")
    int findPositionHaveStationCount(int poid);
}
