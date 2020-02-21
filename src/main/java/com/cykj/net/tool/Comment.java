package com.cykj.net.tool;

import com.cykj.net.javabean.Assess;
import com.cykj.net.javabean.Reply;

import java.util.ArrayList;

public class Comment
{
	Assess assess;
	ArrayList<Assess> aryA;
	ArrayList<Reply> aryR;

	public Assess getAssess()
	{
		return assess;
	}

	public void setAssess(Assess assess)
	{
		this.assess = assess;
	}

	public ArrayList<Assess> getAryA()
	{
		return aryA;
	}

	public void setAryA(ArrayList<Assess> aryA)
	{
		this.aryA = aryA;
	}

	public ArrayList<Reply> getAryR()
	{
		return aryR;
	}

	public void setAryR(ArrayList<Reply> aryR)
	{
		this.aryR = aryR;
	}



}
