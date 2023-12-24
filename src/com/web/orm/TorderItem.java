package com.web.orm;

public class TorderItem
{
	private String id;//订单明细ID
	private String order_id;//订单ID
	private String goods_id;//商品ID
	private int goods_quantity;//商品数量
	
	
	private Tgoods goods;//表里没有。自己加的
	
	public int getGoods_quantity()//得到商品数量
	{
		return goods_quantity;
	}
	public void setGoods_quantity(int goods_quantity)//设置商品数量
	{
		this.goods_quantity = goods_quantity;
	}
	
	public String getGoods_id()//得到商品ID
	{
		return goods_id;
	}
	public void setGoods_id(String goods_id)//设置商品ID
	{
		this.goods_id = goods_id;
	}
	public String getId()//得到订单明细ID
	{
		return id;
	}
	public void setId(String id)//设置订单明细ID
	{
		this.id = id;
	}
	public String getOrder_id()//得到订单ID
	{
		return order_id;
	}
	public void setOrder_id(String order_id)//设置订单ID
	{
		this.order_id = order_id;
	}
	public Tgoods getGoods()//得到商品信息
	{
		return goods;
	}
	public void setGoods(Tgoods goods)//设置商品信息
	{
		this.goods = goods;
	}
	
	

}
