package com.web.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.web.dao.DB;
import com.web.orm.Tcatelog;
import com.web.orm.Tgoods;
import com.web.orm.Torder;
import com.web.orm.TorderItem;
import com.web.orm.Txinyong;


public class liuService
{
	public static List catelogList()//获得菜品种类id，name的函数
	{
		List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";//查询未被删除的菜品类别信息
		Object[] params={};//设置初始值为空
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();//得到结果集
			while(rs.next())//如果有下一行
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getString("id"));//设置ID
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
	}
	
	
	
	public static Tgoods getGoods(String id)
	//得到商品详细信息
	{
		Tgoods goods=new Tgoods();
		
		String sql="select * from t_goods where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			goods.setId(rs.getString("id"));
			goods.setCatelog_id(rs.getString("catelog_id"));
			goods.setBianhao(rs.getString("bianhao"));
			
			goods.setMingcheng(rs.getString("mingcheng"));
			goods.setJieshao(rs.getString("jieshao"));
			goods.setFujian(rs.getString("fujian"));
			
			goods.setShichangjia(rs.getInt("shichangjia"));
			goods.setTejia(rs.getInt("tejia"));
			goods.setDel(rs.getString("del"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goods;
	}
	
	
	public static List goodsNew()
	//得到最新商品信息
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
		return goodsList;
	}
	
	
	
	
	public static List goodsByCatelog(String catelog_id)
	//得到菜品类别集
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and catelog_id=? order by id desc";
		Object[] params={catelog_id};
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
		return goodsList;
	}
	
	
	
	public static void saveOrder(Torder order)
	//保存订单
	{
		String sql="insert into t_order(id,bianhao,shijian,zhuangtai,huifu,songhuodizhi,fukuanfangshi,jine,user_id) values(?,?,?,?,?,?,?,?,?)";
		Object[] params={order.getId(),order.getBianhao(),order.getShijian(),order.getZhuangtai(),order.getHuifu(),order.getSonghuodizhi(),order.getFukuanfangshi(),order.getJine(),order.getUser_id()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void saveOrderItem(String id,String order_id,String goods_id,int goods_quantity)
	//保存购物车详细信息
	{
		String sql="insert into t_orderitem(id,order_id,goods_id,goods_quantity) values(?,?,?,?)";
		Object[] params={id,order_id,goods_id,goods_quantity};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void updateGoodsKucun(String goods_id,int goods_quantity)
	//更新菜品库存
	{
		String sql="update t_goods set kucun=kucun-? where id=?";
		Object[] params={goods_quantity,goods_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
	public static List orderList(String user_id)
	//得到订单集
	{
		List orderList=new ArrayList();
		String sql="select * from t_order where user_id=?";
		Object[] params={user_id};
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
		return orderList;
	}
	
	
	public static List orderItemList(String order_id)
	//得到购物车集
	{
		List orderitemList=new ArrayList();
		String sql="select * from t_orderitem where order_id=?";
		Object[] params={order_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TorderItem orderItem=new TorderItem();
				
				orderItem.setId(rs.getString("id"));
				orderItem.setGoods(getGoods(rs.getString("goods_id")));
				orderItem.setGoods_quantity(rs.getInt("goods_quantity"));
				
				orderitemList.add(orderItem);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return orderitemList;
	}
	
	
	public static String panduan_zhanghao(String loginname)
	//判断账号密码是否正确
	{
		String s="meizhan";
		
		String sql="select * from t_user where del='no' and loginname=?";
		Object[] params={loginname.trim()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	
	
	
	
	public static List getxinyongList(String user_id)
	//得到信用集
	{
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
		
		return xinyongList;
		
	}
	
}
