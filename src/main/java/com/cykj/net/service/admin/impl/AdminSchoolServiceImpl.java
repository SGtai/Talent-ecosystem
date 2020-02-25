package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.mapper.admin.AdminCompanyMapper;
import com.cykj.net.mapper.admin.AdminSchoolMapper;
import com.cykj.net.service.admin.AdminSchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminSchoolService")
public class AdminSchoolServiceImpl implements AdminSchoolService {

    @Autowired
    private AdminSchoolMapper adminSchoolMapper;

    @Autowired
    private AdminCompanyMapper adminCompanyMapper;

    @Override
    public LayuiData school(String scName, String type, String prid, String ctid, String state, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == scName || "".equals(scName)) { scName = null; }
        if (null == ctid || "".equals(ctid)) { ctid = null; }
        if (null == state || "".equals(state)) { state = null; }
        page = (page - 1) * limit;
        if (null == prid || "".equals(prid)) { prid = null; }
        if (null == type || "".equals(type)) { type = null; }

        layuiData.setCount(adminSchoolMapper.countSchool(scName, type, prid, ctid, state));
        List<Schoolinfo> list = adminSchoolMapper.allSchool(scName, type, prid, ctid, state, page, limit);
        layuiData.setData(list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setPrid(adminCompanyMapper.findProvinceName(list.get(i).getPrid()));
            list.get(i).setId(page + 1 + i);
            list.get(i).setCtid(adminCompanyMapper.findCityName(list.get(i).getCtid()));
        }

        return layuiData;
    }

    @Override
    public String updateState(String qyAccount, String state) {
        return null;
    }

    @Override
    public String updatePassword(String qyAccount) {
        return null;
    }
}
