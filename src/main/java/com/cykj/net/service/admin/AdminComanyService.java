package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;
public interface AdminComanyService {
    LayuiData company(String qyName, String qyType,String prid, String ctid,String state,String qyState, int page, int limit);

    String getProvince();

    String getCity(String prid);

    String updateState(String qyAccount, String state);

    String updatePassword(String qyAccount);

    String updateQyState(String qyAccount, String qyState);
}
