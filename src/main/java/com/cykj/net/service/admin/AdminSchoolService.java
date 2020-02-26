package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

public interface AdminSchoolService {
    LayuiData school(String scName, String type, String prid, String ctid, String state, int page, int limit);

    String updateState(String qyAccount, String state);

    String updatePassword(String qyAccount);
}
