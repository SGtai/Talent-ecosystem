package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Parameter;
import com.cykj.net.service.admin.AdminParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminParameter")
public class AdminParameterController {

    @Autowired
    private AdminParameterService adminParameterService;

    @Log(type = "查询操作",event = "查询参数")
    @RequestMapping(value = "/table/parameter")
    @ResponseBody
    public LayuiData parameterLog( int page,String name,String type, int limit){
        return adminParameterService.parameter(name,type,page,limit);
    }

    @RequestMapping(value = "/getParameter")
    @ResponseBody
    public String getParameter(){
        return adminParameterService.getParameter();
    }


    @PostMapping(value = "/addParameter")
    @Log(type = "添加操作",event = "添加参数")
    public @ResponseBody
    String addParameter(Parameter parameter) {
        return adminParameterService.addParameter(parameter);
    }

    @PostMapping(value = "/updateParameter")
    @Log(type = "修改操作",event = "修改参数")
    public @ResponseBody
    String updateParameter(Parameter parameter) {
        return adminParameterService.updateParameter(parameter);
    }

}
