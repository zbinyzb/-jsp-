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
<title>修改图书</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">  
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
function check()
{

if(document.alter.password.value != document.alter.password1.value)
{
alert("两次输入的密码不一致");
return ;
}
}
</script>
<style type="text/css">
  body{
	justify-content: center;
  	text-align:center;
  	background-image: linear-gradient(to left,#e1dcfc, #1fb2bd);
  	}
	#a1{
		width: 600px;
		height: 650px;
		margin: 0 auto;

		padding-top: 100px;
		float: left;
		
		
	}
	.form-group{
		padding-top: 10px;
		font: 15px '';
	}
	.container{
		width: 1200px;
		height: 600px;
		margin: 0 auto;
	
		float: left;
		
	}
	#left{
		width: 450px;
		height: 600px;
		margin: 0 auto;
	
		float: left;
		
	}
	
	.panel-title{
		
		font: 20px '';
	}
</style>
</head>
<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-3 column" id="left">
		</div>
		
		<div class="col-md-6 column" id="a1">
			<form name="alter" class="form-horizontal" role="form" action="updateUser.jsp" 
			                       method="post" onsubmit="check()">
				<div class="panel panel-info">
					<h1 class="panel-title bg-success">修改个人信息</h1>						
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label"  >用户名</label>
					<div class="col-sm-10">
						<input class="form-control" value="<%=session.getAttribute("username") %>"   type="text" name="username"  readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label"  >借阅号</label>
					<div class="col-sm-10">
						<input class="form-control" value="<%=session.getAttribute("bno") %>"   type="text" name="bno" readonly ="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-2 control-label" >输入密码</label>
					<div class="col-sm-10">
						<input class="form-control"   type="password" name="password" required="required"/>
					</div>
					</div>
					<div class="form-group">
					 <label class="col-sm-2 control-label" >再次输入密码</label>
					<div class="col-sm-10">
						<input class="form-control"   type="password" name="password1" required="required"/>
					</div>
					</div>
				
		
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-primary btn-lg btn-block">修改</button>
						  <button type="reset" class="btn btn-primary btn-lg btn-block">重置</button>
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