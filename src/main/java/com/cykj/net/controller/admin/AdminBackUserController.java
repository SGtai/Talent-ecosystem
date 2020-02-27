package com.cykj.net.controller.admin;

import com.cykj.net.aop.Log;
import com.cykj.net.javabean.Adminrole;
import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.mapper.AdminDao;
import com.cykj.net.mapper.AdminRoleDao;
import com.cykj.net.service.admin.AdminBackUserService;
import com.cykj.net.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/adminBackUser")
public class AdminBackUserController {


    @Autowired
    private AdminBackUserService adminBackUserService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private AdminRoleDao adminRoleDao;
//    @Autowired
//    private BCryptPasswordEncoder bCryptPasswordEncoder;


    /**
     * 查询普通管理员
     *
     * @param account
     * @param name
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "/table/backUser")
    public @ResponseBody
    LayuiData backUser(String account, String name, int limit, int page) {
        LayuiData layuiData = new LayuiData();
        if (null == account || "".equals(account)) {
            account = null;
        }
        page = (page - 1) * limit;
        if (null == name || "".equals(name)) {
            name = null;
        }

        List<Admin> list = adminBackUserService.findAllAdmin(account, name, limit, page, 2);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setAdid(page + 1 + i);
            System.out.println(list.get(i).getRegistertime());
        }
        layuiData.setCount(adminBackUserService.countAllAdmin(account, name, 2));
        layuiData.setData(list);
        return layuiData;
    }

    /**
     * 更新管理员状态
     *
     * @param admin
     * @return
     */
    @RequestMapping(value = "/updateState")
    @Log(type = "修改操作",event = "修改后台管理员状态")
    public @ResponseBody
    String updateStateLog(Admin admin) {
        String msg = "";
        if (adminBackUserService.updateAdmin(admin) > 0) {
            msg = "true";
        }
        return msg;
    }

    @RequestMapping(value = "/updatePassword")
    @Log(type = "修改操作",event = "修改后台管理员密码")
    public @ResponseBody
    String updatePasswordLog(Admin admin) {
        String msg = "";
        //参数表获得
        admin.setPassword("123456");
        if (adminBackUserService.updateAdmin(admin) > 0) {
            msg = admin.getPassword();
        }
        return msg;
    }

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    @RequestMapping(value = "/addBackUser")
    @Log(type = "添加操作",event = "添加后台管理员")
    public @ResponseBody
    String addBackUserLog(Admin admin) {
        String msg = "false";
        admin.setRegistertime(new Timestamp(System.currentTimeMillis()));
        if (adminService.findAdmin(admin.getAccount()) != null) {
            msg = "haveAdmin";
        } else {
            if (adminDao.regAdmin(admin) > 0) {
                Adminrole adminrole = new Adminrole();
                adminrole.setAccount(admin.getAccount());
                adminrole.setRoid(2);
                if (adminRoleDao.regAdminRole(adminrole) > 0) {
                    msg = "true";
                }
            }
        }

        return msg;
    }
}
