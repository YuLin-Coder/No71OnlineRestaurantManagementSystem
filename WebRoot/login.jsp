<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
   String path = request.getContextPath();//获得当前的项目根目录路径赋值给path
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <style type="text/css">  
        BODY {
			FONT-FAMILY: 宋体, Arial, Helvetica, sans-serif; BACKGROUND: url(<%=path %>/images/LoginBg.jpg) #669acc repeat-x left top; FONT-SIZE: 12px
		}
		#Sizer {
			MARGIN: 114px auto 0px; WIDTH: 656px; BACKGROUND: url(<%=path %>/images/LoginBg2.jpg); HEIGHT: 364px; OVERFLOW: hidden
		}
		TABLE {
			MARGIN-TOP: 60px; WIDTH: 400px; MARGIN-LEFT: 120px
		}
		TABLE THEAD {
			TEXT-ALIGN: left; LINE-HEIGHT: 40px; TEXT-INDENT: 50px; HEIGHT: 40px; FONT-WEIGHT: bold;font-family: 微软雅黑
		}
		TABLE TH {
			TEXT-ALIGN: right; LINE-HEIGHT: 35px; WIDTH: 100px; HEIGHT: 35px; FONT-WEIGHT: normal;font-family: 微软雅黑
		}
		TABLE TD SPAN {
			LINE-HEIGHT: 30px; CURSOR: pointer; TEXT-DECORATION: underline;font-family: 微软雅黑
		}
		.txt {
			LINE-HEIGHT: 16px; WIDTH: 200px; HEIGHT: 16px;font-family: 微软雅黑
		}
		.cktxt {
			LINE-HEIGHT: 16px; WIDTH: 100px; HEIGHT: 16px;font-family: 微软雅黑
		}
    </style>
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script language="javascript">
		 function check1() //上面引入javascript文件来引入对象处理 #sizer上边距为114像素，右边距自动，下边距0，宽度656px，背景为图片，高度为364px，内容区内容溢出，内容被修剪，并且其余内容是不可见的
		 {                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入账号");
				document.ThisForm.userName.focus();
				return false;
			 } //如果账号为空提示输入账号，使用focus，使得在点击文本框时获得光标，点击到外边时光标消失 
			 document.getElementById("indicator").style.display="block"; //设置为块级元素，使得两块级元素之间换行，载入动画的id叫indicator
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);  //使用src里面定义的loginService，来实现对账号密码的验证，之后执行callback函数			
		 }
		
		 function callback(data) //账号密码错误，提示账号或密码错误，账号密码正确，提示通过验证，系统登录成功
		 {
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("账号或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		 }
    </script>
    
  </head>
  
  <body>
	<DIV id=Sizer>
		<FORM method=post name=ThisForm action="<%=path %>/admin/index.jsp"> <!-- 表单的数据发送到action属性的页面 -->
		<TABLE border=0 cellSpacing=0 cellPadding=0> <!--表中小格子边框为0，小格子中文字距离小格子距离为0，小格子之间距离为0（小格子紧密的靠在一起）-->
		    <THEAD> <!-- 表格的表头 tr行，td列 横跨2列 对齐为居中 字体样式是23像素-->
		    <TR><TD colSpan=2 align="center" style="font-size: 23px;">网上订餐系统



</TD></TR>
		    </THEAD>
		    
		    <TBODY>
		    <TR>
			    <TH>账号：</TH>
			    <TD><INPUT class=txt type=text name=userName></TD> <!-- 输入框类为txt 类型为文本 -->
		    </TR>
		    <TR>
			    <TH>密码：</TH>
			    <TD><INPUT class=txt type=password name=userPw></TD>
			</TR>
	        <TR>
	            <TH>&nbsp;</TH>
	            <TD>
	               <INPUT class=btn value=系统登录 type=button name=submit style="font-family: 微软雅黑" onClick="check1()"> <!-- 类名为btn，点击触发check1（）事件检查账号密码是否符合规范 -->
			       &nbsp;&nbsp;&nbsp;&nbsp; 
			       <INPUT class=btn value=重新输入 type=reset name=reset style="font-family: 微软雅黑"> 
			       <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/> <!-- 插入载入中动画 -->
	            </TD>
	        </TR>
		    </TBODY>
		</TABLE>
		</FORM>
	</DIV>
  </body>
</html>
