package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public interface AdminComanyService {
    LayuiData company(String qyName, String qyType,String prid, String ctid,String state,String qyState, int page, int limit);

    String getProvince();

    String getCity(String prid);

    String updateState(String qyAccount, String state);

    String updatePassword(String qyAccount) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    String updateQyState(String qyAccount, String qyState,String name);
}
