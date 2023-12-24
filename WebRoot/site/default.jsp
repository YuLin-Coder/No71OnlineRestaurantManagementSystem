<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><!-- 返回该网页的根urlrequest.getScheme()返回协议的名称http。request.getServerName()获取服务器的名称localhost，request.getServerPort()获取端口8080-->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
        <script type="text/javascript">
            var url="<%=path %>/index?type=index"
            window.location.href=url;//默认跳转的界面的地址
        </script>
  </body>
</html>
