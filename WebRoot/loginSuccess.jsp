<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
       <script type="text/javascript">
           function tiao()
           {
                   window.location.href="<%=path %>/admin/index.jsp"; //把url改变为<%=path %>/admin/index.jsp
           }
           
           setTimeout(tiao,1000) //1.3秒之后执行tiao功能，跳转到index.jsp
       </script>
       <br> <br> <br> <br> <br> <br> <br> <br> <br>
       <center><img src="<%=path %>/images/loading.gif"></center>  <!-- 在此期间展示载入动画 -->
  </body>
</html>
