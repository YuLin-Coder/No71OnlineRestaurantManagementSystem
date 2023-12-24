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
import com.web.orm.Tgoods;
import com.web.service.liuService;


public class goods_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);//添加菜品
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);//菜品管理
		}
		if(type.endsWith("goodsDel"))
		{
			goodsDel(req, res);//菜品删除
		}
		if(type.endsWith("goodsDetailHou"))
		{
			goodsDetailHou(req, res);//菜品后台详细信息
		}
		if(type.endsWith("goodsPre"))
		{
			goodsPre(req, res);//菜品信息添加
		}
		if(type.endsWith("goodsEdit"))
		{
			goodsEdit(req, res);//菜品信息编辑
		}
		
		
		
		if(type.endsWith("goodsNew"))
		{
			goodsNew(req, res);//菜品最新信息
		}
		if(type.endsWith("goodsByCatelog"))
		{
			goodsByCatelog(req, res);//菜品类别
		}
		if(type.endsWith("goodsDetailQian"))
		{
			goodsDetailQian(req, res);//菜品前台详细信息
		}
		if(type.endsWith("goodsRes"))
		{
			goodsRes(req, res);//菜品信息更新前
		}
	}
	
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	//添加商品
	{
		String id=String.valueOf(new Date().getTime());
		String catelog_id=req.getParameter("catelog_id");
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String fujian=req.getParameter("fujian");
		int shichangjia=Integer.parseInt(req.getParameter("shichangjia"));
		int tejia=Integer.parseInt(req.getParameter("shichangjia"));


		String del="no";
		
		String sql="insert into t_goods(id,catelog_id,bianhao,mingcheng,jieshao,fujian,shichangjia,tejia,del) " +
				   "values(?,?,?,?,?,?,?,?,?)";
		Object[] params={id,catelog_id,bianhao,mingcheng,jieshao,fujian,shichangjia,tejia,del};//Object[]定义一个一维对象，不需要强制类型转换
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//管理商品，设置商品各种属性
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}
	
	
	
	public void goodsDel(HttpServletRequest req,HttpServletResponse res)
	//删除商品
	{
		String id=req.getParameter("id");
		String sql="update t_goods set del='yes' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//商品的具体描述信息
	{
        String id=req.getParameter("id");
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("admin/goods/goodsDetailHou.jsp").forward(req, res);
	}
	
	
	public void goodsPre(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品信息添加函数
	{
		Tgoods goods=new Tgoods();
		
		String sql="select * from t_goods where id=?";
		Object[] params={req.getParameter("id")};
		
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setDel(rs.getString("del"));
				
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goods", goods);
		req.getRequestDispatcher("admin/goods/goodsPre.jsp").forward(req, res);
	}
	
	
	public void goodsEdit(HttpServletRequest req,HttpServletResponse res)
	//商品信息编辑
	{
		String id=req.getParameter("id");
		String catelog_id=req.getParameter("catelog_id");
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String fujian=req.getParameter("fujian");
		int shichangjia=Integer.parseInt(req.getParameter("shichangjia"));
		int tejia=Integer.parseInt(req.getParameter("shichangjia"));


		String sql="update t_goods set catelog_id=?,bianhao=?,mingcheng=?,jieshao=?,fujian=?,shichangjia=?,tejia=? where id=?";
		Object[] params={catelog_id,bianhao,mingcheng,jieshao,fujian,shichangjia,tejia,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsNew(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//得到最新的菜品信息
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' order by id desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		if(goodsList.size()>8)
		{
			goodsList=goodsList.subList(0, 8);
		}
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("site/goods/goodsNew.jsp").forward(req, res);
	}
	
	
	
	
	public void goodsByCatelog(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品类别
	{
        String catelog_id=req.getParameter("catelog_id");
		
		req.setAttribute("goodsList", liuService.goodsByCatelog(catelog_id));
		req.getRequestDispatcher("site/goods/goodsByCatelog.jsp").forward(req, res);
	}
	
	public void goodsDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品前台详细信息
	{
		String id=req.getParameter("id");
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("site/goods/goodsDetailQian.jsp").forward(req, res);
	}
	
	
	public void goodsRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//菜品之前的信息
	{
		String mingcheng=req.getParameter("mingcheng");
		
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and mingcheng like '%"+mingcheng.trim()+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("site/goods/goodsRes.jsp").forward(req, res);
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
		super.init(config);//调用父类init（）方法
	}
	
	public void destroy() 
	{
		
	}
}
