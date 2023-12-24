<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head> <!-- 订单填写界面 -->
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />
    
    <script type="text/javascript">
            function back1() //返回之前的页面
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
		<!--右侧 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">填写订单</a></h2>
				<div class="entry">
                    <form action="<%=path %>/buy?type=orderSubmit" name="f" method="post">
					                        <table width="98%" align="center" border="0" cellpadding="9" cellspacing="9">
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          收货人帐号：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.loginname}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          收货人姓名：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" readonly="readonly" value="${sessionScope.user.name}"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												          送货地址：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <input type="text" name="songhuodizhi"/>
												    </td>
												</tr>
												<tr align='center'>
												    <td width="20%" bgcolor="#FFFFFF" align="left">
												                付款方式：
												    </td>
												    <td width="80%" bgcolor="#FFFFFF" align="left">
												         <select name="fukuanfangshi" style="width:155px;">
					   		                               <option value="货到付款">货到付款</option>
					   		                             </select> <!-- 下拉菜单 -->
												    </td>
												 </tr>
										    </table>
					        				<table>
					        				   <tr height="7"><td></td></tr>
							                   <tr>
							                       <td width="120"></td>
							                       <td>
							                          <input type="button" value="返回" style="width: 80px;height: 30px;" onclick="back1()">
							                       </td>
							                       <td>
							                          <input type="button" value="提交订单" style="width: 80px;height: 30px;" onclick="javascript:document.f.submit();">
							                       </td>
							                   </tr>
							               </table>
							            </form>
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
		<p><a href="<%=path %>/login.jsp">系统后台</a></p>
	</div>
	</div>
</div>
</body>
</html>
