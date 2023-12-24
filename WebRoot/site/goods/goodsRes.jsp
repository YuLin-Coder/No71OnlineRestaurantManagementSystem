<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<!-- 头部 -->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include>
	</div>
	<!-- 头部 -->
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 右侧 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">菜品信息</a></h2>
				<div class="entry">
				    <TABLE class=main border=0 cellSpacing=2 cellPadding=2>
		                  <TR>
			                  <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
			                    <c:if test="${sta.index%4==0}">
			                       </tr><tr>
			                    </c:if>
				                <TD>
				                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor=''" border=0 cellSpacing=1 cellPadding=2 width=98 bgColor=#e1e1e1 align=center height=100>
				                    <TR>
				                      <TD bgColor=#ffffff  align=left>
				                        <P align="center">
				                           <A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><IMG border=0 align=absMiddle src="<%=path %>/${goods.fujian }" width=150 height=140></A>
				                           </>
				                           <center><A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><FONT color=#ff0000></FONT>${goods.mingcheng }</A></center>
				                        </P>
				                      </TD>
				                    </TR>
				                  </TABLE>
				                </TD>
			                </c:forEach>
			              </TR>
		             </TABLE>
				</div>
			</div>
		</div>
		<!-- 右侧 -->
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
