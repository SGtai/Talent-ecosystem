package com.cykj.net.controller.admin;

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

    @RequestMapping(value = "/table/frontUser")
    public @ResponseBody
    LayuiData frontUser(String phone, String name, int limit, int page) {

        return adminFrontUserService.frontUser(phone,name,limit,page);
    }

    @RequestMapping(value = "/updateState")
    @ResponseBody
    public String updateState(String phone ,String state){
        return adminFrontUserService.updateState(phone,state);
    }

    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePassword(String phone){
        return adminFrontUserService.updatePassword(phone);
    }


}
