<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

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
            <ul>
				<!-- <li>
					<h2>会员登录</h2>
					<p>Mauris vitae nisl n ornare, orci in consectetuer hendrerit, volutpat.</p>
				</li> -->
				<li>
					<h2>菜品类别</h2>
					<ul>
					    <c:forEach items="${sessionScope.catelogList}" var="catelog">
						<li><a href="<%=path %>/goods?type=goodsByCatelog&catelog_id=${catelog.id}">${catelog.name}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li>
					
					
					
					
					
					
				</li>
			</ul>
  </body>
</html>
