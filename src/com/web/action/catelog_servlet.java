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

import com.web.dao.DB;
import com.web.orm.Tcatelog;


public class catelog_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("catelogAdd"))
		{
			catelogAdd(req, res);//添加菜品类别
		}
		if(type.endsWith("catelogMana"))
		{
			catelogMana(req, res);//菜品类别管理
		}
		if(type.endsWith("catelogDel"))
		{
			catelogDel(req, res);//菜品类别删除
		}
	}
	
	public void catelogAdd(HttpServletRequest req,HttpServletResponse res)
	//菜品类别添加函数
	{
		String id=String.valueOf(new Date().getTime());
		String name=req.getParameter("name").trim();//trim()去掉前后的空白
		String del="no";
		
		String sql="insert into t_catelog(id,name,del) values(?,?,?)";
		Object[] params={id,name,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);//执行sql语句，对数据库进行增删改查，结果赋值给结果集params中
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void catelogMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品类别管理
	{
		List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())//如果存在下一条语句，循环执行
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getString("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);//添加类别到菜品类别集
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("catelogList", catelogList);
		req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
	}
	
	
	
	public void catelogDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品类别删除成功
	{
		String sql="update t_catelog set del='yes' where id="+req.getParameter("id");
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	//跳转下一页面
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
	//初始化配置
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
