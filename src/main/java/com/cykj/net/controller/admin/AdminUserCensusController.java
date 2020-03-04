package com.cykj.net.controller.admin;


import com.cykj.net.service.admin.AdminCensusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;

@Controller
@RequestMapping("/adminCensus")
public class AdminUserCensusController {

    @Autowired
    private AdminCensusService adminUserCensusService;

    @PostMapping(value = "/week")
    public @ResponseBody
    String week(int role) {
        return adminUserCensusService.week(role);
    }


    @PostMapping(value = "/month")
    public @ResponseBody
    String month(String date,int role) {
        return adminUserCensusService.month(date,role);
    }


    @PostMapping(value = "/half")
    public @ResponseBody
    String half(int role) throws ParseException {
        return adminUserCensusService.half(role);
    }
}
