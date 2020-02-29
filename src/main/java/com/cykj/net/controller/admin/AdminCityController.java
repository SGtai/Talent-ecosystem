package com.cykj.net.controller.admin;


import com.cykj.net.aop.Log;
import com.cykj.net.javabean.City;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.admin.AdminCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminCity")
public class AdminCityController {

    @Autowired
    private AdminCityService adminCityService;

    @Log(type = "查询操作",event = "查询城市")
    @RequestMapping(value = "/table/city")
    @ResponseBody
    public LayuiData city(String prid, int page, int limit){
        return adminCityService.city(prid,page,limit);
    }


    @PostMapping(value = "/chooseProvince")
    public @ResponseBody
    String chooseProvince() {
        return adminCityService.findAllProvince();
    }

    @Log(type = "添加操作",event = "添加城市")
    @PostMapping(value = "/addCity")
    public @ResponseBody
    String addCity(City city) {
        return adminCityService.addCity(city);
    }

    @PostMapping(value = "/updateCity")
    @Log(type = "修改操作",event = "修改城市名称")
    public @ResponseBody
    String updateCity(City city) {

        return adminCityService.updateCity(city);
    }

    @PostMapping(value = "/deleteCity")
    @Log(type = "删除操作",event = "删除城市")
    public @ResponseBody
    String deleteCity(City city) {

        return adminCityService.deleteCity(city);
    }


    @Log(type = "查询操作",event = "查询省份")
    @RequestMapping(value = "/table/province")
    @ResponseBody
    public LayuiData province( int page, int limit){
        return adminCityService.province(page,limit);
    }



    @Log(type = "添加操作",event = "添加省份")
    @PostMapping(value = "/addProvince")
    public @ResponseBody
    String addProvince(City city) {
        return adminCityService.addProvince(city);
    }



    @PostMapping(value = "/updateProvince")
    @Log(type = "修改操作",event = "修改省份名称")
    public @ResponseBody
    String updateProvince(City city) {

        return adminCityService.updateProvince(city);
    }


    @PostMapping(value = "/deleteProvince")
    @Log(type = "删除操作",event = "删除省份")
    public @ResponseBody
    String deleteProvince(City city) {

        return adminCityService.deleteProvince(city);
    }
}
