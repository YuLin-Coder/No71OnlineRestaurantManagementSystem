<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script> 
		
        <script language="javascript">
           function xinyongAdd(user_id) //添加用户信用评价模块
           {                      //引入外部js文件，增加页面的整洁性和代码的可维护性
                   var url="<%=path %>/admin/xinyong/xinyongAdd.jsp?user_id="+user_id;
                   window.location.href=url; //跳转到用户id的xinyongAdd.jsp界面
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
					<td width="10%">账号</td>
					<td width="10%">密 码</td>
					<td width="10%">姓名</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user" varStatus="ss"> <!-- 获取用户信息，输出序号，初值为1 -->
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}<!--设置序号从1开始  -->
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.loginname}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.loginpw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.name} <!-- 取得用户的各种信息 -->
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="添加信用评价" onclick="xinyongAdd(${user.id})"/> <!-- 触发添加信用jsp文件 -->
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<c:forEach items="${requestScope.xinyongList}" var="xinyong" varStatus="sta"> 
			   &nbsp;&nbsp;&nbsp;
			   <fieldset style="width:60%; margin-left:5px;"><legend class="fieldtitle"></legend> <!-- 使用fieldset来为这几条加上框 -->
					<table class="bill" width="97%" cellpadding="4" cellspacing="4" border="0">
					    <tr>
					        <td style="width: 100">属性：${xinyong.shuxing}</td>
					    </tr>
					    <tr>
					        <td style="width: 100">评价内容：${xinyong.neirong}</td>
					    </tr>
					    <tr>
					        <td style="width: 100">评价时间：${xinyong.shijian}</td>
					    </tr>
					</table>
			   </fieldset>
			   <br/>
			   </c:forEach>
	</body>
</html>
