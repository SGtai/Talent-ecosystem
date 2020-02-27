package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;

public interface AdminSchoolService {
    LayuiData school(String scName, String type, String prid, String ctid, String state,String scState, int page, int limit);

    String updateState(String scAccount, String state);

    String updatePassword(String scAccount);

    String updateScState(String scAccount, String scState,String name);
}
