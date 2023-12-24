<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
   String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    <link href="<%=path %>/css/cont.css" rel="stylesheet" type="text/css" /> <!-- 调用一个外部的CSS样式文件,css的链接路径是path/css/cont.css,调用的样式为stylesheet，类型是css -->
    
    <script type="text/javascript">
	    function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";  
		   } //点击确定返回后台登录界面
		}
		
		function index()
		{
			   window.parent.location="<%=path %>/site/default.jsp"; 
		}//返回首页 
	</script>
	
  </head>
  
  <body style="background:url(/dingcan/images/top_05.jpg)">
      <span style="float:left;margin-left: 20px;color: white;font-size: 30px;margin-top: 30px;">网上餐厅</span>
      <!-- 标题向左浮动，距离左边20像素，白色，字体30像素，距离顶端30像素 -->
	  <span style="float:right;margin-right: 30px;margin-top: 30px;">
	     <a href="#" style="color: white;font-size: 16px;font-family: 微软雅黑" onclick="logout()">注销退出</a> <!-- 向右浮动 -->
	     <a href="#" style="color: white;font-size: 16px;font-family: 微软雅黑" onclick="index()">返回首页</a>
	  </span>
  </body>
</html>
