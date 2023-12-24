<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
   String path = request.getContextPath();  //获得当前的项目根目录路径赋值给path
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- XHTML namespace命名空间 通过http://www.w3.org/1999/xhtml来识别网页标记-->
  <head>
	<meta http-equiv="pragma" content="no-cache"/> 
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    <!-- 清除浏览器中的缓存，它和其它几句合起来用，就可以使你再次进入曾经访问过的页面时，ie浏览器必须从服务端下载最新的内容，达到刷新的效果。 --> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/> <!-- 向搜索引擎说明你的网页的关键词 -->
	<meta http-equiv="description" content="This is my page"/> <!-- 告诉搜索引擎你的站点的主要内容 -->

  </head>
  
  <frameset rows="100,*,20" cols="*" framespacing="0" frameborder="no" border="0"> <!-- 设置浏览器划分成左右100像素，剩余，20像素，上下不分，框架与框架间保留的空白的距离为0，没有框架边框，框架边框厚度为0  -->
	  <frame src="<%=path %>/admin/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" frameborder="0" />
	  <frame src="<%=path %>/admin/cont.jsp" name="mainFrame" id="mainFrame" frameborder="0" />
	  <frame src="<%=path %>/admin/foot.jsp" name="footFrame" id="footFrame" frameborder="0" />
  </frameset> <!--框架显示的界面分别是path的值/admin/top.jsp，cont.jsp，foot.jsp 框架没有滚动条 ，无法调整框架的大小，id="topframe",框架边框厚度为0-->
  <noframes><body></body></noframes> <!--noframes 元素可为那些不支持框架的浏览器显示文本 body中无文本-->
</html>
