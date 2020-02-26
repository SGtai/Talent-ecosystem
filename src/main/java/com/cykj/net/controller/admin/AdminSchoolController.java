package com.cykj.net.controller.admin;


import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.admin.AdminSchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminSchool")
public class AdminSchoolController {

    @Autowired
    private AdminSchoolService adminSchoolService;

    @RequestMapping(value = "/table/school")
    @ResponseBody
    public LayuiData school(String scName, String type, String prid, String ctid, String state,String scState, int page, int limit){
        return adminSchoolService.school(scName,type,prid,ctid,state,scState,page,limit);
    }

    @RequestMapping(value = "/updateState")
    @ResponseBody
    public String updateState(String account ,String state){
        return adminSchoolService.updateState(account,state);
    }

    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePassword(String account){
        return adminSchoolService.updatePassword(account);
    }


    @RequestMapping(value = "/updateScState")
    @ResponseBody
    public String updateScState(String scAccount ,String scState){
        return adminSchoolService.updateScState(scAccount,scState);
    }


}
