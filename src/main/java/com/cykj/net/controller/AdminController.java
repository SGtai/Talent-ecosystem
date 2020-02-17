package com.cykj.net.controller;

import com.cykj.net.javabean.Admin;
import com.cykj.net.service.admin.AdminService;
import com.cykj.net.util.GetCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    private AdminService adminService;

    /**
     * 后台管理员登录
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
        if (null == findAdmin){
            return "noAccount";
        }
        //判断密码是否一致
        if (!getAdmin.getPassword().equals(findAdmin.getPassword())){
            return "false";
        }



        return "true";
    }



    @PostMapping(value = "/contrastCode")
    public @ResponseBody String contrastCode(String code,HttpSession session){
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




}
