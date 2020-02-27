package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

public interface AdminFrontUserService {

    LayuiData frontUser(String phone, String name, int limit, int page);

    String updateState(String phone, String state);

    String updatePassword(String phone);
}
