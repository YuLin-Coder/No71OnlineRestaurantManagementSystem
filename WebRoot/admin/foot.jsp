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
  </head>
  
  <body>
     <div id="foot"></div> <!-- div起到分割作用，div的id=food 颜色为蓝色-->
  </body>
</html>
