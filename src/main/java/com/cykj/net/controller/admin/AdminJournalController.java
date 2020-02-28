package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.service.admin.AdminJournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/adminJournal")
public class AdminJournalController {

    @Autowired
    private AdminJournalService adminJournalService;

    @Log(type = "查询操作",event = "查询日志")
    @RequestMapping(value = "/table/journal")
    @ResponseBody
    public LayuiData journalLog(String account,String type, int page, int limit){
        return adminJournalService.journal(account,type,page,limit);
    }


    @RequestMapping(value = "/getJournal")
    @ResponseBody
    public String getJournal(){
        return adminJournalService.getJournal();
    }


}
