package com.cykj.net.controller;

import com.cykj.net.javabean.Admin;
import com.cykj.net.javabean.AdminMenu;
import com.cykj.net.service.admin.AdminService;
import com.cykj.net.util.GetCode;
import com.cykj.net.util.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    private AdminService adminService;

    /**
     * 后台管理员登录
     *
     * @param getAdmin
     * @param session
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody
    String login(Admin getAdmin, HttpSession session) {
        //获取验证码
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        //验证验证码
        if (!getAdmin.getCode().equalsIgnoreCase(sessionVerifyCode)) {
            return "noCode";
        }
        //查询管理是否存在
        Admin findAdmin = adminService.findAdmin(getAdmin.getAccount());
        if (null == findAdmin) {
            return "noAccount";
        }
        //判断密码是否一致
        if (!getAdmin.getPassword().equals(findAdmin.getPassword())) {
            return "false";
        }
        //判断用户的状态是否可登录
        if (findAdmin.getState() == 1) {
            return "prohibit";
        } else if (findAdmin.getState() == 2) {
            return "delete";
        }
        //添加用户
        session.setAttribute("admin", findAdmin);
        return "true";
    }

    /**
     * 管理主页
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/main")
    public ModelAndView main(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //判断管理账号是否为空
        if (null == session.getAttribute("admin")) {
            mv.addObject("message", "登录超时/未登录，请重新登录");
            mv.setViewName("/WEB-INF/admin/login");
        } else {
            Admin admin = (Admin) session.getAttribute("admin");
            //查询管理的角色id
            int roid = adminService.findRoid(admin.getAccount());
            //企业
            if (roid == 3){



            //高校
            }else if (roid == 4){




            }
            //查询管理所对应的角色的菜单
            List<AdminMenu> list = adminService.findRoleMenus(roid);
            //创建一个hashmap
            HashMap<String, List<AdminMenu>> hashMap = new HashMap<>();
            hashMap.clear();
            //添加菜单列表
            for (AdminMenu m : list) {
                AdminMenu adminMenu = new AdminMenu();
                adminMenu.setSencondmenuname(m.getSencondmenuname());
                adminMenu.setMenuurl(m.getMenuurl());
                if (hashMap.containsKey(m.getFirstmenuname())) {
                    hashMap.get(m.getFirstmenuname()).add(adminMenu);
                } else {
                    ArrayList<AdminMenu> arrayList = new ArrayList<>();
                    arrayList.add(adminMenu);
                    hashMap.put(m.getFirstmenuname(), arrayList);
                }
            }
//            for(Map.Entry<String, List<AdminMenu>> entry: hashMap.entrySet())
//            {
//                System.out.println("Key: "+ entry.getKey()+ " Value: "+entry.getValue());
//            }
            //添加菜单
            mv.addObject("menus", hashMap);
            //添加角色
            mv.addObject("roid", roid);
            mv.setViewName("/WEB-INF/admin/main");
        }
        return mv;
    }

    /**
     * 管理退出
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/exit")
    public ModelAndView exit(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        session.setAttribute("admin", null);
        mv.setViewName("/WEB-INF/admin/login");
        return mv;
    }

    /**
     * 失去焦点判断验证码
     *
     * @param code
     * @param session
     * @return
     */
    @PostMapping(value = "/contrastCode")
    public @ResponseBody
    String contrastCode(String code, HttpSession session) {
        //获取验证码
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        //验证验证码
        if (!code.equalsIgnoreCase(sessionVerifyCode)) {
            return "false";
        }
        return "true";
    }

    /**
     * 获取验证码
     *
     * @param response
     * @param request
     */
    /* 获取校验码 */
    @RequestMapping(value = "/getVerifyCode")
    public void generate(HttpServletResponse response, HttpServletRequest request) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = new GetCode().drawImg(output);
        // 将校验码保存到session中
        HttpSession session = request.getSession();
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();

        }
    }

    @RequestMapping(value = "station")
    public @ResponseBody LayuiData station(String station,int limit,int page){
        LayuiData layuiData = new LayuiData();
        System.out.println(limit);
        System.out.println(page);
        System.out.println(station);
        System.out.println("张家口");
        return layuiData;
    }


}
