<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head><!-- 会员注册页面 -->
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />
    
    <script type="text/javascript">
        function check1()//会员注册界面信息完整判断
	    {
	        if(document.form1.loginname.value=="")
	        {
	            alert("请输入账号");
	            return false;
	        }
	        if(document.form1.loginpw.value=="")
	        {
	            alert("请输入密码");
	            return false;
	        }
	        document.form1.submit();
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
	
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
		<!-- 进入daohang.jsp导航页面，设置如果缓存区满了，就输出数据。-->
	</div>
<!--标题头部部分-->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 中间 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">&nbsp;&nbsp;会员注册 </a></h2>
				<div class="entry">
					<form action="<%=path %>/user?type=userReg" name="form1" method="post">
												<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
													<tr>
														<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															账号：
														</td>
														<td width="80%" bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="loginname" style="width: 200px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															密码：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="password" name="loginpw" style="width: 200px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															姓名：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="name" style="width: 200px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															学号：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="studentid" style="width: 200px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															宿舍号：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="stuhost" style="width: 200px;"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9">
															&nbsp;
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="button" value="注册" onclick="check1();"/>
															<input type="reset" value="重置"/>
														</td>
													</tr>
												</table>
										  </form>
				</div>
			</div>
		</div>
		<!-- 中间 -->
		<!-- 左侧 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include><!--进入left.jsp左侧菜品类别页面，设置如果缓存区满了，就输出数据。-->
		</div>
		<!-- 左侧 -->
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
