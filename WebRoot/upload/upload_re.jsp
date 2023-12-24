<%@ page contentType="text/html;charset=utf-8" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>  
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
%>
<%
    //引入jspsmart.upload包实现文件上传系统
    String newFile1Name=null;
    String file_name=null; 
    
	SmartUpload mySmartUpload = new SmartUpload(); //创建SmartUpload的对象mySmartUpload

	//初始化上传mySmartUpload为pageContext，pageContext可以访问page、request、session、application范围的变量。
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try 
	{
		mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
		out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
		return;
	}
	
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())//如果没有选择图片，提示必须选择图片，直接返回当前页的上一页,
		   {
			  out.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   file_name=myFile.getFileName();//取得上传的文件的文件名
			   System.out.println("文件大小："+file_size+"文件名称："+file_name);	//取得文件的大小和文件名称		  
                   newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
                   //新文件名的字符串 是怎样产生的。具体方式为系统时间加文件名第一个遇到.号的子串
	               System.out.println("新文件名称："+newFile1Name);//输出新文件的名称
				
				   String saveurl = request.getSession().getServletContext().getRealPath("upload");//获得上传文件的路径				
				   saveurl = saveurl+"/"+newFile1Name;//保存路径
				   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);	   //将图片信息插入到数据库中      
			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>

<script language="javascript">
    document.write("上传成功"); 
	window.parent.document.getElementById("fujian").value="/upload/<%= newFile1Name%>"; //获得图片附件路径，赋值
	window.parent.document.getElementById("fujianYuanshiming").value="<%= file_name%>"; //获得附件原始名，赋值
</script>
