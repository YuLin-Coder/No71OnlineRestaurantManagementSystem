<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
   String path = request.getContextPath();
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/> <!--左侧菜单栏的代码描述如下 -->

    <link href="<%=path %>/css/cont.css" rel="stylesheet" type="text/css"> <!-- 调用一个外部的CSS样式文件,css的链接路径是path/css/cont.css,调用的样式为stylesheet，类型是css -->
	<style type="text/css">
	   .STYLE1 {color: #FFFFFF;font-size: 12px;}
	</style>
    
    <script type="text/javascript">
        function show(str)
		{
			var str1="td"+str;
			var str="show"+str;  
			document.getElementById("td1").style.background="url('/dingcan/images/l_b_03.gif')";//每添加一个菜单，都要在这里添加。 getElementById得到id=td1的值，即修改登录密码
			document.getElementById("td2").style.background="url('/dingcan/images/l_b_03.gif')";
			document.getElementById("td3").style.background="url('/dingcan/images/l_b_03.gif')";
			document.getElementById("td4").style.background="url('/dingcan/images/l_b_03.gif')";
			document.getElementById("td5").style.background="url('/dingcan/images/l_b_03.gif')";
			document.getElementById("td6").style.background="url('/dingcan/images/l_b_03.gif')";
			document.getElementById("show1").style.display="none";
			document.getElementById("show2").style.display="none";
			document.getElementById("show3").style.display="none";
			document.getElementById("show4").style.display="none";
			document.getElementById("show5").style.display="none";
			document.getElementById("show6").style.display="none";
			document.getElementById(str1).style.background="url('/dingcan/images/l_b_05.gif')";
			document.getElementById(str).style.display="block";//变成块级元素
		}//迭代使用show函数，使用show函数完成叠菜单
		function sho(str)
		{
			var str1="t"+str;
			var str="sho"+str;
			document.getElementById("t1").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("t2").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("t3").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("t4").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("t5").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("t6").style.background="url('/dingcan/images/2_14.gif')";
			document.getElementById("sho1").style.display="none";
			document.getElementById("sho2").style.display="none";
			document.getElementById("sho3").style.display="none";
			document.getElementById("sho4").style.display="none";
			document.getElementById("sho5").style.display="none";
			document.getElementById("sho6").style.display="none";
			document.getElementById(str1).style.background="url('/dingcan/images/3_13.gif')";
			document.getElementById(str).style.display="block";
		}
    </script>
  </head>
  
  <body>
      <table width="180" height="100%" border="0" cellpadding="0" cellspacing="0"> <!--表格宽度为180 高度为100% 表中小格子边框为0（无边框），小格子中文字距离小格子距离为0，小格子之间距离为0（小格子紧密的靠在一起）-->
  		 <tr>
		    <td height="34">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0"> <!-- 在表中再建立一个表分成3部分放入图片组成一栏 -->
			      <tr>
			        <td width="48"><img src="/dingcan/images/left_09.gif" width="48" height="34"></td>
			        <td align="center" background="/dingcan/images/left_10.gif"><span class="STYLE1">导航菜单</span></td> <!--定义行内元素导航菜单样式为STYLE1-->
			        <td width="48"><img src="/dingcan/images/l_09.gif" width="48" height="34"></td> <!--在34高度上插入3个图片组成一栏 -->
			      </tr>
			    </table>
		    </td>
         </tr>
         <tr>
            <td valign="top" background="/dingcan/images/left_bg_03.gif" class="left_mid">  <!-- 放置顶端图片 为left_mid类型-->
	            <table width="100%" border="0" cellpadding="0" cellspacing="0">			      
			        <tr>
			            <td class="menu_first_img mouse" id="td1" onClick="show(1)">&nbsp; <!-- 点击触发show（1），即打开下拉菜单 -->
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">   <!-- 这一行左边距30px -->
			                                                      修改登录密码
			               </span>
			            </td>
			        </tr>
			        <!-- 1111 -->
                    <tr>
				        <td id="show1" style="display:none;"> 
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/admin/userinfo/userPw.jsp" target="I1" style="color: black;">修改登录密码</a>  <!-- 点击修改密码，进入path/admin/userinfo/userPw.jsp界面 -->
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                    <!-- 1111 -->
			        <tr>
			            <td class="menu_first_img mouse" id="td2" onClick="show(2)">&nbsp;
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">
			                                                         菜品类别管理
			               </span>
			            </td>
			        </tr>			        
                    <tr>
				        <td id="show2" style="display:none;">
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/catelog?type=catelogMana" target="I1" style="color: black;">菜品类别管理</a> <!-- ?是AJAX技术，？后面可以接传递的参数 -->
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>                              
                               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/admin/catelog/catelogAdd.jsp" target="I1" style="color: black;">添加菜品类别</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                    <!-- 1111 -->
			        <tr>
			            <td class="menu_first_img mouse" id="td3" onClick="show(3)">&nbsp;
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">
			                                                      菜品信息管理
			               </span>
			            </td>
			        </tr>
                    <tr>
				        <td id="show3" style="display:none;">
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/goods?type=goodsMana" target="I1" style="color: black;">菜品信息管理</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/admin/goods/goodsAdd.jsp" target="I1" style="color: black;">菜品信息添加</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                    <!-- 1111 -->
			        <tr>
			            <td class="menu_first_img mouse" id="td4" onClick="show(4)">&nbsp;
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">
			                                                      会员信息管理
			               </span>
			            </td>
			        </tr>
                    <tr>
				        <td id="show4" style="display:none;">
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/user?type=userMana" target="I1" style="color: black;">会员信息管理</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                    <!-- 1111 -->
			        <tr>
			            <td class="menu_first_img mouse" id="td5" onClick="show(5)">&nbsp;
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">
			                                                     订单信息管理
			               </span>
			            </td>
			        </tr>
                    <tr>
				        <td id="show5" style="display:none;">
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/order?type=orderMana" target="I1" style="color: black;">订单信息管理</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                    
                    <!-- 1111 -->
			        <tr>
			            <td class="menu_first_img mouse" id="td6" onClick="show(6)">&nbsp;
			               <span style="margin-left: 30px;font-family: 微软雅黑;color: white;font-size: 15px;">
			                                                     留言信息管理
			               </span>
			            </td>
			        </tr>
                    <tr>
				        <td id="show6" style="display:none;">
				            <table width="100%" border="0" cellspacing="0" cellpadding="0">
				               <tr>
				                   <td class="left">
					                  <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
							              <tr>
							                <td width="140" align="center">
							                    <span style="margin-left: 50px;font-family: 微软雅黑;font-size: 14px;">
							                        <a href="<%=path %>/liuyan?type=liuyanMana" target="I1" style="color: black;">留言信息管理</a>
							                    </span>
							                </td>
							                <td>&nbsp;</td>
							              </tr>
							          </table>
				                   </td>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- 1111 -->
                </table>
            </td>
         </tr>
		 <tr>
		    <td height="13"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		       <tr>
		           <td width="48"><img src="/dingcan/images/left_31.gif" width="48" height="13"></td>
		           <td background="/dingcan/images/left_32.gif" class="left_b_m">&nbsp;</td>
		           <td width="48"><img src="/dingcan/images/left_31_l.gif" width="48" height="13"></td>
		       </tr>
		    </table></td>
		  </tr>
      </table>
  </body>
</html>
