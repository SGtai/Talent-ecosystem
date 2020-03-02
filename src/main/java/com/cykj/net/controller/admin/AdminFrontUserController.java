package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.admin.AdminFrontUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminFrontUser")
public class AdminFrontUserController {


    @Autowired
    private AdminFrontUserService adminFrontUserService;
    @Log(type = "查询操作",event = "查询前台用户")
    @RequestMapping(value = "/table/frontUser")
    public @ResponseBody
    LayuiData frontUserLog(String phone, String name, int limit, int page) {

        return adminFrontUserService.frontUser(phone,name,limit,page);
    }

    @Log(type = "修改操作",event = "修改前台用户状态")
    @RequestMapping(value = "/updateState")
    @ResponseBody
    public String updateStateLog(String phone ,String state){
        return adminFrontUserService.updateState(phone,state);
    }

    @Log(type = "修改操作",event = "修改前台用户密码")
    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePasswordLog(String phone){
        return adminFrontUserService.updatePassword(phone);
    }


}
