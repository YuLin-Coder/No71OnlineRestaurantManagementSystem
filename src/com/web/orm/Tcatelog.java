package com.web.orm;

public class Tcatelog //菜品类别类
{
	private String id;//菜品类别ID
	private String name;//菜品类别名称
	private String del;//菜品类别是否删除标志
	
	public String getDel()//得到是否删除信息
	{
		return del;
	}
	public void setDel(String del)//设置是否删除信息
	{
		this.del = del;
	}
	public String getName()//得到菜品类别名信息
	{
		return name;
	}
	public void setName(String name)//设置菜品类别名信息
	{
		this.name = name;
	}
	public String getId()//得到菜品类别ID信息
	{
		return id;
	}
	public void setId(String id)//设置菜品类别ID信息
	{
		this.id = id;
	}

}
