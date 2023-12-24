<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'orderDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
         a:link          { color: #000000; text-decoration: none } //链接平常的状态，超链接无下划线
		 a:visited       { color: #000000; text-decoration: none } //链接被访问之后，超链接无下划线
		 a:active        { color: #000000; text-decoration: none } //鼠标放到连接上的时候，超链接无下划线
		 a:hover         { color: #ff0000; text-decoration: none; position: relative; right: 0px; top: 1px } //连接被按下的时候，超链接无下划线，相对定位（随窗口大小变化而变化）
		
		.C_Font{ font-weight:bold;}
		.Red{ color:#FF0000; font-weight:bold;}
		.Sell_Title{ text-align:center;background:url(<%=path %>/images/icon_sell.gif) top no-repeat left;
		 font-weight:bold; font-size:14px; color:#FFFFFF; height:30px;}
		.UserName{ padding:4px 0;}
		.UserName input{ width:100px; border:1px solid #666;}
		.UserRegster{  padding:5px 8px 5px 0;}
		.UserRegster a,.UserRegster a:link,.UserRegster a:visited{ color:#f50;}
		.UserRegster input{ background:url(<%=path %>/images/button.gif) no-repeat; width:73px; height:23px; border:0px; cursor:hand;}
		.LoginTitle{text-align:center;background:url(<%=path %>/images/icon_login.gif) top no-repeat left;font-weight:bold; font-size:14px; color:#FFFFFF; height:30px;}
		.Logo{ text-align:center; vertical-align:top; margin:8px 0;}
		.Item01Menu{ text-align:right; vertical-align:top;}
		.Item01Menu a{ padding:2px 10px; background:url(<%=path %>/images/dot_main01.gif) no-repeat left;}
		.C_Item_Title{ background:url(<%=path %>/images/icon05.gif) no-repeat center;font-weight:bold; text-align:center; color:#fff; height:34px;}
		.C_Item_Title a,.C_Item_Title a:link,.C_Item_Title a:visited{font-weight:bold; text-align:center; color:#fff;}
		
		.C_login_Title{ background:url(<%=path %>/images/heng.gif) no-repeat center;font-weight:bold;font-size:12px; text-align:center; color:#fff; height:34px; padding-top:10px;}
		.C_Sell_Title{ background:url(<%=path %>/images/icon03.gif) no-repeat center;font-weight:bold; text-align:center; color:#fff; height:34px; padding-top:10px;}
		.C_DC_Title{ background:url(<%=path %>/images/DC.gif) no-repeat center;font-weight:bold; text-align:center; color:#fff; height:34px; padding-top:10px;}
		.C_Sort_Title{ background:url(<%=path %>/images/heng.gif) no-repeat center;font-weight:bold;font-size:12px; text-align:center; color:#fff; height:34px; padding-top:10px;}
		.C_Sort_Title a,.C_Sort_Title a:link,.C_Sort_Title a:visited{ color:#fff;}
		.C_Search_Title{ background:url(<%=path %>/images/Recomm_05.gif) no-repeat center;font-weight:bold; text-align:center; color:#fff; height:34px; padding-top:10px;}
		.C_Help_Title{ padding:4px 0;}
		.C_Help_Title a{ background:url(<%=path %>/images/icon_sell.gif) no-repeat center;font-weight:bold;  color:#fff; height:24px;  padding-left:15px; width:175px; padding-top:5px;}
		.C_Help_Title a,.C_Help_Title a:link,.C_Help_Title a:visited{ color:#fff;}
		
		.C_Goods_Title{ border:1px solid #ccc; background:url(<%=path %>/images/Bule_46.gif) repeat-x; margin-bottom:5px; height:32px;}
		.C_Goods_Border{ border-top:4px solid #4380CC; padding-top:10px;}
		.C_Item_bg{ background:url(<%=path %>/images/Bule_56.gif) repeat-y; padding:3px 8px;}
		.C_pages{ padding:5px 10px; text-align:center;}
		
		.C_Input{ background:url(<%=path %>/images/button2.gif) no-repeat; width:73px; height:23px; border:0px; cursor:hand; color:#333;}
		.input{ color:#f50;height:18px; }
		.C_Input02{background:url(<%=path %>/images/button.gif) no-repeat; width:73px; height:23px; border:0px; cursor:hand; color:#333;}
		.C_Input03{background:url(<%=path %>/images/btn_2.png) no-repeat; width:69px; height:28px; border:0px; cursor:hand; color:#fff;}
		.Register{background:url(<%=path %>/images/btn_1.png) no-repeat; width:105px; height:28px; border:0px; cursor:hand;  text-align:center; padding-top:6px;}
		//no-repeat不平铺
		.Order_Table{ margin:15px 0;}
		.Order_Table td{ font-size:14px;}
		.Order_Font{ color:#FF0000; font-weight:bold;}
		.Order_Title{ font-size:14px; font-weight:bold; padding:4px 5px;}
		.Order_Total{  font-weight:bold; padding:5px 10px 0 10px; color:#FF0000; text-align:center; font-size:14px;}
		.Car_Leftbg{ background:url(<%=path %>/images/Car_05.gif) repeat-y left; width:8px;}
		.Car_Rightbg{ background:url(<%=path %>/images/Car_13.gif) repeat-y right; width:8px;}
		.C_Carbg_Default{ background:url(<%=path %>/images/Car_21.gif) no-repeat center;font-size:12px; text-align:center; width:150px;}
		.C_Carbg_Current{ background:url(<%=path %>/images/Car_18.gif) no-repeat center;font-size:12px; text-align:center; color:#fff; width:150px;}
		.Onlinpay{
		}
		.Onlinpay input{ background:url(<%=path %>/images/Car_icon_07.gif) no-repeat center; width:115px; height:30px; border:0px; cursor:hand; padding-bottom:8px; padding-right:8px;}
		
		.textBox{
			border-bottom:1px;
			border-left:1px;
			border-right:1px;
			border-top:1px;
			border-color:#666666;
			border-style:solid;
		}
		
		.itemTitle {
			font-family: "黑体", "Arial Black";
			font-size: 16px;
			line-height: 40px;
			font-weight: 200;
			color: #000000;
			text-decoration: none;
			letter-spacing: 5px;  
		} //字母间距5px
		
		.blueText {
			font-family: "宋体", System;
			font-size: 12px;
			line-height: 20px;
			color: #0033CC;
			text-decoration: none;
		}
		
		.redText {
			font-family: "宋体", System;
			font-size: 12px;
			line-height: 20px;
			color: #FF0000;
			text-decoration: none;
		}
		
		
		.text {
			font-family: "宋体", System;
			font-size: 12px;
			line-height: 20px;
			color: #000000;
			text-decoration: none;
		}
		
		
		.body {
			margin-left: 0px;
			margin-top: 2px;
			margin-right: 0px;
			margin-bottom: 2px;
			background-image: url(<%=path %>/images/backGroup.gif);	
		}
		
		
		.header_menu{background:url(<%=path %>/images/header_menu_02.gif) repeat-x;}
		
		
		.whiteTitle{
			font-family: "宋体", System;
			font-size: 13px;
			line-height: 20px;
			font-weight: bold;
			color: #FFFFFF;
			text-decoration: none;	
		}
		
		
		.whiteText {
			font-family: "宋体", System;
			font-size: 12px;
			line-height: 20px;
			color: #FFFFFF;
			text-decoration: none;
		}
		
		.blackTitle {
			font-family: "宋体", System;
			font-size: 12px;
			font-weight: bold;
			line-height: 20px;
			color: #000000;
			text-decoration: none;
		}
    </style>
	
  </head>
  
  <body class="body" leftmargin="0" rightmargin="0">
     <table cellspacing="1" cellpadding="0" width="100%" border="0" bgcolor="#F7F3F7">
          <tr height="26">
              <td class="blackTitle" align="center">商品名称</td>
              <td class="blackTitle" align="center">购买数量</td>
              <td class="blackTitle" align="center">购买价格</td>
          </tr>
		  <c:forEach items="${requestScope.orderItemList}" var="orderItem">
		  <tr class="text" align="center" bgcolor="#FFFFFF">
			  <td>${orderItem.goods.mingcheng}</td>
			  <td>${orderItem.goods_quantity}</td>
			  <td>${orderItem.goods.tejia}</td>
		  </tr>
		  </c:forEach>
  	</table>
  </body>
</html>
