package com.cykj.net.service.admin;

import com.cykj.net.javabean.admin.AdminPositionStation;

import java.util.List;

public interface AdminPositionStationService {
    List<AdminPositionStation> findPositionList();
    int countStation(String poid,int page,int limit);
    List<AdminPositionStation> findStation(String poid,int page,int limit);
    int deleteStation(AdminPositionStation aps);
    int updateStation(AdminPositionStation aps);
    int findStationName(AdminPositionStation aps);
    int addStation(AdminPositionStation aps);
    int findJobStid(String stid);
    int countPosition();
    List<AdminPositionStation> findAllPosition(int page,int limit);
    int findPosition(String position);
    int addPosition(String position);
    int deletePosition(String position);
    int updatePosition(AdminPositionStation aps);
    int findPositionHaveStationCount(int poid);
}
