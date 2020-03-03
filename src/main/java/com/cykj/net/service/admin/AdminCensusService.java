package com.cykj.net.service.admin;

import java.text.ParseException;

public interface AdminCensusService {
    String week(int role);

    String month(String date,int role);

    String half(int role) throws ParseException;
}
