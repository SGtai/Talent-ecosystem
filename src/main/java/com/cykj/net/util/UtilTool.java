package com.cykj.net.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class UtilTool {


    /**
     * 本周
     *
     * @param date
     * @return
     */
    public static List<String> week(Date date) {

        List<String> dateWeekList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String time = "";
        //flag用来存取与当天日期的相差数
        int flag = 0;
        for (int i = 1; i < 8; i++) {
            //新建日历
            Calendar cal = Calendar.getInstance();
            //在日历中找到当前日期
            cal.setTime(date);
            //当前日期时本周第几天，默认按照西方惯例上周星期天为第一天
            flag = -cal.get(Calendar.DAY_OF_WEEK);
            //根据循环。当天与上周星期天和本周一到周五相差的天数
            cal.add(Calendar.DATE, flag + i);
            //转化格式
            time = sdf.format(cal.getTime());
            //存入list
            dateWeekList.add(time);
        }

        return dateWeekList;
    }


    public static List<String> half() throws ParseException {


        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, -5);
        String before_six = c.get(Calendar.YEAR) + "-" + c.get(Calendar.MONTH);//六个月前
        ArrayList<String> result = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");// 格式化为年月
        Calendar min = Calendar.getInstance();
        Calendar max = Calendar.getInstance();
        min.setTime(sdf.parse(before_six));
        min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 1);
        max.setTime(sdf.parse(sdf.format(new Date())));
        max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 2);
        Calendar curr = min;
        while (curr.before(max)) {
            result.add(sdf.format(curr.getTime()));
            curr.add(Calendar.MONTH, 1);
        }

        return result;
    }

    public static List<String> month(String dates){
        // Java8  LocalDate
        LocalDate date = LocalDate.parse(dates);

        // 该月第一天
        LocalDate firstDay = date.with(TemporalAdjusters.firstDayOfMonth());
        // 该月最后一天
        LocalDate lastDay = date.with(TemporalAdjusters.lastDayOfMonth());
        // 该月的第一个周一
        LocalDate start = date.with(TemporalAdjusters.firstInMonth(DayOfWeek.MONDAY));

        List<String> list = new ArrayList<>();

        // 处理每个月的1号不是周一的情况
        if (!firstDay.equals(start)) {

            StringBuilder strbur = new StringBuilder();
            strbur.append(firstDay.toString())
                    .append(" ")
                    .append(start.plusDays(-1).toString());
            list.add(strbur.toString());
        }

        while (start.isBefore(lastDay)) {

            StringBuilder strbur = new StringBuilder();
            strbur.append(start.toString());

            LocalDate temp = start.plusDays(6);
            if (temp.isBefore(lastDay)) {

                strbur.append(" ")
                        .append(temp.toString());
            } else {

                strbur.append(" ")
                        .append(lastDay.toString());
            }

            list.add(strbur.toString());
            start = start.plusWeeks(1);
        }

        return list;
    }
}
