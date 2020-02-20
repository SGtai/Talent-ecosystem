package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.admin.AdminPositionStation;
import com.cykj.net.mapper.admin.AdminPositionStationMapper;
import com.cykj.net.service.admin.AdminPositionStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminPositionStationService")
public class AdminPositionStationServiceImpl implements AdminPositionStationService {

    @Autowired
    private AdminPositionStationMapper adminPositionStationMapper;

    @Override
    public List<AdminPositionStation> findPositionList() {
        return adminPositionStationMapper.findPositionList();
    }

    @Override
    public int countStation(String poid, int page, int limit) {
        return adminPositionStationMapper.countStation(poid,page,limit);
    }

    @Override
    public List<AdminPositionStation> findStation(String poid, int page, int limit) {
        return adminPositionStationMapper.findStation(poid,page,limit);
    }

    @Override
    public int deleteStation(AdminPositionStation aps) {
        return adminPositionStationMapper.deleteStation(aps);
    }

    @Override
    public int updateStation(AdminPositionStation aps) {
        return adminPositionStationMapper.updateStation(aps);
    }

    @Override
    public int findStationName(AdminPositionStation aps) {
        return adminPositionStationMapper.findStationName(aps);
    }

    @Override
    public int addStation(AdminPositionStation aps) {
        return adminPositionStationMapper.addStation(aps);
    }

    @Override
    public int countPosition() {
        return adminPositionStationMapper.countPosition();
    }

    @Override
    public List<AdminPositionStation> findAllPosition(int page, int limit) {
        return adminPositionStationMapper.findAllPosition(page,limit);
    }

    @Override
    public int findPosition(String position) {
        return adminPositionStationMapper.findPosition(position);
    }

    @Override
    public int addPosition(String position) {
        return adminPositionStationMapper.addPosition(position);
    }

    @Override
    public int deletePosition(String position) {
        return adminPositionStationMapper.deletePosition(position);
    }

    @Override
    public int updatePosition(AdminPositionStation aps) {
        return adminPositionStationMapper.updatePosition(aps);
    }
}
