package com.cykj.net.service.admin;

import com.cykj.net.javabean.admin.Admin;

import java.util.List;

public interface AdminBackUserService {
    List<Admin> findAllAdmin(String account,String name,int limit,int page,int roid);
    int countAllAdmin(String account,String name,int roid);
    int updateAdmin(Admin admin);
}
