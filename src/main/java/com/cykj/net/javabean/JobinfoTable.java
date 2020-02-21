package com.cykj.net.javabean;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

/**
 * @author 杨德禄 JX190714
 * @create 2020-02-21 11:45
 * @desc
 **/
@Data
public class JobinfoTable
{
	private long id ;
	private String zhaopinTime;
	private String xueliRequire;
	private String age;
	private String salary;
	private String xinzifuli;
	private long zpNum;
	private java.sql.Timestamp time;
	private List<JobinfoTable> list;

}
