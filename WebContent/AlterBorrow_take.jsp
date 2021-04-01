<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改借阅信息</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">  
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
<style> 
	body{
	justify-content: center;
  	text-align:center;
  	background-image: linear-gradient(to left,#e1dcfc, #1fb2bd);
  	}
  	.panel-title{
		
		font: 20px '';
	}
	#a1{
		width: 600px;
		height: 650px;
		margin: 0 auto;
	//	border: solid red;
		padding-top: 100px;
		float: left;
		
		
	}
	.container{
		width: 1200px;
		height: 600px;
		margin: 0 auto;
	//	border: solid red;
		float: left;
		
	}
	#left{
		width: 450px;
		height: 600px;
		margin: 0 auto;
		//border: solid red;
		float: left;
		
	}
</style>
</head>
<body>
<%
String bno;
String bno_new;
String tno=null;
String bname=null;
String pubdept=null;
String typnum=null;
String price=null;
String bstate=null;


%>
	<%
	request.setCharacterEncoding("UTF-8");
	bno = request.getParameter("bno");
	bno_new = (String)session.getAttribute("bno");
	System.out.println(bno);
	System.out.println(bno_new);
	String sqlid = "select b.bno,a.tno,a.bname,a.pubdept,a.typnum,a.price,b.bstate from BookI a,BorrowI b  where a.tno = b.tno and bno='"+bno+"'order by b.bno";
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
		//System.out.println("数据库成功");
		Statement sql = conn.createStatement();
		ResultSet rs = sql.executeQuery(sqlid);
		if(rs.next()){
			bno=rs.getString(1);
			tno=rs.getString(2);
			bname = rs.getString(3);
			pubdept = rs.getString(4);
			typnum = rs.getString(5);
			price = rs.getString(6);
			bstate=rs.getString(7);

		}
		rs.close();
		sql.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>





<div class="container">
	<div class="row clearfix">
		<div class="col-md-3 column" id="left">
		</div>
		
		<div class="col-md-6 column" id="a1">
			<form class="form-horizontal" role="form" action="updateBorrow_take.jsp" 
			                       method="post" onsubmit="return check()">
			                             <div class="panel panel-info">
						
							<h3 class="panel-title">确认借阅信息</h3>						
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="inputEmail3">借阅证号</label>
						<div class="col-sm-10">
							<input class="form-control" value="<%=bno_new %>" type="text" name="bno" readonly ="readonly"/>
						</div>
					</div>
					<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3" >图书编号</label>
					<div class="col-sm-10">
						<input class="form-control"  value="<%=tno %>" type="text" name="tno" readonly ="readonly"/>
					</div>
				</div>
				
				
				<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3">书名</label>
					<div class="col-sm-10">
						<input class="form-control"value="<%=bname %>" id="inputEmail3" type="text"  name="bname" readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3">出版单位</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputEmail3" type="text" value="<%=pubdept%>" name="redate" readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3">图书类型</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputEmail3" type="text" value="<%=typnum%>" name="retdate" readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3">单价</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputEmail3" type="text" value="<%=price%>" name="price" readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label" for="inputEmail3">借阅状态</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputEmail3" value="<%=bstate %>" type="text" name="bstate" readonly ="readonly"/>
					</div>
				</div>
		
				
			
						<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-primary btn-lg btn-block">借阅</button>
						  <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.location.href = 'Borrow.jsp'">返回</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3 column">
		</div>
	</div>
</div>
</body>
</html>