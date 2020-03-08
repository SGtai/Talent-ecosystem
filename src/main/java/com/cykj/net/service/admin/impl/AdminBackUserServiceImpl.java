package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.mapper.admin.AdminBackUserMapper;
import com.cykj.net.mapper.admin.AdminParameterMapper;
import com.cykj.net.service.admin.AdminBackUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminBackUserService")
public class AdminBackUserServiceImpl implements AdminBackUserService {


    @Autowired
    private AdminBackUserMapper adminBackUserMapper;
    @Autowired
    private AdminParameterMapper adminParameterMapper;

    @Override
    public List<Admin> findAllAdmin(String account, String name, int limit, int page, int roid) {
        return adminBackUserMapper.findAllAdmin(account,name,limit,page,roid);
    }

    @Override
    public int countAllAdmin(String account, String name, int roid) {
        return adminBackUserMapper.countAllAdmin(account,name,roid);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminBackUserMapper.updateAdmin(admin);
    }

    @Override
    public String findPassword(int i) {
        return adminParameterMapper.findPassword(i);
    }
}
