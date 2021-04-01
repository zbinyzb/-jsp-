<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号退出</title>
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script> 
    <script src="bootstrap/bootstrap.4.0.min.js"></script>
   
     <style>
        .row{
            margin: 0;
            height: 600px;
            width: 100%;  
        }
    </style>
</head>
<body>
        <% session.invalidate(); %>
        <div class="row">
            <div  class="col-xs-12 col-md-8"> 
                <div class="intro" style="padding-top: 180px;"> 
                   <h1 class="text-primary">已退出，请重新登录</h1>
                   <div class="summary"> 
                       <p> Please check whether the logon status is maintained. </p> 
                       <p> Use <strong>MYSQL</strong> and <strong>Navicat</strong> to analyze your username and password in few minutes. </p> 
                   </div> 
                   <a href="login.jsp" target="right" class="btn btn-primary">点击返回登陆页面</a> 
               </div> 
           </div> 
   
           <div  class="col-xs-6 col-md-4" style="height: 300px;"> 
               <img src="images/laptop_coffee_dude@2x.png" class="img-responsive img-circle" alt="Responsive image" style="padding-top: 50px;">
           </div> 
       </div>
</body>
</html>