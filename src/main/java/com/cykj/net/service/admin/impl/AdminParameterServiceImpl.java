package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Parameter;
import com.cykj.net.mapper.admin.AdminParameterMapper;
import com.cykj.net.service.admin.AdminParameterService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminParameterService")
public class AdminParameterServiceImpl implements AdminParameterService {

    @Autowired
    private AdminParameterMapper adminParameterMapper;


    @Override
    public LayuiData parameter(String name, String type, int page, int limit) {
        LayuiData layuiData = new LayuiData();
        if (null == name || "".equals(name)) {
            name = null;
        }
        if (null == type || "".equals(type)) {
            type = null;
        }
        layuiData.setCount(adminParameterMapper.countParameter(name, type));
        page = (page - 1) * limit;
        List<Parameter> list = adminParameterMapper.findAllParameter(name, type, page, limit);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setId(page + i + 1);
        }
        layuiData.setData(list);
        return layuiData;
    }

    @Override
    public String getParameter() {
        List<Parameter> parameters = adminParameterMapper.getParameter();
        return new Gson().toJson(parameters);
    }

    @Override
    public String addParameter(Parameter parameter) {
        String result = "false";
        if (adminParameterMapper.findParameter(parameter) > 0) {
            result = "haveParameter";
        } else {
            if (adminParameterMapper.addParameter(parameter) > 0) {
                result = "true";
            }
        }

        return result;
    }

    @Override
    public String updateParameter(Parameter parameter) {
        String result = "false";
        if (parameter.getType().equals(parameter.getUpType()) && parameter.getName().equals(parameter.getUpName())) {
            if (adminParameterMapper.updateParameter(parameter) > 0) {
                result = "true";
            }
        } else {
            if (adminParameterMapper.findParameter(parameter) > 0) {
                result = "haveParameter";
            } else {
                if (adminParameterMapper.updateParameter(parameter) > 0) {
                    result = "true";
                }
            }
        }
        return result;
    }
}
