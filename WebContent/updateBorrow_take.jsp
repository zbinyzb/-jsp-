<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改结果</title>
</head>
<body>
<%
			request.setCharacterEncoding("UTF-8");
			String bno = request.getParameter("bno");
			String tno = request.getParameter("tno");
			//System.out.println(bno);
			//String bno = (String)session.getAttribute("bno");
			String bstate= request.getParameter("bstate");
			//判断当前状态
			if("归还".equals(bstate)) {
				bstate = "未归还";
				try {
					// 加载数据库驱动，注册到驱动管理器
					Class.forName("com.mysql.jdbc.Driver");
					// 数据库连接字符串
					String url = "jdbc:mysql://127.0.0.1:3306/booksys";
					// 数据库用户名
					String username = "root";
					// 数据库密码
					String password = "q280654054";
					// 创建Connection连接
					Connection conn = DriverManager.getConnection(url,username,password);
					// 添加图书信息的SQL语句
					System.out.println("数据库成功");
					String sql = "update BorrowI set bstate=?,bno=?  where tno='"+tno+"'";
					// 获取PreparedStatement
					PreparedStatement ps = conn.prepareStatement(sql);
					// 对SQL语句中的第1个参数赋值
					ps.setString(1,bstate);
					ps.setString(2,bno);
					
					// 执行更新操作，返回所影响的行数
					int row = ps.executeUpdate();
					// 判断是否更新成功
					if(row > 0){
						// 更新成输出信息
						out.print("修改成功！！");
					}
				   // 关闭PreparedStatement，释放资源
					ps.close();
					// 关闭Connection，释放资源
					conn.close();
				} catch (Exception e) {
					out.print("借阅信息修改失败！");
					%><a href="Borrow.jsp">修改失败！</a>
					<% e.printStackTrace();
				}
			}else {
				out.print("该书已被借走！！");
			}
			

	%>
	<br>
	<a href="Borrow.jsp">返回借阅图书界面</a>
</body>
</html>