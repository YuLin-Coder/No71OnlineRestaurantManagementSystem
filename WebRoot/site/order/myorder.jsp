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
    
    <script type="text/javascript">
	        function orderDetail(order_id)//订单明细函数
	        {
                 var strUrl="<%=path %>/buy?type=orderDetail&order_id="+order_id;//传入参数
                 var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			     //点击订单明细，弹出窗口，宽800px，高500px，无状态栏，目录栏可见，有滚动栏，不可改变大小
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
	<!-- 我的订单页面的头部菜单栏daohang.jsp -->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
	</div>
	<!-- 我的订单页面的头部菜单栏daohang.jsp  -->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 右侧 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">我的订单</a></h2>
				<div class="entry">
					 <c:forEach items="${requestScope.orderList}" var="order">
						               <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
											<table class="bill" width="97%" cellpadding="4" cellspacing="4">
											    <tr>
											        <td>订单编号：${order.bianhao}</td>
											    </tr>
											    <tr>
											        <td>下单时间：${order.shijian}</td>
											    </tr>
											    <tr>
											        <td>
											                                订单状态：
											           <c:if test="${order.zhuangtai=='no'}"> <!-- if的插入 -->
												                             未受理
												       </c:if>
												       <c:if test="${order.zhuangtai=='yes'}">
												                             已受理
												       </c:if>
											        </td>
											    </tr>
											    <tr>
											        <td>排队计时：${order.huifu}</td>
											    </tr>
											    <tr>
											        <td>送货地址：${order.songhuodizhi}</td>
											    </tr>
											    <tr>
											        <td>付款方式：${order.fukuanfangshi}</td>
											    </tr>
											    <tr>
											        <td>总金额：${order.jine}&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="orderDetail(${order.id})"/>订单明细</a></td>
											    </tr>
											</table>
									   </fieldset>
									   <br/>
									   </c:forEach>                      
 				</div>
			</div>
		</div>
		<!-- 右侧 -->
		<!-- 左侧菜品类别 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include>
		</div>
		<!-- 左侧菜品类别 -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	
	<div id="footer-bgcontent">
	<div id="footer">
		<p> <a href="<%=path %>/login.jsp">系统后台</a></p>
	</div>
	</div>
</div>
</body>
</html>
