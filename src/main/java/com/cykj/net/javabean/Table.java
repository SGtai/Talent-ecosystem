package com.cykj.net.javabean;

import java.util.List;

public class Table
{
	private int code;
	private int count;
	private String msg="";
	private List<?> data;

	public Table(int code, int count, String msg, List<?> data)
	{
		this.code = code;
		this.count = count;
		this.msg = msg;
		this.data = data;
	}

	public Table()
	{
	}

	public int getCode()
	{
		return code;
	}

	public void setCode(int code)
	{
		this.code = code;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public List<?> getData()
	{
		return data;
	}

	public void setData(List<?> data)
	{
		this.data = data;
	}
}
