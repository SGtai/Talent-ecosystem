package com.cykj.net.service.admin;

import com.cykj.net.javabean.LayuiData;
import com.cykj.net.javabean.Parameter;

public interface AdminParameterService {
    LayuiData parameter(String name, String type, int page, int limit);

    String getParameter();

    String addParameter(Parameter parameter);

    String updateParameter(Parameter parameter);
}
