<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> <!-- 返回该网页的根urlrequest.getScheme()返回协议的名称http。request.getServerName()获取服务器的名称localhost，request.getServerPort()获取端口8080-->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    <script language="javascript">
        function check()
        {
            if(document.formAdd.fujian.value=="") //如果没有提交任何图片，提示请选择文件
            {
                alert("请选择文件");
                return false;
            }
            return true;
        }
    </script>
  </head>
  
  <body>
       <form action="<%=path %>/upload/upload_re.jsp" name="formAdd" method="post"  enctype="multipart/form-data"> <!--enctype用于在上传图片和文件时对上传文件正确编码 -->
           <input type="file" name="fujian" id="fujian" onKeyDown="javascript:alert('此信息不能手动输入');return false;" /> <!--不能手动输入上传信息  -->
           <input type="submit" value="提交" onclick="return check()"/> <!-- 点击提交，执行 return check()判断是否没有提交任何图片-->
       </form>
  </body>
</html>
