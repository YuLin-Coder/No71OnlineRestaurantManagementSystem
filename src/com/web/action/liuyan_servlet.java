package com.web.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
import com.web.orm.TLiuyan;
import com.web.orm.Tuser;


public class liuyan_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("liuyanAdd"))
		{
			liuyanAdd(req, res);//留言添加
		}
        if(type.endsWith("liuyanMana"))
		{
			liuyanMana(req, res);//留言管理
		}
		if(type.endsWith("liuyanDel"))
		{
			liuyanDel(req, res);//留言删除
		}
		if(type.endsWith("liuyanHuifu"))
		{
			liuyanHuifu(req, res);//留言回复
		}
		if(type.endsWith("liuyanAll"))
		{
			liuyanAll(req, res);//获得所有留言
		}
		
		if(type.endsWith("liuyanDetail"))
		{
			liuyanDetail(req, res);//留言详细信息
		}
	}
	
	
	public void liuyanAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		
		String neirong=req.getParameter("neirong");
		String liuyanshi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String user_id=user.getId();
		String huifu="";
		
		String huifushi="";
		
		String sql="insert into t_liuyan(neirong,liuyanshi,user_id,huifu,huifushi) values(?,?,?,?,?)";
		Object[] params={neirong,liuyanshi,user_id,huifu,huifushi};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "留言完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void liuyanMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List liuyanList=new ArrayList();
		String sql="select * from t_liuyan order by liuyanshi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyan liuyan=new TLiuyan();
				
				liuyan.setId(rs.getInt("id"));
				liuyan.setNeirong(rs.getString("neirong"));
				liuyan.setLiuyanshi(rs.getString("liuyanshi"));
				liuyan.setUser_id(rs.getString("user_id"));
				
				liuyan.setHuifu(rs.getString("huifu"));
				liuyan.setHuifushi(rs.getString("huifushi"));
			
				liuyanList.add(liuyan);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanList", liuyanList);
		req.getRequestDispatcher("admin/liuyan/liuyanMana.jsp").forward(req, res);
	}
	
	public void liuyanDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="delete from t_liuyan where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "留言信息删除完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void liuyanHuifu(HttpServletRequest req,HttpServletResponse res)
	{
		String huifu=req.getParameter("huifu");
		String huifushi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_liuyan set huifu=?,huifushi=? where id=?";
		Object[] params={huifu,huifushi,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "回复完毕完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void liuyanAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List liuyanList=new ArrayList();
		String sql="select * from t_liuyan order by liuyanshi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyan liuyan=new TLiuyan();
				
				liuyan.setId(rs.getInt("id"));
				liuyan.setNeirong(rs.getString("neirong"));
				liuyan.setLiuyanshi(rs.getString("liuyanshi"));
				liuyan.setUser_id(rs.getString("user_id"));
				
				liuyan.setHuifu(rs.getString("huifu"));
				liuyan.setHuifushi(rs.getString("huifushi"));
			
				liuyanList.add(liuyan);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanList", liuyanList);
		req.getRequestDispatcher("site/liuyan/liuyanAll.jsp").forward(req, res);
	}
	
	public void liuyanDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		req.setAttribute("liuyan", get_liuyan(id));
		req.getRequestDispatcher("site/liuyan/liuyanDetail.jsp").forward(req, res);
	}
	
	
	public TLiuyan get_liuyan(int id)
	{
		TLiuyan liuyan=new TLiuyan();
		
		String sql="select * from t_liuyan where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				liuyan.setId(rs.getInt("id"));
				liuyan.setNeirong(rs.getString("neirong"));
				liuyan.setLiuyanshi(rs.getString("liuyanshi"));
				liuyan.setUser_id(rs.getString("user_id"));
				
				liuyan.setHuifu(rs.getString("huifu"));
				liuyan.setHuifushi(rs.getString("huifushi"));
			
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return liuyan;
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
