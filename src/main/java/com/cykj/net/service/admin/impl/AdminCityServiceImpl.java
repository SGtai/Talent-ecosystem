package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.City;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.mapper.admin.AdminCityMapper;
import com.cykj.net.service.admin.AdminCityService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminCityService")
public class AdminCityServiceImpl implements AdminCityService {


    @Autowired
    private AdminCityMapper adminCityMapper;


    @Override
    public LayuiData city(String prid, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == prid || "".equals(prid)) {
            prid = null;
        }
        page = (page - 1) * limit;
        layuiData.setCount(adminCityMapper.countCity(prid, page, limit));
        List<City> list = adminCityMapper.findCityList(prid, page, limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
        }
        layuiData.setData(list);

        return layuiData;
    }

    @Override
    public String findAllProvince() {

        return new Gson().toJson(adminCityMapper.findAllProvince());
    }

    @Override
    public String addCity(City city) {
        String result = "false";
        if (adminCityMapper.findCity(city) > 0) {
            result = "haveCity";
        } else {
            if (adminCityMapper.addCity(city) > 0) {
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String updateCity(City city) {
        String result = "false";
        if (adminCityMapper.findCity(city) > 0) {
            result = "haveCity";
        } else {
            if (adminCityMapper.updateCity(city) > 0) {
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String deleteCity(City city) {
        String result = "false";
        if (adminCityMapper.deleteCity(city) > 0) {
            result = "true";
        }

        return result;
    }

    @Override
    public LayuiData province(int page, int limit) {
        LayuiData layuiData = new LayuiData();
        page = (page - 1) * limit;

        layuiData.setCount(adminCityMapper.findAllProvince().size());
        List<City> list = adminCityMapper.findProvinceList(page, limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + i + 1);
        }
        layuiData.setData(list);

        return layuiData;
    }

    @Override
    public String addProvince(City city) {
        String result = "false";
        System.out.println(city.getPrname());
        if (adminCityMapper.findProvince(city) > 0) {
            result = "haveProvince";
        } else {
            if (adminCityMapper.addProvince(city) > 0) {
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String updateProvince(City city) {
        String result = "false";
        if (adminCityMapper.findProvince(city) > 0) {
            result = "haveProvince";
        } else {
            if (adminCityMapper.updateProvince(city) > 0) {
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String deleteProvince(City city) {
        String result = "false";
        if (adminCityMapper.findCitys(city) > 0) {
            result = "haveCity";
        } else {
            if (adminCityMapper.deleteProvince(city) > 0) {
                result = "true";
            }
        }

        return result;
    }
}
