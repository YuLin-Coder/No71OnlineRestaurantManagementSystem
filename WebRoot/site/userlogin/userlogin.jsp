<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
	<script type="text/javascript">
	        function login()//会员登录信息完整的判断
	        {
	           if(document.userLogin.loginname.value=="")
	           {
	               alert("请输入账号");
	               return;
	           }
	           if(document.userLogin.loginpw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.getElementById("indicator").style.display="block";//设置成块级元素，带自动换行
	           loginService.login(document.userLogin.loginname.value,document.userLogin.loginpw.value,1,callback);//判断账号密码是否正确
	        }
	        
	        function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    if(data=="no")//账号密码错误，返回fail.jsp页面
			    {			       
			        var url="<%=path %>/common/fail.jsp";
			        window.location.href=url;
			    }
			    if(data!="no")//返回的data就是用户的id，当账号密码正确时
			    {			        
			        var url="<%=path %>/common/succ.jsp";
			        window.location.href=url;
			    }
			}
	        
	</script>
  </head>
  
  <body>
		<form name="userLogin" method="POST" action="">
		      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
		          <tr>
		            <td align="center" colspan="2" height="10"></td>
		          </tr>
		          <tr>
		            <td align="right" width="31%" height="30" style="font-size: 11px;">账号：</td>
		            <td align="left" width="69%"><input type="text" name="loginname" style="width: 100px;"/></td>
		          </tr>
		          <tr>
		            <td align="right" height="30" style="font-size: 11px;">密码：</td>
		            <td align="left"><input type="password" name="loginpw" style="width: 100px;"/></td>
		          </tr>
		          <tr>
		            <td align="center" colspan="2" height="5"></td>
		          </tr>
		          <tr>
		            <td align="right" height="30" style="font-size: 11px;">&nbsp;</td>
		            <td align="left">
		               <input type="button" value="登 录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
					   &nbsp;
					   <input type="reset" value="重 置" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
		               <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/> <!-- id：indicator插入载入动画 -->
		            </td>
		          </tr>
		      </table>
	    </form>
  </body>
</html>
