package com.cykj.net.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminMenu")
public class AdminMenuController {





    @RequestMapping(value = "/initMenuChange")
    @ResponseBody
    public String initMenuChange(){

        return "";
    }




}
