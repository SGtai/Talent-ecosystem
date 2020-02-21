package com.cykj.net.controller.admin;

import com.cykj.net.javabean.admin.AdminPositionStation;
import com.cykj.net.service.admin.AdminPositionStationService;
import com.cykj.net.javabean.LayuiData;
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
     * 岗位表格
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
        if (null == poid || "".equals(poid)) {
            poid = null;
        }

        page = (page - 1) * limit;
        layuiData.setCount(adminPositionStationService.countStation(poid, page, limit));
        List<AdminPositionStation> list = adminPositionStationService.findStation(poid, page, limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
        }
        layuiData.setData(list);

        return layuiData;
    }

    /**
     * 行业回显
     *
     * @return
     */
    @PostMapping(value = "/choosePosition")
    public @ResponseBody
    String choosePosition() {
        return new Gson().toJson(adminPositionStationService.findPositionList());
    }

    /**
     * 删除岗位
     *
     * @param aps
     * @return
     */
    @PostMapping(value = "/deleteStation")
    public @ResponseBody
    String deleteStation(AdminPositionStation aps) {
        if (adminPositionStationService.deleteStation(aps) > 0) {
            return "true";
        }
        return "false";
    }

    /**
     * 更新岗位
     * @param aps
     * @return
     */
    @PostMapping(value = "/updateStation")
    public @ResponseBody
    String updateStation(AdminPositionStation aps) {
        if (adminPositionStationService.findStationName(aps) > 0) {
            return "haveStation";
        }
        if (adminPositionStationService.updateStation(aps) > 0) {
            return "true";
        }
        return "false";
    }

    /**
     * 添加岗位
     * @param aps
     * @return
     */
    @PostMapping(value = "/addStation")
    public @ResponseBody
    String addStation(AdminPositionStation aps) {
        if (adminPositionStationService.findStationName(aps) > 0) {
            return "haveStation";
        }
        if (adminPositionStationService.addStation(aps) > 0) {
            return "true";
        }
        return "false";
    }

    /**
     * 行业表格
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "/table/position")
    public @ResponseBody
    LayuiData position(int limit, int page) {
        LayuiData layuiData = new LayuiData();
        page = (page - 1) * limit;
        layuiData.setCount(adminPositionStationService.countPosition());
        List<AdminPositionStation> list =adminPositionStationService.findAllPosition(page,limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
        }
        layuiData.setData(list);
        return layuiData;
    }

    /**
     * 添加行业
     * @param position
     * @return
     */
    @PostMapping(value = "/addPosition")
    public @ResponseBody String addPosition(String position){
        //查询是否存在改行业
        if (adminPositionStationService.findPosition(position) > 0){
            return "havePosition";
        }
        //添加
        if (adminPositionStationService.addPosition(position) > 0){
            return "true";
        }

        return "false";
    }

    /**
     * 删除行业
     * @param position
     * @return
     */
    @PostMapping(value = "/deletePosition")
    public @ResponseBody
    String deletePosition(String position) {
        if (adminPositionStationService.deletePosition(position) > 0) {
            return "true";
        }
        return "false";
    }

    /**
     * 修改行业
     * @param aps
     * @return
     */
    @PostMapping(value = "/updatePosition")
    public @ResponseBody
    String updatePosition(AdminPositionStation aps) {
        System.out.println(aps.getInitPosition());
        System.out.println(aps.getPosition());
        if (adminPositionStationService.findPosition(aps.getPosition()) > 0) {
            return "havePosition";
        }
        if (adminPositionStationService.updatePosition(aps) > 0) {
            return "true";
        }
        return "false";
    }

}
