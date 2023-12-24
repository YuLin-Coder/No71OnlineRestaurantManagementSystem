package com.web.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.web.orm.Tgoods;
import com.web.orm.TorderItem;

public class Cart
{
	// 购物车属性
	// 购物项集合:Map的主键就是商品的id,value:购物项
	protected Map<String, TorderItem> items;

	public Cart()
	{

		if (items == null)
		{
			items = new HashMap<String, TorderItem>();
		}
	}

public void addGoods(String goodsId, TorderItem orderItem)//添加物品到购物车中
	{
	//判断购物车中是否已经存在该购物项,如果存在,数量增加;如果不存在,向map中添加购物项
		if (items.containsKey(goodsId)) //存在
		{

			TorderItem _orderitem = items.get(goodsId); //获得购物车中原来的购物项
			_orderitem.setGoods_quantity(_orderitem.getGoods_quantity()+ orderItem.getGoods_quantity());
			items.put(goodsId, _orderitem);//数量增加
		} 
		else//不存在
		{

			items.put(goodsId, orderItem);//数量增加
		}
	}
	
	public void delGoods(String goodsId)//删除购物车中的物品，删除主键id
	{
		items.remove(goodsId);
	}
	

	public void updateCart(String goodsId, int quantity)//更新购物车
	{

		TorderItem orderItem = items.get(goodsId);
		orderItem.setGoods_quantity(quantity);
		items.put(goodsId, orderItem);
	}

	public int getTotalPrice()//获得购物车中物品的总价
	{

		int totalPrice = 0;//总价初始值为0
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

			TorderItem orderItem = (TorderItem) it.next();
			Tgoods goods = orderItem.getGoods();//
			int quantity = orderItem.getGoods_quantity();//数量
			totalPrice += goods.getTejia()* quantity;//总价=特价*数量
		}
		return totalPrice;
	}

	public Map<String, TorderItem> getItems()//获得商品
	{
		return items;
	}

}
