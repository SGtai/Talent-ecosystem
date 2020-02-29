package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Userlist;
import com.cykj.net.mapper.admin.AdminFrontUserMapper;
import com.cykj.net.mapper.admin.AdminParameterMapper;
import com.cykj.net.service.admin.AdminFrontUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminFrontUserService")
public class AdminFrontUserServiceImpl implements AdminFrontUserService {

    @Autowired
    private AdminFrontUserMapper adminFrontUserMapper;
    @Autowired
    private AdminParameterMapper adminParameterMapper;

    @Override
    public LayuiData frontUser(String phone, String name, int limit, int page) {
        LayuiData layuiData = new LayuiData();
        page = (page - 1) * limit;
        if (null == phone || "".equals(phone)) { phone = null; }
        if (null == name || "".equals(name)) { name = null; }

        layuiData.setCount(adminFrontUserMapper.countFrontUser(phone,name));
        List<Userlist> list = adminFrontUserMapper.findAllFrontUser(phone,name,page,limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setYhid(page + 1 + i);
        }
        layuiData.setData(list);
        return layuiData;
    }

    @Override
    public String updateState(String phone, String state) {
        String result = "false";
        if (adminFrontUserMapper.updateState(phone, state) > 0) {
            result = "true";
        }
        return result;
    }

    @Override
    public String updatePassword(String phone) {
        String result = "";
        String updatePassword = adminParameterMapper.findPassword(1);
        if (adminFrontUserMapper.updatePassword(phone, updatePassword) > 0) {
            //参数表查询
            result = updatePassword;
        }
        return result;
    }
}
