package com.cykj.net.javabean;

import java.util.List;

public class Table
{
	private int code;
	private int count;
	private String msg="";
	private List<?> data;
	private List<Experience> experiences;
	private List<Undergo> undergos;

	public Table()
	{
	}

	public Table(int code, int count, String msg, List<?> data, List<Experience> experiences, List<Undergo> undergos)
	{
		this.code = code;
		this.count = count;
		this.msg = msg;
		this.data = data;
		this.experiences = experiences;
		this.undergos = undergos;
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

	public List<Experience> getExperiences()
	{
		return experiences;
	}

	public void setExperiences(List<Experience> experiences)
	{
		this.experiences = experiences;
	}

	public List<Undergo> getUndergos()
	{
		return undergos;
	}

	public void setUndergos(List<Undergo> undergos)
	{
		this.undergos = undergos;
	}
}
