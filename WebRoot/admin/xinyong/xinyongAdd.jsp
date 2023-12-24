<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>  
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- 1.插入时间格式的包.2.插入处理时间的包。34.使用JSTL（JSP标准标签库）5.使得EL不当成字符串处理-->
	<head> 
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" /> 
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
            function c() //如果评价内容为空，提示请输入评论内容
            {
                if(document.formAdd.neirong.value=="") 
                {
                    alert("请输入评价内容");
                    return false;
                }
                
                document.formAdd.submit();  //如果不为空则提交信息
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'> <!-- 距离左边为2，距离上面为9，背景图片为。。 -->
			<form action="<%=path %>/xinyong?type=xinyongAdd" name="formAdd" method="post"> <!--表单的方法为提交  -->
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                         评价属性：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="radio" name="shuxing" value="好评" checked="checked" style="border: 0px;"/>好评
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="shuxing" value="差评" style="border: 0px;"/>差评
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                         评价内容：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="neirong" size="40"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                         评价时间：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="shijian" size="40" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>"/> 
						        <!-- 取得系统当前时间，格式为yyyy年-MM月-dd号 HH点：mm分 -->
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="user_id" value="<%=request.getParameter("user_id") %>"/> <!-- 插入隐藏域，获得用户的id -->
						       <input type="button" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
