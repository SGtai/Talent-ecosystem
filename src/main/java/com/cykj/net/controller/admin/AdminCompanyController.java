package com.cykj.net.controller.admin;

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
    @ResponseBody
    public String updateState(String qyAccount ,String state){
        return adminComanyService.updateState(qyAccount,state);
    }

    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePassword(String qyAccount){
        return adminComanyService.updatePassword(qyAccount);
    }



    @RequestMapping(value = "/updateScState")
    @ResponseBody
    public String updateScState(String qyAccount ,String qyState){
        return adminComanyService.updateQyState(qyAccount,qyState);
    }

}
