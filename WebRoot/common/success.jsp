<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getAttribute("path").toString();
	String message = request.getAttribute("message").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<html>
<script language="javascript"> 
    <% if(message != null) { %>
		alert("<%=message%>"); //如果 message不为空，弹出message信息
	<% } %>
	<% if(path != null) { %>
		document.location.href = "<%=path%>"; //如果路径不为空，跳转到取得的path路径
	<% } else {%>
		window.history.back(); //否则返回历史记录中上一界面
	<% } %>
</script>
<body> 
</body> 
</html>
