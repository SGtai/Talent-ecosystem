package com.cykj.net.service.admin.impl;

import com.cykj.net.javabean.admin.CensusUtil;
import com.cykj.net.mapper.admin.AdminCensusMapper;
import com.cykj.net.service.admin.AdminCensusService;
import com.cykj.net.util.UtilTool;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("adminUserCensusService")
public class AdminCensusServiceImpl implements AdminCensusService {

    @Autowired
    AdminCensusMapper adminCensusMapper;


    @Override
    public String week(int role) {
        ArrayList<CensusUtil> arrayList = new ArrayList<>();

        List<String> dateWeekList = UtilTool.week(new Date());
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        int sum = 0;
        String tableName = null;
        if (role == 0){
            tableName = "userlist";
        }else if (role == 1){
            tableName = "qyinfo";
        }else {
            tableName = "schoolinfo";
        }
        for (int i = 0; i < dateWeekList.size(); i++) {
            int count = adminCensusMapper.countQueryWeek(dateWeekList.get(i),tableName);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName(weekDays[i]);
            arrayList.add(censusUtil);
            sum = count + sum;
        }

        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);
        String msg = jsonStr + "://" + sum;
        return msg;
    }

    @Override
    public String month(String date,int role) {
        ArrayList<CensusUtil> arrayList = new ArrayList<>();
        List<String> dateHalfList = null;

        dateHalfList = UtilTool.month(date);
        String tableName = null;
        if (role == 0){
            tableName = "userlist";
        }else if (role == 1){
            tableName = "qyinfo";
        }else {
            tableName = "schoolinfo";
        }
        int sum = 0;
        for (int i = 0; i < dateHalfList.size(); i++) {
            String[] time = dateHalfList.get(i).split(" ");
            int count = adminCensusMapper.countQueryMonth(time[0],time[1]+" 23:59:59",tableName);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName("第" + (i + 1) + "周");
            arrayList.add(censusUtil);

            sum = count + sum;
        }
        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);
        String msg = jsonStr + "://" + sum;
        return msg;
    }

    @Override
    public String half(int role) throws ParseException {
        ArrayList<CensusUtil> arrayList = new ArrayList<>();
        List<String> dateHalfList = null;

        dateHalfList = UtilTool.half();

        int sum = 0;
        String tableName = null;
        if (role == 0){
            tableName = "userlist";
        }else if (role == 1){
            tableName = "qyinfo";
        }else {
            tableName = "schoolinfo";
        }
        for (int i = 0; i < dateHalfList.size(); i++) {
            int count = adminCensusMapper.countQueryHalf(dateHalfList.get(i),tableName);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName(dateHalfList.get(i));
            arrayList.add(censusUtil);

            sum = count + sum;
        }
        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);

        String msg = jsonStr + "://" + sum;
        return msg;
    }
}