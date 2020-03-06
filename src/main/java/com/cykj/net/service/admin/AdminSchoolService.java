package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public interface AdminSchoolService {
    LayuiData school(String scName, String type, String prid, String ctid, String state,String scState, int page, int limit);

    String updateState(String scAccount, String state);

    String updatePassword(String scAccount) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    String updateScState(String scAccount, String scState,String name);
}
