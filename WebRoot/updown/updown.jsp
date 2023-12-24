<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!--功能已删除-->
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body> 
      <% 
          try
          {
              String fujianPath=request.getParameter("fujianPath");//获得图片路径
	          String fujianYuashiMing=request.getParameter("fujianYuashiMing");//获得图片的原始名
	          fujianYuashiMing=java.net.URLDecoder.decode(fujianYuashiMing,"UTF-8");//图片原始名的编码方式
	          System.out.println(fujianYuashiMing+fujianPath);//输出图片的原始名和路径
	          
	          SmartUpload su = new SmartUpload(); // 新建一个SmartUpload对象 
	
	          su.initialize(pageContext); // 初始化 
	
	          su.setContentDisposition(null); 
	          // 设定contentDisposition为null以禁止浏览器自动打开文件， 
	          //保证点击链接后是下载文件。若不设定，则下载的文件扩展名为 
	          //doc时，浏览器将自动用word打开它。扩展名为pdf时，将用acrobat打开	          	         
	          su.downloadFile(fujianPath, null, new String(fujianYuashiMing.getBytes(), "ISO8859-1")); // 下载中文文件	         
	          out.clear();
	          out=pageContext.pushBody(); 
          }
          catch(Exception e)
          {%>
              <script type="text/javascript">
                    alert("文件不存在。请联系管理人员");
                    window.history.back();
              </script>
        <%}
      %> 

      
  </body>
</html>
