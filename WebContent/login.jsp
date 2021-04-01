<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录界面</title>
   <link rel="stylesheet" href="bootstrap/style.css">  
</head>
<body>
 <div class="container">
        <img src="images/bg.jpg" alt="">
        <div class="panel">
            <div class="content login">
                <div class="switch">
                    <span id="login" class="active">登录</span><span>/</span><span id="signup">注册</span>
                </div>
                <form id="btnform" role="form" action="<%=request.getContextPath() %>/servlet/LoginServlet" method="post">
                    <div id='email' class="input" placeholder='借阅证号'><input type="text"></div>
                    <div class="input" placeholder='用户名'><input name="username" type="text" required="required"  ></div>
                    <div class="input" placeholder='密码'><input name="password" type="password" required="required" ></div>
                    <div id="repeat" class="input" placeholder='确认密码'><input name="password2" type="password"></div>
                    <span>Forget?</span>
                    <button type="submit">登录</button>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script>
    $('#login').click(function(){
        $('.switch span').removeClass('active');
        $(this).addClass('active');

        $(this).parents('.content').removeClass('signup');
        $(this).parents('.content').addClass('login');
        
        $('#email input').removeAttr("required");
       
        $('form button').text('登录');
        $("#btnform").attr("action","<%=request.getContextPath() %>/servlet/LoginServlet");    //设置被选元素的属性和值。
        $("#btnform input").val("");	//清空输入

    })

    $('#signup').click(function(){
    	
    	

        $('.switch span').removeClass('active');
        $(this).addClass('active');
        
        $(this).parents('.content').removeClass('login');
        $(this).parents('.content').addClass('signup');
        
        $('#email input').attr({
        	"name":"bno",
        	"required":"required"
        });
    
        
        //修改表单属性
        $('form button').text('注册');
        $("#btnform").attr("action","AddUser.jsp");    //设置被选元素的属性和值。
        $("#btnform input").val("");	//清空输入
    })

    $('.input input').on('focus',function(){
        $(this).parent().addClass('focus');
    })

    $('.input input').on('blur',function(){
        if($(this).val() === '')
        $(this).parent().removeClass('focus');
    })
</script>
</html>