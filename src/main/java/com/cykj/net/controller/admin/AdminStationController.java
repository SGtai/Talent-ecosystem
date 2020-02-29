package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
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
    @Log(type = "查询操作",event = "查询岗位")
    public @ResponseBody
    LayuiData stationLog(String poid, int limit, int page) {
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
    @Log(type = "删除操作", event = "删除岗位")
    public @ResponseBody
    String deleteStationLog(AdminPositionStation aps) {
        if (adminPositionStationService.findJobStid(aps.getStid()) > 0) {
            return "haveJob";
        } else {
            if (adminPositionStationService.deleteStation(aps) > 0) {
                return "true";
            }
        }
        return "false";
    }

    /**
     * 更新岗位
     *
     * @param aps
     * @return
     */
    @PostMapping(value = "/updateStation")
    @Log(type = "修改操作",event = "修改岗位名称")
    public @ResponseBody
    String updateStationLog(AdminPositionStation aps) {
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
     *
     * @param aps
     * @return
     */
    @PostMapping(value = "/addStation")
    @Log(type = "添加操作",event = "增加岗位")
    public @ResponseBody
    String addStationLog(AdminPositionStation aps) {
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
     *
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "/table/position")
    @Log(type = "查询操作",event = "查询行业")
    public @ResponseBody
    LayuiData positionLog(int limit, int page) {
        LayuiData layuiData = new LayuiData();
        page = (page - 1) * limit;
        layuiData.setCount(adminPositionStationService.countPosition());
        List<AdminPositionStation> list = adminPositionStationService.findAllPosition(page, limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
        }
        layuiData.setData(list);
        return layuiData;
    }

    /**
     * 添加行业
     *
     * @param position
     * @return
     */
    @PostMapping(value = "/addPosition")
    @Log(type = "添加操作",event = "添加行业")
    public @ResponseBody
    String addPositionLog(String position) {
        //查询是否存在改行业
        if (adminPositionStationService.findPosition(position) > 0) {
            return "havePosition";
        }
        //添加
        if (adminPositionStationService.addPosition(position) > 0) {
            return "true";
        }

        return "false";
    }

    /**
     * 删除行业
     *
     * @param position
     * @return
     */
    @PostMapping(value = "/deletePosition")
    @Log(type = "删除操作",event = "删除行业")
    public @ResponseBody
    String deletePositionLog(String position, int poid) {

        if (adminPositionStationService.findPositionHaveStationCount(poid) > 0) {
            return "haveStation";
        } else {
            if (adminPositionStationService.deletePosition(position) > 0) {
                return "true";
            }
        }

        return "false";
    }

    /**
     * 修改行业
     *
     * @param aps
     * @return
     */
    @PostMapping(value = "/updatePosition")
    @Log(type = "修改操作",event = "修改行业名称")
    public @ResponseBody
    String updatePositionLog(AdminPositionStation aps) {
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
