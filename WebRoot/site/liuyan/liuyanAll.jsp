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
    
    <style rel="stylesheet" type="text/css">
	    .c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
    
    <script type="text/javascript">
            function liuyanAdd()//添加留言,上面设置了向右浮动，dashed虚线框，上边框，无浮动元素
	        {
		             <c:if test="${sessionScope.userType!=1}">//如果没有登录
	                    alert("请先登录");
	                 </c:if>
	                 <c:if test="${sessionScope.userType==1}">//如果登录了，创建个窗口，重载当前页面
	                    var strUrl = "<%=path %>/site/liuyan/liuyanAdd.jsp";
		                var ret = window.open(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
		                window.location.reload();
	                 </c:if>
	        }
	        
	        function liuyanDetail(id)//留言明细
	        {
	             var strUrl = "<%=path %>/liuyan?type=liuyanDetail&id="+id;
	             var ret = window.open(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
	<!-- 头部-->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
	</div>
	<!-- 头部 -->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 中间 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">&nbsp;&nbsp;留言板模块 </a></h2>
				<div class="entry">
					<c:forEach items="${requestScope.liuyanList}" var="liuyan">
										   <div class="c1-bline" style="padding:7px 0px;">
										       <div class="f-left">
										           &nbsp;&nbsp;&nbsp;
											       <img src="<%=path %>/images/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
										           <a href="#" onclick="liuyanDetail(${liuyan.id })">${liuyan.neirong}</a>
										       </div>
										      <div class="f-right">${liuyan.liuyanshi}</div>
										      <div class="clear"></div>
										  </div>
										</c:forEach>
										<br/>
										<center>
										   <a href="#" onclick="liuyanAdd()" style="color: red">我要留言</a>
										</center>
				</div>
			</div>
		</div>
		<!-- 中间 -->
		<!-- 左侧 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include>
		</div>
		<!-- 左侧 -->
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
