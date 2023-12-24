package com.web.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.dao.DB;
import com.web.orm.Tuser;
import com.web.service.liuService;

public class user_servlet extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("userReg"))
		{
			userReg(req, res);//会员注册
		}
		if(type.endsWith("userAdd"))
		{
			userAdd(req, res);//会员添加
		}
		if(type.endsWith("userLogout"))
		{
			userLogout(req, res);//会员退出
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);//会员管理
		}
		if(type.endsWith("userDel"))
		{
			userDel(req, res);//会员删除
		}
		
		if(type.endsWith("userDetail"))
		{
			userDetail(req, res);//会员详细信息
		}
		if(type.endsWith("userChag"))
		{
			userChag(req, res);//会员详细信息
		}
	}
	
	
	public void userReg(HttpServletRequest req,HttpServletResponse res)
	//会员注册
	{
		String id=String.valueOf(new Date().getTime());
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String name=req.getParameter("name");
		String studentid = req.getParameter("studentid");
		String stuhost = req.getParameter("stuhost");
		String del="no";
		
		String s=liuService.panduan_zhanghao(loginname);
		if(s.equals("yizhan"))
		{
			req.setAttribute("message", "账号已被占用，请输入其他账号");
			req.setAttribute("path", "site/userreg/userreg.jsp");
			
	        String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		else
		{
			String sql="insert into t_user values(?,?,?,?,?,?,?)";
			Object[] params={id,loginname,loginpw,name,del,studentid,stuhost};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			
			req.setAttribute("message", "注册成功，请登录");
			req.setAttribute("path", "site/default.jsp");
			
	        String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		
		
	}
	
	
	
	public void userLogout(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		session.setAttribute("userType", null);
		session.setAttribute("user", null);
		
			
		req.setAttribute("message", "成功退出系统");
		req.setAttribute("path", "site/default.jsp");
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_user where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				user.setStudentid(rs.getString("studentid"));
				user.setStuhost(rs.getString("stuhost"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	
	
	
	public void userDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		String sql="update t_user set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "用户信息删除完毕");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	//用户修改
	public void userChag(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tuser tuser = new Tuser();
		String sql="select * from t_user where id=?";
		Object[] params={req.getParameter("id")};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			System.out.println(rs);
			while(rs.next())
			{
				tuser.setId(rs.getString("id"));
				tuser.setLoginname(rs.getString("loginname"));
				tuser.setLoginpw(rs.getString("loginpw"));
				
				tuser.setName(rs.getString("name"));
				tuser.setStudentid(rs.getString("studentid"));
				tuser.setStuhost(rs.getString("stuhost"));
				
				tuser.setDel(rs.getString("del"));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("tuser", tuser);
		req.getRequestDispatcher("admin/user/userChag.jsp").forward(req, res);
	}
	
	//用户添加
	public void userAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String name=req.getParameter("name");
		
		String studentid=req.getParameter("studentid");
		String stuhost=req.getParameter("stuhost");

		System.out.println("--------------"+loginname + loginpw + name + studentid + stuhost + id);
		
		String sql="update t_user set loginname=?,loginpw=?,name=?,studentid=?,stuhost=? where id=?";
		Object[] params={loginname,loginpw,name,studentid,stuhost,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void userDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		
		List userList=new ArrayList();
		String sql="select * from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.setAttribute("xinyongList", liuService.getxinyongList(id));
		req.getRequestDispatcher("admin/user/userDetail.jsp").forward(req, res);
	}
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
			e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
