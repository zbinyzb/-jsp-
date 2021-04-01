<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>图书借阅管理系统</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/bilinav.css">
	<script src="js/jquery-3.3.1.min.js"></script> 
	<script src="bootstrap/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="top">
		<div class="center">
			<a href="frame.jsp" target="right" class="btn btn-warning btn-block" role="button">主页</a>
		</div>
		<div class="center">
			<a href="contain.jsp" target="bottom" class="btn btn-warning btn-block" role="button">图书管理</a>
		</div>
		<div class="center">
			<a href="ReaderPan.jsp" target="bottom" class="btn btn-primary btn-block" role="button">读者管理</a>
		</div>
		<div class="center">
			<a href="BorrowPan.jsp" target="bottom" class="btn btn-primary btn-block" role="button">借阅管理</a>
		</div>
		<div class="center">
			<a href="Borrow.jsp" target="bottom" class="btn btn-primary btn-block" role="button">借阅图书</a>
		</div>
		<div class="r">		
            <div class="dropdown">
                <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
                        data-toggle="dropdown">
                    用户<%=session.getAttribute("username") %>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1"  href="AlterUser.jsp" target="bottom">修改个人信息</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1"href="logout.jsp" target="bottom">注销</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="deleteUse.jsp" target="bottom">删除用户</a>
                    </li>
                </ul>
            </div>
		</div>
	</div>
	
	<div class="banner">
        <header>
            <div><img src="images/bilibili-autumn-1.webp"></div>
            <div><img src="images/bilibili-autumn-2.webp"></div>
            <div><img src="images/bilibili-autumn-3.webp"></div>
            <div><img src="images/bilibili-autumn-4.webp"></div>
            <div><img src="images/bilibili-autumn-5.webp"></div>
            <div><img src="images/bilibili-autumn-6.webp"></div>
          </header>
    </div>
</body>
<script>
    const images = document.querySelectorAll('header > div > img')

    document.querySelector('header').addEventListener('mousemove',(e)=>{
        let percentage = e.clientX / window.outerWidth
   

        let offset = 10 * percentage

        let blur = 20

        
        for(let [index,image] of images.entries()) {
    
        	
            offset *=1.3
           

            let blurValue = (Math.pow((index / images.length - percentage), 2) * blur)


			a = offset.toString()
			b = blurValue.toString()
            image.style.setProperty('--offset', a+'px')
            image.style.setProperty('--blur', b+'px')
        }
    })
</script>


</html>