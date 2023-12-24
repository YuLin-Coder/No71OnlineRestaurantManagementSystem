package com.web.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.orm.Tgoods;
import com.web.orm.Torder;
import com.web.orm.TorderItem;
import com.web.orm.Tuser;
import com.web.service.liuService;
import com.web.util.Cart;


public class buy_servlet extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	//request对象req，response对象res
	{
        String type=req.getParameter("type");//得到type属性给了type
		
		if(type.endsWith("addToCart"))//如果URL传入的参数是addToCart
		{
			addToCart(req, res);//执行添加购物车
		}
		if(type.endsWith("orderSubmit"))//如果URL传入的参数是orderSubmit
		{
			orderSubmit(req, res);//执行提交订单函数
		}
		if(type.endsWith("myorder"))
		{
			myorder(req, res);//执行我的订单函数
		}
		if(type.endsWith("orderDetail"))
		{
			orderDetail(req, res);//执行订单明细函数
		}
		
		
		
	}
	
	
	public void addToCart(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//添加商品到购物车
	{
		String goods_id=req.getParameter("goods_id");//商品ID
		int quantity=Integer.parseInt(req.getParameter("quantity"));//商品数量
		Tgoods goods=liuService.getGoods(goods_id);//商品ID，给了good
		
		TorderItem orderItem=new TorderItem();
		orderItem.setGoods(goods);//设置商品ID
		orderItem.setGoods_quantity(quantity);//设置商品数量
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		cart.addGoods(goods_id, orderItem);
		
		session.setAttribute("cart", cart);
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "site/cart/mycart.jsp");//添加购物车成功跳转到该页面
		
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);//跳转到targetURL
		
	}
	
	
	
	public void orderSubmit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//提交订单
	{
		String songhuodizhi=req.getParameter("songhuodizhi");//得到送货地址
		String fukuanfangshi=req.getParameter("fukuanfangshi");//得到付款方式
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		Tuser user=(Tuser)session.getAttribute("user");
		
		Torder order=new Torder();
		
		order.setId(String.valueOf(new Date().getTime()));//设置订单ID，以时间的格式
		order.setBianhao(new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()));//设置订单编号，格式为yyyyMMddhhmmss
		order.setShijian(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));//设置下单时间，格式为yyyy-MM-dd hh:mm:ss
		order.setZhuangtai("no");
		
		order.setHuifu("");
		
		order.setSonghuodizhi(songhuodizhi);
		order.setFukuanfangshi(fukuanfangshi);
		order.setJine(cart.getTotalPrice());//设置总金额
		order.setUser_id(user.getId());
		
		liuService.saveOrder(order);
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		//创建迭代器对象it，值为商品数量的值，如果迭代器后面还有东西，执行循环
		{

			TorderItem orderItem = (TorderItem) it.next();//获取下一个对象，转换成TorderItem对象，赋予TorderItem对象orderItem
			
			String id=String.valueOf(new Date().getTime());//得到编号ID
			String order_id=order.getId();//得到订单ID
			String goods_id=orderItem.getGoods().getId();
			int goods_quantity=orderItem.getGoods_quantity();
			liuService.saveOrderItem(id, order_id, goods_id, goods_quantity);//保存id, order_id, goods_id, goods_quantity
			
		}
		
		cart.getItems().clear(); //清空购物车
		session.setAttribute("cart", cart);
		
		req.setAttribute("order", order);
		req.getRequestDispatcher("site/order/orderSubmit.jsp").forward(req, res);//跳转到这个界面
	}
	
	
	public void myorder(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//我的订单
	{
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		req.setAttribute("orderList", liuService.orderList(user.getId()));//设置orderList的属性
		req.getRequestDispatcher("site/order/myorder.jsp").forward(req, res);
	}
	
	public void orderDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	//订单明细
	{
		String order_id=req.getParameter("order_id");	
		System.out.println(order_id+"DD");//输出order_idDD
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("site/order/orderDetail.jsp").forward(req, res);
	}
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	//跳转到下一界面
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
	//初始化Servlet配置
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
