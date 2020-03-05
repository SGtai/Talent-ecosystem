package com.cykj.net.javabean.admin;

public class ZtreeMenu
{
	private String id;
	private String pid;
	private String name;
	private String checked;

	public ZtreeMenu()
	{
	}

	public ZtreeMenu(String id, String pid, String name, String checked)
	{
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.checked = checked;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPid()
	{
		return pid;
	}

	public void setPid(String pid)
	{
		this.pid = pid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getChecked()
	{
		return checked;
	}

	public void setChecked(String checked)
	{
		this.checked = checked;
	}
}
