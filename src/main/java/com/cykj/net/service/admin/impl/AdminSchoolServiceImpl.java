package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Msg;
import com.cykj.net.javabean.Schoolinfo;
import com.cykj.net.mapper.admin.AdminCompanyMapper;
import com.cykj.net.mapper.admin.AdminMsgMapper;
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
    @Autowired
    private AdminMsgMapper adminMsgMapper;

    @Override
    public LayuiData school(String scName, String type, String prid, String ctid, String state,String scState, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == scName || "".equals(scName)) { scName = null; }
        if (null == ctid || "".equals(ctid)) { ctid = null; }
        if (null == state || "".equals(state)) { state = null; }
        page = (page - 1) * limit;
        if (null == prid || "".equals(prid)) { prid = null; }
        if (null == type || "".equals(type)) { type = null; }
        if (null == scState || "".equals(scState)) { scState = null; }

        layuiData.setCount(adminSchoolMapper.countSchool(scName, type, prid, ctid, state,scState));
        List<Schoolinfo> list = adminSchoolMapper.allSchool(scName, type, prid, ctid, state,scState, page, limit);
        layuiData.setData(list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setPrid(adminCompanyMapper.findProvinceName(list.get(i).getPrid()));
            list.get(i).setId(page + 1 + i);
            list.get(i).setCtid(adminCompanyMapper.findCityName(list.get(i).getCtid()));
        }

        return layuiData;
    }

    @Override
    public String updateState(String scAccount, String state) {
        String result = "false";
        if (adminCompanyMapper.updateState(scAccount,state) > 0) {
            result = "true";
        }
        return result;
    }

    @Override
    public String updatePassword(String scAccount) {
        String result = "";
        String updatePassword = "123456";
        if (adminCompanyMapper.updatePassword(scAccount, updatePassword) > 0) {
            //参数表查询
            result = updatePassword;
        }
        return result;
    }

    @Override
    public String updateScState(String scAccount, String scState,String name) {
        String result = "false";
        if (adminCompanyMapper.updateScState(scAccount,scState) > 0){
            Msg msg = new Msg();
            msg.setEvent("欢迎"+name+"入驻本站");
            adminMsgMapper.addMsg(msg);
            result = "true";
        }
        return result;
    }
}
