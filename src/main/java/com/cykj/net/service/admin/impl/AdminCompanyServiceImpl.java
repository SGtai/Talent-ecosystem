package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.*;
import com.cykj.net.mapper.admin.AdminCompanyMapper;
import com.cykj.net.mapper.admin.AdminMsgMapper;
import com.cykj.net.mapper.admin.AdminParameterMapper;
import com.cykj.net.service.admin.AdminComanyService;
import com.cykj.net.util.MD5;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Service("adminCompanyService")
public class AdminCompanyServiceImpl implements AdminComanyService {

    @Autowired
    private AdminCompanyMapper adminCompanyMapper;
    @Autowired
    AdminMsgMapper adminMsgMapper;
    @Autowired
    private AdminParameterMapper adminParameterMapper;

    @Override
    public LayuiData company(String qyName, String qyType, String prid, String ctid, String state, String qyState, int page, int limit) {

        LayuiData layuiData = new LayuiData();
        if (null == qyName || "".equals(qyName)) {
            qyName = null;
        }
        if (null == qyType || "".equals(qyType)) {
            qyType = null;
        }
        if (null == qyState || "".equals(qyState)) {
            qyState = null;
        }
        if (null == prid || "".equals(prid)) {
            prid = null;
        }

        if (null == ctid || "".equals(ctid)) {
            ctid = null;
        }

        if (null == state || "".equals(state)) {
            state = null;
        }
        page = (page - 1) * limit;
        layuiData.setCount(adminCompanyMapper.countCompany(qyName, qyType, prid, ctid, state, qyState));
        List<Qyinfo> list = adminCompanyMapper.allCompany(qyName, qyType, prid, ctid, state, qyState, page, limit);

        layuiData.setData(list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + 1 + i);
            list.get(i).setCtid(adminCompanyMapper.findCityName(list.get(i).getCtid()));
            list.get(i).setPrid(adminCompanyMapper.findProvinceName(list.get(i).getPrid()));
        }


        return layuiData;
    }

    @Override
    public String getProvince() {
        List<Province> provinces = adminCompanyMapper.getProvinces();
        return new Gson().toJson(provinces);
    }

    @Override
    public String getCity(String prid) {
        List<City> cities = adminCompanyMapper.getCitys(prid);
        for (int i = 0; i < cities.size(); i++) {
            System.out.println(cities.get(i).getCtname());
        }
        return new Gson().toJson(cities);
    }

    @Override
    public String updateState(String qyAccount, String state) {
        String result = "false";
        if (adminCompanyMapper.updateState(qyAccount, state) > 0) {
            result = "true";
        }
        return result;
    }

    @Override
    public String updatePassword(String qyAccount) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String result = "";
        String updatePassword = adminParameterMapper.findPassword(1);
        if (adminCompanyMapper.updatePassword(qyAccount, MD5.EncoderByMd5(updatePassword)) > 0 && adminCompanyMapper.updateCompanyPassword(qyAccount,MD5.EncoderByMd5(updatePassword)) > 0) {

            //参数表查询
            result = updatePassword;
        }
        return result;
    }

    @Override
    public String updateQyState(String qyAccount, String qyState,String name) {
        String result = "false";
        if (adminCompanyMapper.updateQyState(qyAccount,qyState) > 0){
            Msg msg = new Msg();
            msg.setEvent("欢迎"+name+"入驻本站");
            adminMsgMapper.addMsg(msg);
            result = "true";
        }
        return result;
    }


}
