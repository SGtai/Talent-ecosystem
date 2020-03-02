package com.cykj.net.service.admin;

import com.cykj.net.javabean.City;
import com.cykj.net.javabean.LayuiData;

public interface AdminCityService {
    LayuiData city(String prid, int page, int limit);

    String findAllProvince();

    String addCity(City city);

    String updateCity(City city);

    String deleteCity(City city);

    LayuiData province(int page, int limit);

    String addProvince(City city);

    String updateProvince(City city);

    String deleteProvince(City city);
}
