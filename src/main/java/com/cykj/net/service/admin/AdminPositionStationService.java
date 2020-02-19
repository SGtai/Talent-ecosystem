package com.cykj.net.service.admin;

import com.cykj.net.javabean.AdminPositionStation;

import java.util.List;

public interface AdminPositionStationService {
    List<AdminPositionStation> findPositionList();
    int countStation(String poid,int page,int limit);
    List<AdminPositionStation> findStation(String poid,int page,int limit);
}
