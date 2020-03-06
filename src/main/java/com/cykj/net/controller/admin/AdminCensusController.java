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
public class AdminCensusController {

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


    /**
     * yukai
     * @param role
     * @param tjr
     * @return
     */
    @PostMapping(value = "/week1")
    public @ResponseBody
    String week1(int role,String tjr) {
        return adminUserCensusService.week1(role,tjr);
    }


    @PostMapping(value = "/month1")
    public @ResponseBody
    String month1(String date,int role,String tjr) {
        return adminUserCensusService.month1(date,role,tjr);
    }


    @PostMapping(value = "/half1")
    public @ResponseBody
    String half1(int role,String tjr) throws ParseException {
        return adminUserCensusService.half1(role,tjr);
    }

    @PostMapping(value = "/week2")
    public @ResponseBody
    String week2(int role,String tjr) {
        return adminUserCensusService.week2(role,tjr);
    }


    @PostMapping(value = "/month2")
    public @ResponseBody
    String month2(String date,int role,String tjr) {
        return adminUserCensusService.month2(date,role,tjr);
    }


    @PostMapping(value = "/half2")
    public @ResponseBody
    String half2(int role,String tjr) throws ParseException {
        return adminUserCensusService.half2(role,tjr);
    }
}
