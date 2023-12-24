<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script type="text/javascript">
            function delGoodsFromCart(goodsId) //删除购物车里的货物
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback111);
	        }
           
            function clearCart() //清空购物车
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.clearCart(callback111);
	        }
           
            function modiNum(goodsId,quantity) //改变购物车里物品的数量
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //quantity为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else  //否则调用modiNum函数，改变购物车中物品的数量	
	            {
	                document.getElementById("indicator1").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback111);
	            }
	        }
	        
	        function callback111(data) //判断是否订单符合库存
	        {
	            document.getElementById("indicator1").style.display="none";
	            if(data=="no")
			    {
			        alert("库存不足");
			    }
			    if(data=="yes")  //够库存，重新加载该页面
			    {
			        document.location.reload(true);
			    }
	        }
    </script>
  </head>
  
  <body>
<div id="wrapper">
	<div id="logo">
		<h1><a href="#">网上餐厅



</a></h1>
		<p><em><a href="#">&nbsp;</a></em></p>
	</div>
	<hr/>
	<!-- 头部 -->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
	</div>
	<!-- 头部 -->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 右侧 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">我的购物车</a></h2>
				<div class="entry">
                    <table width="98%" border="0" cellpadding="2" cellspacing="1" align="center" style="margin-top:8px">
											<tr align="center" bgcolor="#FAFAF1" height="22">
												  <td>商品名称</td>
								                  <td>购买价格</td>
								                  <td>购买数量</td>
								                  <td>总金额</td>
								                  <td>操作</td>
									        </tr>	
											<c:forEach items="${sessionScope.cart.items}" var="item">
											<tr align='center' bgcolor="#FFFFFF" height="22">
												<td bgcolor="#FFFFFF" align="center">${item.value.goods.mingcheng}</td>
												<td bgcolor="#FFFFFF" align="center">￥:${item.value.goods.tejia}</td>
												<td bgcolor="#FFFFFF" align="center"><input type="text" onChange="modiNum(${item.value.goods.id},this.value)" value="${item.value.goods_quantity}" size="4"/></td>
												<!-- 改变数量 -->
												<td bgcolor="#FFFFFF" align="center">${item.value.goods.tejia * item.value.goods_quantity}</td>
												<!-- 总金额=特价*数量 -->
												<td bgcolor="#FFFFFF" align="center">
												   <input type="button" value="删除" style="width: 50px;height: 20px;" onclick="delGoodsFromCart(${item.value.goods.id})">
												</td>
											</tr>
											</c:forEach>
											<tr>
								                 <td colspan="5" class="Order_Total" align="right">
								                    <br>
												     总金额：<span id="totalMoney">${sessionScope.cart.totalPrice}</span>
												    &nbsp;&nbsp;&nbsp;&nbsp;
												    <img id="indicator1" src="<%=path %>/images/loading.gif" style="display:none"/>
												 </td>
								              </tr>	
										</table>
										<table>
				        				   <tr height="7"><td></td></tr>
						                   <tr>
						                       <td width="120"></td>
						                       <td>
						                           <input type="button" value="清空" style="width: 80px;height: 30px;" onclick="clearCart()">
						                       </td>
						                       <td>
						                           <input type="button" value="继续" style="width: 80px;height: 30px;" onclick="javascript:window.location.href='<%=path %>/site/default.jsp'">
						                       </td>
						                       <td>
						                           <input type="button" value="结账" style="width: 80px;height: 30px;" onclick="javascript:window.location.href='<%=path %>/site/order/orderQueren.jsp'">
						                       </td>
						                   </tr>
						               </table>
 				</div>
			</div>
		</div>
		<!-- 右侧 -->
		<!-- 左侧 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include>
		</div>
		<!-- 左侧 -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	
	<div id="footer-bgcontent">
	<div id="footer">
		<p><a href="<%=path %>/login.jsp">系统后台</a></p>
	</div>
	</div>
</div>
</body>
</html>
