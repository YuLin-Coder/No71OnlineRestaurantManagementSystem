<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
   String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"> <!-- 管理员界面 -->
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <link href="<%=path %>/css/cont.css" rel="stylesheet" type="text/css"/> <!-- 调用一个外部的CSS样式文件,css的链接路径是path/css/cont.css,调用的样式为stylesheet，类型是css -->
    <!--脚本类型是JavaScript-->
    <script type="text/javascript">                      
        function switchSysBar(){  
			var locate=location.href.replace('<%=path %>/admin/cont.jsp','');  //定义一个变量locate，取得当前url地址，代替上述域名
			var ssrc=document.all("img1").src.replace(locate,''); //将所有name = img1的图片地址中去掉刚才上面得到的路径， 只留下类似images/*.gif的字符串
			if (ssrc=="/dingcan/images/cont_19.gif") {//如果图片是/dingcan/images/cont_19.gif，则将它换成/dingcan/images/cont_1_19.gif，并隐藏frmTitle
				document.all("img1").src="/dingcan/images/cont_1_19.gif";
				document.all("frmTitle").style.display="none" 
			} 
			else{ 
				document.all("img1").src="/dingcan/images/cont_19.gif";
				document.all("frmTitle").style.display="";
			} //否则将图片替换成/dingcan/images/cont_19.gif，并显示frmTitle
	} 
    </script>
  </head>
  
  <body>
      <body style="overflow:hidden"> <!-- 隐藏滚动条 -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="cont_tab"> <!--表格宽度为100% 高度为100% 表中小格子边框为0，小格子中文字距离小格子距离为0，小格子之间距离为0（小格子紧密的靠在一起）样式为css中的cont_tab-->
  <tr>
    <td width="180" id="frmTitle" align="center" valign="top">
	<iframe name="left" height="100%" width="180" src="<%=path %>/admin/left.jsp" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>	</td>
    <td width="8" valign="middle" onClick="switchSysBar()"><img src="/dingcan/images/cont_19.gif" width="8" height="64" name="img1" id="img1" title="打开/关闭左侧栏" style="cursor:hand;"></td>
    <td align="center" valign="top" style="padding-right:8px;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
      <tr>
        <td height="13" style=" line-height:13px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
            <tr>
              <td class="cont_tab_l">&nbsp;</td>
              <td class="cont_tab_m">&nbsp;</td>
              <td class="cont_tab_r">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
            <tr>
              <td><iframe name="I1" height="100%" width="100%" src="<%=path %>/admin/right.jsp" border="0" frameborder="0" scrolling="auto"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
              </tr>
        </table></td>
      </tr>
      <tr>
        <td height="13" style="line-height:13px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
            <tr>
              <td class="cont_tab_bl">&nbsp;</td>
              <td class="cont_tab_bm">&nbsp;</td>
              <td class="cont_tab_br">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>

</html>
