package com.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB
{
	private Connection con;

	private PreparedStatement pstm;//PreparedStatement对象pstm 

	private String user = "root";//数据库登录名

	private String password = "123456";//数据库密码 记得要改

	private String className = "com.mysql.jdbc.Driver";//驱动程序对象

	private String url = "jdbc:mysql://localhost:3306/no71_db_dingcan?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
// &amp表示&,amp为'',xml转义符   jdbc:mysql://localhost:3306/db_dingcan  db_dingcan表示数据库名称一定要对应
	public DB()
	{
		try
		{
			Class.forName(className);//加载JDBC驱动程序
		} catch (ClassNotFoundException e)
		{
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	/** 创建数据库连接 */
	public Connection getCon()
	{
		try
		{
			con = DriverManager.getConnection(url, user, password);//连接数据库
		} catch (SQLException e)
		{
			System.out.println("创建数据库连接失败！");
			con = null;
			e.printStackTrace();
		}
		return con;
	}
//对数据库增删改的操作代码，传入参数
	public void doPstm(String sql, Object[] params)//params是参数集合
	{
		if (sql != null && !sql.equals(""))//要执行的sql语句不为空
		{
			if (params == null)//参数集合不为空
				params = new Object[0];//构建params

			getCon();//调用getCon()方法获取数据库连接
			if (con != null)
			{
				try
				{
					System.out.println(sql); //输出SQL语句
					pstm = con.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,//结果集可以滚动，对数据改变不敏感
							ResultSet.CONCUR_READ_ONLY);//结果集只读
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);
					}
					pstm.execute(); //得到结果集
				} catch (SQLException e)
				{
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
	}
//获取查询结果集，将其封装
	public ResultSet getRs() throws SQLException
	{
		return pstm.getResultSet();
	}
//获取更新记录的次数，可以知道更新了多少记录
	public int getCount() throws SQLException
	{
		return pstm.getUpdateCount();
	}
//关闭数据库，释放占用的资源
	public void closed()
	{
		try
		{
			if (pstm != null)
				pstm.close();
		} catch (SQLException e)
		{
			System.out.println("关闭pstm对象失败！");
			e.printStackTrace();
		}
		try
		{
			if (con != null)
			{
				con.close();
			}
		} catch (SQLException e)
		{
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
