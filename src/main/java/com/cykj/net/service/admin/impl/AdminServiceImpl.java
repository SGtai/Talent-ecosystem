package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.Admin;
import com.cykj.net.javabean.AdminMenu;
import com.cykj.net.mapper.AdminMapper;
import com.cykj.net.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin findAdmin(String account) {
        return adminMapper.findAdmin(account);
    }

    @Override
    public int findRoid(String account) {
        return adminMapper.findRoid(account);
    }

    @Override
    public List<AdminMenu> findRoleMenus(int roid) {
        return adminMapper.findRoleMenus(roid);
    }
}
