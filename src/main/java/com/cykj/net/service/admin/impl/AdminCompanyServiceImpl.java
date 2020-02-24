package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Qyinfo;
import com.cykj.net.mapper.admin.AdminCompanyMapper;
import com.cykj.net.service.admin.AdminComanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminCompanyService")
public class AdminCompanyServiceImpl implements AdminComanyService {

    @Autowired
    private AdminCompanyMapper adminCompanyMapper;

    @Override
    public LayuiData company(String qyName, String qyType, String ctid,String state, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == qyName || "".equals(qyName)){qyName = null;}
        if (null == qyType || "".equals(qyType)){qyType = null;}
        if (null == state || "".equals(state)){state = null;}
        if (null == ctid || "".equals(ctid)){ctid = null;}
        page = (page - 1) * limit;
        layuiData.setCount(adminCompanyMapper.countCompany(qyName,qyType,ctid,state));
        List<Qyinfo> list = adminCompanyMapper.allCompany(qyName,qyType,ctid,state,page,limit);

        layuiData.setData(list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
            System.out.println(list.get(i).getCtid()+"*********");
            list.get(i).setCtid(adminCompanyMapper.findCityName(list.get(i).getCtid()));
        }


        return layuiData;
    }
}
