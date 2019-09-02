<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/login_layui.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>
<form action="login" method="post">
<div class="m-login-bg">
    <div class="m-login">
        <h3>后台系统登录</h3>
        <div class="m-login-warp">
            <form class="layui-form">
                <div class="layui-form-item">
                    <input type="text" name="user_name" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input" >
                </div>
                <div class="layui-form-item">
                    <input type="text" name="user_passwod" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input" >
                </div>
                <div class="layui-form-item">
					<div class="layui-inline">
						<input type="text" name="verity" required lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-inline">
						<img class="verifyImg" onclick="this.src=this.src+'?c='+Math.random();" src="images/yzm.jpg" />
					</div>
				</div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2018-2019 by 专周实训</p>
    </div>
</div>
</form>


<script src="layui/login_layui.js" type="text/javascript" charset="utf-8"></script>

<script>
	if(${message} == false){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  
			  layer.open({
				  title: '提示'
				  ,content: '用户名或密码错误！'
				});     
				  
			});    

	}
</script>
	
</body>
</html>