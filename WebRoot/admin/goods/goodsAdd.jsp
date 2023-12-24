<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           var i=0;
           function catelogAll()//获得所有菜品类别函数
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
                   i=1;
               }             
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           
           function up() //上传图片函数 通过Popup.js打开对话框
	       {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});//pop类型为1，内嵌iframe，关闭后不重新加载页面
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");//跳转到上传界面
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
	       }
           
           function check()//检查信息是否输入完整
           {
               if(document.formAdd.catelog_id.value==0)
               { 
                   alert("请选择类别");
                   return false;
               }
               
               if(document.formAdd.bianhao.value=="")
               { 
                   alert("请输入编号");
                   return false;
               }
               if(document.formAdd.mingcheng.value=="")
               { 
                   alert("请输入名称");
                   return false;
               }
               return true;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/goods?type=goodsAdd" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         类别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="catelog_id" id="catelog_id" style="width: 250px;" onclick="catelogAll()">
									              <option value="0">请选择类别</option>
									          </select>
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/> 
							                  <!-- 插入载入动画 -->
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         编号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bianhao" style="width: 250px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						               名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="mingcheng" style="width: 250px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="jieshao"  basePath="/fckeditor" width="550" height="200" value="" toolbarSet="Basic">
	                            </FCK:editor> <!-- 添加fck编辑器，名字叫介绍，基于路径/fckeditor，宽，高，初值为空，基础形式 -->
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        图片：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fujian" id="fujian" style="width: 250px;" readonly="readonly"/>
						        <input type="button" value="上传" onclick="up()"/> <!-- 上传触发up（）函数 -->
						        <input type="hidden" name="fujian" id="fujian"/> 
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						              价格：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="shichangjia" value="100" style="width: 250px;" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    	<!--插入菜品的价格框，onpropertychange当输入框属性变化时，触发onchange1属性，修改数据库菜品价格 下一句为按键之后触发将输入值为非数字的字符替换为空，粘贴之后触发将输入值为非数字的字符替换为空-->
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
