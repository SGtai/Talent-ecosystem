package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.admin.ZtreeMenu;
import com.cykj.net.service.admin.AdminMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/adminMenu")
public class AdminMenuController {

    @Autowired
    private AdminMenuService adminMenuService;


    @RequestMapping(value = "/initMenuChange")
    @Log(type = "查询操作", event = "查询菜单权限")
    @ResponseBody
    public List<ZtreeMenu> initMenuChange(int rid){
        return adminMenuService.initMenuChange(rid);
    }


    @RequestMapping(value = "/changeMenu")
    @Log(type = "修改操作", event = "修改菜单权限")
    @ResponseBody
    public int changeMenu(int rid, String checkList){
        return adminMenuService.changeMenu(rid,checkList);
    }

}
