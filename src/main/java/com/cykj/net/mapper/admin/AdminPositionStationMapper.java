package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.AdminPositionStation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminPositionStationMapper {

    @Select("select poid id,type position from position")
    List<AdminPositionStation> findPositionList();

}
