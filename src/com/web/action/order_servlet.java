package com.web.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.dao.DB;
import com.web.orm.Torder;


public class order_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("orderMana"))
		{
			orderMana(req, res);//订单管理
		}
		if(type.endsWith("orderDel"))
		{
			orderDel(req, res);//订单删除
		}
		if(type.endsWith("orderShouli"))
		{
			orderShouli(req, res);//受理订单
		}
		
		if(type.endsWith("huifuAdd"))
		{
			huifuAdd(req, res);//添加回复
		}
	}
	
	public void orderMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List orderList=new ArrayList();
		String sql="select * from t_order order by zhuangtai desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Torder order=new Torder();
				
				order.setId(rs.getString("id"));
				order.setBianhao(rs.getString("bianhao"));
				order.setShijian(rs.getString("shijian"));
				order.setZhuangtai(rs.getString("zhuangtai"));
				order.setHuifu(rs.getString("huifu"));
				order.setSonghuodizhi(rs.getString("songhuodizhi"));
				order.setFukuanfangshi(rs.getString("fukuanfangshi"));
				order.setJine(rs.getInt("jine"));
				order.setUser_id(rs.getString("user_id"));
				
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("admin/order/orderMana.jsp").forward(req, res);
	}
	
	
	
	public void orderDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		String sql="delete from t_order where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "信息删除完毕");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void orderShouli(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		String sql="update t_order set zhuangtai='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "订单受理完毕");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void huifuAdd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
        String huifu=req.getParameter("huifu");
		
		String sql="update t_order set huifu=? where id=?";
		Object[] params={huifu,id};
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
