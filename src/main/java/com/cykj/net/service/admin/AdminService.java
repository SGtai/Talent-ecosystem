package com.cykj.net.service.admin;

import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.javabean.admin.AdminMenu;

import java.util.List;

public interface AdminService {
    Admin findAdmin(String account);
    int findRoid(String account);
    List<AdminMenu> findRoleMenus(int roid);
    int regAdmin(Admin admin);
    int changeAdminPassword(Admin admin);
}
