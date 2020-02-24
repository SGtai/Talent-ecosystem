package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

public interface AdminComanyService {
    LayuiData company(String qyName, String qyType, String ctid,String state, int page, int limit);
}
