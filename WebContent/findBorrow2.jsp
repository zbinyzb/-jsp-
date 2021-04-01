<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">  
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript">
		</script>
		<title>借阅图书</title>
	
	</head>

	<body>

	<div class="container">
			<form action="findBorrow2.jsp" target="bottom" class="form-inline ">
				<h2>借阅图书</h2>
				<div class="form-group search" id="a3">
					<input type="text" name="check" class="form-control" placeholder="请输入借阅证号或图书编号"  />
					&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" class="btn btn-primary" value="搜索" />
				
				</div>
			</form>
			
		
				<table class="table table-hover">
					<tr>
					<thead>
							<th>借阅证号</th>
							<th>图书编号</th>
							<th>书名</th>
							<th>出版单位</th>
							<th>图书类型</th>
							<th>单价</th>
							<th>借阅状态</th>
							<th>操作</th>
							
							
						
					</thead>
					</tr>
					<tbody>
	<%
	//查询功能
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("check");
	String sql;
	if(search.matches("[0-9]+")){
		sql = "select b.bno,a.tno,a.bname,a.pubdept,a.typnum,a.price,b.bstate from BookI a,BorrowI b  where a.tno = b.tno and bno='"+search+"' order by b.bno";
	}else{
		sql = "select b.bno,a.tno,a.bname,a.pubdept,a.typnum,a.price,b.bstate from BookI a,BorrowI b  where a.tno = b.tno and a.tno like '%"+search+"%' order by b.bno";
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
        <%   while(rs.next()){
        	%>
        	 <td><%=rs.getString("bno") %></td>
        	  <td><%=rs.getString("tno") %></td>
        	  <td><%=rs.getString("bname") %></td>
        	  <td><%=rs.getString("pubdept") %></td>
        	  <td><%=rs.getString("typnum") %></td>
        	  <td><%=rs.getString("price") %></td>
        	   <td><%=rs.getString("bstate") %></td>
        	
		
		 <%
			out.print("<td><a href='AlterBorrow_take.jsp?bno="+rs.getString("bno")+"'><button class='btn btn-primary'>借阅</button></a>&nbsp;&nbsp;&nbsp;<a href='AlterBorrow_back.jsp?bno="+rs.getString("bno")+"'><button class='btn btn-danger'>归还</button></a></td>");
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

		</div>
	</body>

</html>