<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <!--调用一个外部的CSS样式文件,css的链接路径是path/css/qiantai.css,调用的样式为stylesheet，输出媒介是屏幕-->
    
    <script type="text/javascript">
        var url="<%=path %>/goods?type=goodsNew"
        window.location.href=url;//跳转到该页面，传入参数
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
	<!-- 标题部分结束 -->
	<div id="header">
		<jsp:include flush="true" page="/site/inc/daohang.jsp"></jsp:include> 
		<!-- 进入daohang.jsp导航页面，设置如果缓存区满了，就输出数据。-->
	</div>
	
	
	
	<div id="page">
	<div id="page-bgtop">
		<!-- 右侧css样式设置 -->
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">1111</a></h2>
				<div class="entry">
					<p>Sed lacus. Donec lectus. Nullam prum. Proin imperdiet est. Phasellus dapibus semper urna. Pellentesque ornare,</p>
				<!-- 拉丁文排版测试 -->
				</div>
			</div>
		</div>
		<!-- 右侧css样式设置 -->
		<!-- 左侧设置 -->
		<div id="sidebar">
			<jsp:include flush="true" page="/site/inc/left.jsp"></jsp:include>
		</div>
		<!-- 左侧设置 -->
		<div style="clear: both;">&nbsp;</div><!-- clear:both该属性的值指出了不允许有浮动元素 -->
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
