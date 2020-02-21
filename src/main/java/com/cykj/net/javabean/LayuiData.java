package com.cykj.net.javabean;

import lombok.Data;

import java.util.List;
@Data
public class LayuiData {
    private int code=0;
    private String msg = "";
    private int count;
    private List<?> data;
}
