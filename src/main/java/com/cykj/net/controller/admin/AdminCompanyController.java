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

    @RequestMapping(value = "/table/company")
    @ResponseBody
    public LayuiData company(String qyName,String qyType,String ctid,String state,int page,int limit){
        return adminComanyService.company(qyName,qyType,ctid,state,page,limit);
    }



}
