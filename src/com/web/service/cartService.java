package com.web.service;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.web.util.Cart;



public class cartService
{
	public String modiNum(String goodsId,int quantity)//定义公有类改变购物车中商品的数量
	{
		String result="";		//初始值为空
			 WebContext ctx = WebContextFactory.get();//获取WebContext上下文
			 HttpSession session=ctx.getSession();//获得session对象
			 Cart cart=(Cart)session.getAttribute("cart");//得到cart的属性
			 cart.updateCart(goodsId, quantity);//更新物品id和数量信息
			 session.setAttribute("cart", cart);//设置cart的属性为cart	 
			 result="yes";//result标志表示成功
		return result;
	}
	                                                                                                                                                                                                                                                                            
	public String delGoodsFromCart(String goodsId)//从购物车中删除物品
	{
		 WebContext ctx = WebContextFactory.get(); //获取WebContext上下文
		 HttpSession session=ctx.getSession();//获得session对象
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.delGoods(goodsId);
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
	
	public String clearCart()//清空购物车
	{
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.getItems().clear();
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
}
