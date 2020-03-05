package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.admin.ZtreeMenu;
import com.cykj.net.mapper.admin.AdminMenuMapper;
import com.cykj.net.service.admin.AdminMenuService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("adminMenuService")
public class AdminMenuServiceImpl implements AdminMenuService {

    @Autowired
    private AdminMenuMapper adminMenuMapper;

    @Override
    public List<ZtreeMenu> initMenuChange(int rid) {
        return adminMenuMapper.initMenuChange(rid);
    }

    @Override
    public int changeMenu(int rid, String checkList) {

        int i = 0;
        //先归零
        if (adminMenuMapper.initMenuRoid(rid) > 0){
            ArrayList<String> check = new Gson().fromJson(checkList,new ArrayList<String>().getClass());

            for (int j = 0; j < check.size(); j++) {
                if (adminMenuMapper.updateMenuRoid(rid,check.get(j)) > 0){
                    i = 1;
                }else {
                    i = 0;
                    break;
                }
            }

        }

        return i;
    }
}
