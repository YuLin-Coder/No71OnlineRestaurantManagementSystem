package com.web.orm;

public class Tuser
{
	private String id;//用户ID
	private String loginname;//用户登录账号
	private String loginpw;//用户登录密码
	private String name;//用户登录名
	private String studentid;//学号
	private String stuhost;//宿舍号
	private String del;//是否删除标志
	
	public String getId()//得到用户ID
	{
		return id;
	}
	public void setId(String id)//设置用户ID
	{
		this.id = id;
	}
	public String getLoginname()//得到用户登录账号
	{
		return loginname;
	}
	public void setLoginname(String loginname)//设置用户登录账号
	{
		this.loginname = loginname;
	}
	public String getLoginpw()//得到用户登录密码
	{
		return loginpw;
	}
	
	public String getDel()//得到用户是否删除信息
	{
		return del;
	}
	public void setDel(String del)//设置用户是否删除信息
	{
		this.del = del;
	}
	public void setLoginpw(String loginpw)//得到用户登录密码
	{
		this.loginpw = loginpw;
	}
	public String getName()//得到用户姓名
	{
		return name;
	}
	public void setName(String name)//设置用户姓名
	{
		this.name = name;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getStuhost() {
		return stuhost;
	}
	public void setStuhost(String stuhost) {
		this.stuhost = stuhost;
	}
	@Override
	public String toString() {
		return "Tuser [id=" + id + ", loginname=" + loginname + ", loginpw="
				+ loginpw + ", name=" + name + ", studentid=" + studentid
				+ ", stuhost=" + stuhost + ", del=" + del + "]";
	}
	
}
