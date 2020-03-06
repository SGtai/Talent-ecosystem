package com.cykj.net.service.admin;

import java.text.ParseException;

public interface AdminCensusService {
    String week(int role);

    String month(String date,int role);

    String half(int role) throws ParseException;

    String week1(int role,String tjr);

    String month1(String date,int role,String tjr);

    String half1(int role,String tjr) throws ParseException;

    String week2(int role,String tjr);

    String month2(String date,int role,String tjr);

    String half2(int role,String tjr) throws ParseException;
}
