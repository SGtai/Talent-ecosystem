package com.cykj.net.service.admin;

import com.cykj.net.javabean.admin.ZtreeMenu;

import java.util.List;

public interface AdminMenuService {
    List<ZtreeMenu> initMenuChange(int rid);

    int changeMenu(int rid, String checkList);
}
