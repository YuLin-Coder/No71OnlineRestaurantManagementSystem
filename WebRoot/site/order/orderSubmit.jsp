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
            function back1()//返回之前的界面
	        {
	           window.history.go(-1);
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
	<!-- 头部各种功能 -->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
	</div>
	<!-- 头部各种功能 -->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 右侧 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#"></a></h2>
				<div class="entry">
                    <table width="99%" border="0" cellpadding="5" cellspacing="5" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
								              <tr>
								                  <td align="left" style="color: red">恭喜您，订单提交成功！</td>
								              </tr>
								              <tr>
								                  <td style="font-size: 15px;">订单编号：${requestScope.order.bianhao }</td>
								              </tr>
								              
								              <tr>
								                  <td style="font-size: 15px;">总金额：${requestScope.order.jine }</td>
								              </tr>
								              <tr>
								                  <td style="font-size: 15px;">下单日期:${requestScope.order.shijian }</td>
								              </tr>
								              <tr>
								                  <td style="font-size: 15px;">送货地址:${requestScope.order.songhuodizhi }</td>
								              </tr>
								              <tr>
								                  <td style="font-size: 15px;">付款方式:${requestScope.order.fukuanfangshi }</td>
								              </tr>
					        			</table>
 				</div>
			</div>
		</div>
		<!-- 右侧 -->
		<!-- 左侧菜品类别 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include>
		</div>
		<!-- 左侧菜品类别 -->
		<div style="clear: both;">&nbsp;</div> <!--clear:both该属性的值指出了不允许有浮动元素 -->
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
