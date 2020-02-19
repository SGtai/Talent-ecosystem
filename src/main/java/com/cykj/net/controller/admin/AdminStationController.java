package com.cykj.net.controller.admin;

import com.cykj.net.javabean.AdminPositionStation;
import com.cykj.net.service.admin.AdminPositionStationService;
import com.cykj.net.util.LayuiData;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/adminStation")
public class AdminStationController {

    @Autowired
    private AdminPositionStationService adminPositionStationService;

    /**
     * 岗位查询
     *
     * @param poid
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "/table/station")
    public @ResponseBody
    LayuiData station(String poid, int limit, int page) {
        LayuiData layuiData = new LayuiData();
        System.out.println(poid+"====");
        if (null == poid || "".equals(poid)){poid = null;}

        page = (page - 1) * limit;
        layuiData.setCount(adminPositionStationService.countStation(poid,page,limit));
        List<AdminPositionStation> list = adminPositionStationService.findStation(poid,page,limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page+1+i);
        }
        layuiData.setData(list);

        return layuiData;
    }

    /**
     * 行业回显
     * @return
     */
    @PostMapping(value = "/choosePosition")
    public @ResponseBody
    String choosePosition() {
        return new Gson().toJson(adminPositionStationService.findPositionList());
    }

    @PostMapping(value = "/delete")
    public @ResponseBody
    String delete(AdminPositionStation aps) {
        System.out.println(aps.getPoid());
        System.out.println(aps.getStation());
        return "false";
    }

}
