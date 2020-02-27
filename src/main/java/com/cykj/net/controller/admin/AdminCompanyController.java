package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.admin.AdminComanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/adminCompany")
public class AdminCompanyController {


    @Autowired
    private AdminComanyService adminComanyService;

    /**
     * 公司表格
     * @param qyName
     * @param qyType
     * @param prid
     * @param ctid
     * @param state
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/table/company")
    @ResponseBody
    public LayuiData company(String qyName,String qyType,String prid,String ctid,String state,String qyState,int page,int limit){

        return adminComanyService.company(qyName,qyType,prid,ctid,state,qyState,page,limit);
    }

    @RequestMapping(value = "/getProvince")
    @ResponseBody
    public String getProvince(){
        return adminComanyService.getProvince();
    }

    @RequestMapping(value = "/getCity")
    @ResponseBody
    public String getCity(String prid){
        return adminComanyService.getCity(prid);
    }


    @RequestMapping(value = "/updateState")
    @Log(type = "修改操作",event = "修改企业状态")
    @ResponseBody
    public String updateStateLog(String qyAccount ,String state){
        return adminComanyService.updateState(qyAccount,state);
    }

    @Log(type = "修改操作",event = "修改企业密码")
    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePasswordLog(String qyAccount){
        return adminComanyService.updatePassword(qyAccount);
    }


    @Log(type = "审核操作",event = "审核企业")
    @RequestMapping(value = "/updateQyState")
    @ResponseBody
    public String updateQyStateLog(String qyAccount ,String qyState,String name){
        return adminComanyService.updateQyState(qyAccount,qyState,name);
    }

}
