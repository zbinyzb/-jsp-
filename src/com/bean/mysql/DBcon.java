package com.bean.mysql;
import java.sql.*;
//import java.util.*;

public class DBcon{
	public  DBcon(){

	}
	
	public static Connection getCon(){
		try{
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://127.0.0.1:3306/booksys";
			// 数据库用户名
			String USERname = "root";
			// 数据库密码
			String password = "q280654054";
			// 创建Connection连接
			Connection conn=DriverManager.getConnection(url,USERname,password);
			return conn;
		}catch(ClassNotFoundException ex1){
			ex1.printStackTrace();
			return null;
		}catch(SQLException ex2){
			ex2.printStackTrace();
			return null;
		}
	}
	
	//查询数据方法
		public static boolean queryUser(String userName,String password){
			try{
				String sql="select * from BUser where username='"+userName+
				"' and password='"+password+"'";
				Connection conn=getCon();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
//				System.out.println(userName);
				if(rs!=null ){
					rs.next();
					if(rs.getString(1).equals(userName) &&
							rs.getString(2).equals(password)){
						return true;
					}else{
						return false;
					}
				}else{
					return false;
				}
			}catch(Exception ex){
				ex.printStackTrace();
				return false;
			}
		}
		//获取借阅号
		public static String getBno(String userName,String password){
			String bno = null;
			try{
				
				String sql="select bno from BUser where username='"+userName+
				"' and password='"+password+"'";
				Connection conn=getCon();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
//				System.out.println(userName);
				if(rs!=null ){
					rs.next();
					bno = rs.getString(1);
				}else{
					
				}
			}catch(Exception ex){
				ex.printStackTrace();
				
			}
			return bno;
		}
}
		
			
		