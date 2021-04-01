<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">  
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript">
			function del() {
				if(!confirm("确认要删除？")) {
					window.event.returnValue = false;
				}
			}
		</script>
		<title>借阅信息管理</title>
	
	</head>

	<body>

	<div class="container">
			<form action="findBorrow.jsp" target="bottom" class="form-inline ">
				<h2>借阅管理</h2>
				<div class="form-group search" id="a3">
					<input type="text" name="check" class="form-control" placeholder="请输入借阅证号或图书编号"  />
					&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" class="btn btn-primary" value="搜索" />
					&nbsp;&nbsp;&nbsp;<button class="btn btn-warning add"><a href="addBorrow.jsp" target="bottom">添加借阅信息</a></button>
				</div>
			</form>
			
		
				<table class="table table-hover">
					<thead>	
						<tr>
							<th>借阅证号</th>
							<th>图书编号</th>
							<th>借阅日期</th>
							<th>续借日期</th>
							<th>归还日期</th>
							<th>罚款金额</th>
							<th>借阅状态</th>
							<th>操作</th>							
						</tr>
					</thead>
					<tbody>
	<%
	//查询功能
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("check");
	String sql;
	if(search.matches("[0-9]+")){
		sql = "SELECT * FROM BorrowI where bno like '%"+search+"%'";
	}else{
		sql = "SELECT * FROM BorrowI where tno like '%"+search+"%'";
	}

	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		// 数据库连接字符串
		String url = "jdbc:mysql://127.0.0.1:3306/booksys";
		// 数据库用户名
		String username = "root";
		// 数据库密码
		String password = "q280654054";
		// 创建Connection连接
		Connection conn = DriverManager.getConnection(url,username,password);
		System.out.println("数据库成功");
		Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery(sql);
        %>
        <%   while(rs.next()){%>
        	  <td><%=rs.getString("bno") %></td>
        	  <td><%=rs.getString("tno") %></td>
        	  <td><%=rs.getString("bdate") %></td>
        	  <td><%=rs.getString("redate") %></td>
        	  <td><%=rs.getString("retdate") %></td>
        	  <td><%=rs.getString("fprice") %></td>
        	  <td><%=rs.getString("bstate") %></td>
        	
		 <%
			out.print("<td><a href='AlterBorrow.jsp?bno="+rs.getString(1)+"'><button class='btn btn-primary'>修改</button></a><a href='deleteBorrow.jsp?bno="+rs.getString(1)+"' onclick='javascript:return del();'><button class='btn btn-danger'>删除</button></a></td>");
			out.print("</tr>");
			
            } 
          rs.close();//关闭结果集
          conn.close();//关闭操作
          }
          catch(Exception ex){
          System.out.println(ex.getMessage());
          System.out.println("连接异常");
          ex.printStackTrace();
          }%>

					</tbody>
				</table>
		</div>
	</body>

</html>