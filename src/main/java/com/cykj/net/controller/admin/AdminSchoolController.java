package com.cykj.net.controller.admin;


import com.cykj.net.aop.Log;
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

    @Log(type = "查询操作",event = "查询高校")
    @RequestMapping(value = "/table/school")
    @ResponseBody
    public LayuiData schoolLog(String scName, String type, String prid, String ctid, String state,String scState, int page, int limit){
        return adminSchoolService.school(scName,type,prid,ctid,state,scState,page,limit);
    }

    @Log(type = "修改操作",event = "修改高校状态")
    @RequestMapping(value = "/updateState")
    @ResponseBody
    public String updateStateLog(String account ,String state){
        return adminSchoolService.updateState(account,state);
    }

    @Log(type = "修改操作",event = "修改高校密码")
    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePasswordLog(String account){
        return adminSchoolService.updatePassword(account);
    }

    @Log(type = "审核操作",event = "审核高校")
    @RequestMapping(value = "/updateScState")
    @ResponseBody
    public String updateScStateLog(String scAccount ,String scState,String name){
        return adminSchoolService.updateScState(scAccount,scState,name);
    }


}
