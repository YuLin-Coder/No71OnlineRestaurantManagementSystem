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
import com.web.orm.Txinyong;

public class xinyong_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("xinyongAdd"))
		{
			xinyongAdd(req, res);//信用添加
		}
		if(type.endsWith("xinyongMana"))
		{
			xinyongMana(req, res);//信用管理
		}
		if(type.endsWith("xinyongDel"))
		{
			xinyongDel(req, res);//信用删除
		}
	}
	
	public void xinyongAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String shuxing=req.getParameter("shuxing").trim();
		String neirong=req.getParameter("neirong").trim();
		String shijian=req.getParameter("shijian").trim();
		
		String user_id=req.getParameter("user_id").trim();
		
		String sql="insert into t_xinyong(id,shuxing,neirong,shijian,user_id) values(?,?,?,?,?)";
		Object[] params={id,shuxing,neirong,shijian,user_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void xinyongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String user_id=req.getParameter("user_id").trim();
		
		List xinyongList=new ArrayList();
		String sql="select * from t_xinyong where user_id=?";
		Object[] params={user_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Txinyong xinyong=new Txinyong();
				
				xinyong.setId(rs.getString("id"));
				xinyong.setShuxing(rs.getString("shuxing"));
				xinyong.setNeirong(rs.getString("neirong"));
				xinyong.setShijian(rs.getString("shijian"));
				
				xinyong.setUser_id(rs.getString("user_id"));
				
				xinyongList.add(xinyong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("xinyongList", xinyongList);
		req.getRequestDispatcher("admin/xinyong/xinyongMana.jsp").forward(req, res);
	}
	
	
	
	public void xinyongDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id").trim();
		
		String sql="delete from t_xinyong  where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
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
