package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.Adjournal;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.mapper.admin.AdminJournalMapper;
import com.cykj.net.service.admin.AdminJournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminJournalService")
public class AdminJournalServiceImpl implements AdminJournalService {

    @Autowired
    private AdminJournalMapper adminJournalMapper;

    @Override
    public void addJournal(Adjournal adjournal) {
        adminJournalMapper.addJournal(adjournal);
    }

    @Override
    public LayuiData journal(String account, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == account || "".equals(account)) {
            account = null;
        }
        page = (page - 1) * limit;
        layuiData.setCount(adminJournalMapper.countJournal(account));
        List<Adjournal> list = adminJournalMapper.allJournal(account, page, limit);

        layuiData.setData(list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setJoid(page + 1 + i);
        }
        layuiData.setData(list);
        return layuiData;
    }
}
