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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function goodsDel(id)//删除之后，跳转到删除成功界面，并删除菜品的id，传入菜品删除的界面
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goods?type=goodsDel&id="+id;
               }
           }
           
           function goodsPre(id)//添加菜品信息函数
           {
                   window.location.href="<%=path %>/goods?type=goodsPre&id="+id;
           }
           
           function goodsAdd()//跳转到goodsAdd.jsp,完成菜品的添加
           {
                 var url="<%=path %>/admin/goods/goodsAdd.jsp";
				 window.location.href=url;
           }
           function over(picPath)//鼠标移到图片二字时显示图片的函数，并定义了图片的显示格式
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()//鼠标移开图片二字的时候什么也不显示
	       {
			  document.all.tip.style.display = "none";
		   }
		   
		   function goodsDetailHou(id)//商品具体的描述信息
           {
                 var url="<%=path %>/goods?type=goodsDetailHou&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes"; //不可改变大小，无帮助栏，无状态栏，有滚动条
				 openWin(url,n,w,h,s);//打开一个这样的窗口 高500，宽480，不可改变大小，无帮助栏，无状态栏，有滚动条
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="42" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="7%">编号</td>
					<td width="15%">名称</td>
					<td width="7%">介绍</td>
					
					<td width="7%">图片</td>
					<td width="7%">价格</td>
					<td width="7%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF">
					<td bgcolor="#FFFFFF" align="center">${sta.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.bianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.mingcheng}</td>
					<td bgcolor="#FFFFFF" align="center"><a href="#" onclick="goodsDetailHou(${goods.id})" class="pn-loperator">商品描述</a></td>
					<!--a href="#"表示联接到当前页面-->
					<td bgcolor="#FFFFFF" align="center"><div onmouseover = "over('<%=path %>/${goods.fujian}')" onmouseout = "out()" style="cursor:hand;">图片</div></td>
					<!-- 当鼠标移上去显示菜品的图片，鼠标移开时什么也不显示 -->
					<td bgcolor="#FFFFFF" align="center">${goods.shichangjia}</td> <!--市场价，即菜品的价格  -->
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="goodsDel(${goods.id})"/>
						<input type="button" value="编辑" onclick="goodsPre(${goods.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
		    
		    
		    <table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加菜品信息" style="width: 120px;" onclick="goodsAdd()" />
			    </td>
			  </tr>
		    </table>
		    
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
		    <!-- 通过绝对定位来对图片定位，下面进一步定义图片的显示格式 -->
				<TABLE id="tipTable" border="0" bgcolor="#ffffee">
					<TR align="center">
						<TD><img id="photo" src="" height="150" width="150"></TD>
					</TR>
				</TABLE>
			</div>
	</body>
</html>
