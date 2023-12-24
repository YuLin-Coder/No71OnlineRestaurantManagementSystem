<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
            function orderDetail(order_id)//订单明细信息
	        {
	                 var url="<%=path %>/buy?type=orderDetail&order_id="+order_id; //跳转页面
	                 var n="";
	                 var w="600px";//宽度
	                 var h="500px";//高度
	                 var s="resizable:no;help:no;status:no;scroll:yes"; //不可调整大小 无帮助栏 无状态栏 有滚动条 
				     openWin(url,n,w,h,s);
	        }
	        
	       function orderDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/order?type=orderDel&id="+id; //？后传入参数，&为参数间的分隔符
               }
           }
           
           function orderShouli(id)
           {
               if(confirm('您确定受理订单吗？'))
               {
                   window.location.href="<%=path %>/order?type=orderShouli&id="+id;
               }
           }
           
           
           function huifuAdd(id)
           {
               var url="<%=path %>/admin/order/huifuAdd.jsp?id="+id;
               window.location.href=url;
           }
           
           
           function userDetail(id)
           {
               var url="<%=path %>/user?type=userDetail&id="+id;
               window.location.href=url;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="44" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">订单编号</td>
					<td width="10%">下单时间</td>
					<td width="10%">状态</td>
					
					<td width="10%">排队计时</td>
					
					<td width="15%">送货地址</td>
					<td width="10%">付款方式</td>
					<td width="10%">总金额</td>
					<td width="10%">明细</td>
					
					<td width="10%">用户信息</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" height="22">  <!--取得订单的各种信息，序号从1开始-->
					<td bgcolor="#FFFFFF" align="center">${ss.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${order.bianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${order.shijian}</td>
					<td bgcolor="#FFFFFF" align="center">
					     <c:if test="${order.zhuangtai=='no'}"> <!-- 如果状态=no，显示未受理，点击受理订单触发受理订单orderShouli（id）函数 --> 
					         未受理&nbsp;&nbsp;&nbsp;<a href="#" style="color: red" onclick="orderShouli(${order.id})" class="pn-loperator">受理订单</a>
					     </c:if>
					     <c:if test="${order.zhuangtai=='yes'}"> <!--如果状态=yes，显示已受理-->
					        已受理
					     </c:if>
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					    ${order.huifu}
					    &nbsp;&nbsp;&nbsp;<a href="#" style="color: red" onclick="huifuAdd(${order.id})" class="pn-loperator">计时</a> 
					    <!-- 点击计时可以触发huifuAdd（id）函数，来为用户进行消息回复，如几点过来取-->
					</td>
					
					<td bgcolor="#FFFFFF" align="center">${order.songhuodizhi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.fukuanfangshi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.jine}</td> <!-- 获得付款方式，送货地址，总金额信息 -->
					<td><input value="明细" type="button" onclick="orderDetail(${order.id})"/></td> 
			<!-- 点击明细触发前面定义的订单明细orderDetail（id）-->		
					<td><input value="查看用户" type="button" onclick="userDetail('${order.user_id}')"/></td> 
			<!-- 点击查看用户触发前面定义的用户明细userDetail（id）-->
					<td>
					    <input type="button" onclick="orderDel(${order.id})" value="删除"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
