package com.bean.mysql;
import java.sql.*;
//import java.util.*;

public class DBcon{
	public  DBcon(){

	}
	
	public static Connection getCon(){
		try{
			// �������ݿ�������ע�ᵽ����������
			Class.forName("com.mysql.jdbc.Driver");
			// ���ݿ������ַ���
			String url = "jdbc:mysql://127.0.0.1:3306/booksys";
			// ���ݿ��û���
			String USERname = "root";
			// ���ݿ�����
			String password = "q280654054";
			// ����Connection����
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
	
	//��ѯ���ݷ���
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
		//��ȡ���ĺ�
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
		
			
		