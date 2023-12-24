package com.web.orm;

public class Txinyong
{
	private String id;//管理员给用户评价ID
	private String shuxing;//管理员给用户评价属性
	private String neirong;//管理员给用户评价内容
	private String shijian;//管理员给用户评价时间
	
	private String user_id;//用户ID

	public String getId()//得到评价ID
	{
		return id;
	}

	public void setId(String id)//设置评价ID
	{
		this.id = id;
	}

	public String getShuxing()//得到评价属性
	{
		return shuxing;
	}

	public void setShuxing(String shuxing)//设置评价属性
	{
		this.shuxing = shuxing;
	}

	public String getNeirong()//得到评价内容
	{
		return neirong;
	}

	public void setNeirong(String neirong)//设置评价内容
	{
		this.neirong = neirong;
	}

	public String getShijian()//得到评价时间
	{
		return shijian;
	}

	public void setShijian(String shijian)//设置评价时间
	{
		this.shijian = shijian;
	}

	public String getUser_id()//得到用户ID
	{
		return user_id;
	}

	public void setUser_id(String user_id)//设置用户ID
	{
		this.user_id = user_id;
	}
	
}
