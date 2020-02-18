package com.cykj.net.controller.admin;

import com.cykj.net.service.admin.AdminPositionStationService;
import com.cykj.net.util.LayuiData;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/adminStation")
public class AdminStationController {

    @Autowired
    private AdminPositionStationService adminPositionStationService;

    /**
     * 岗位查询
     *
     * @param station
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "/table/station")
    public @ResponseBody
    LayuiData station(String station, int limit, int page) {
        LayuiData layuiData = new LayuiData();


        return layuiData;
    }

    @PostMapping(value = "/choosePosition")
    public @ResponseBody
    String choosePosition() {
        return new Gson().toJson(adminPositionStationService.findPositionList());
    }


}
