package com.web.orm;

public class TAdmin //管理员类
{
	private int userId;//管理员用户ID
	private String userName;//管理员用户名
	private String userPw;//管理员密码
	
	
	public String getUserName()//得到管理员用户名
	{
		return userName;
	}

	public void setUserName(String userName)//设置管理员用户名
	{
		this.userName = userName;
	}

	public String getUserPw()//得到管理员密码
	{
		return userPw;
	}

	public void setUserPw(String userPw)//设置管理员密码
	{
		this.userPw = userPw;
	}

	public int getUserId()//得到管理员用户ID
	{
		return userId;
	}

	public void setUserId(int userId)//设置管理员用户ID
	{
		this.userId = userId;
	}

}
