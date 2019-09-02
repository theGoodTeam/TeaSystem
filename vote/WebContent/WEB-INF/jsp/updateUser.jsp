<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.test.domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<style type="text/css">
	.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
	@media(max-width:1240px){
		.layui-form-item .layui-inline{ width:100%; float:none; }
	}
</style>
</head>
<body class="childrenBody">
	<%-- ${result} --%>
	 <%
	String user_id = request.getParameter("user_id");
	
	User user = (User)session.getAttribute("user_result");
	%>
	<form class="layui-form" action="addUser_controller" style="width:80%;">
		<input type="hidden" name="user_id" value="<%=user.getUser_id() %>">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input userName" value="<%=user.getUser_name() %>" name="user_name" lay-verify="required" placeholder="请输入登录名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input userEmail" value="<%=user.getUser_passwod()%>"  name="user_passwod"  placeholder="请输入密码">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系电话</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input userEmail" name="user_phone" value="<%=user.getUser_phone() %>"   placeholder="请输入联系电话">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block userSex">
			      	<input type="radio" name="user_sex" value="1" title="男" <%if(user.getUser_sex().equals("1")) out.print("checked");%>>
			      	<input type="radio" name="user_sex" value="0" title="女" <%if(user.getUser_sex().equals("0")) out.print("checked");%>>
			    </div>
		    </div>
		    <div class="layui-inline">
			    <label class="layui-form-label">会员等级</label>
				<div class="layui-input-block">
					<select name="user_rank" class="userGrade" lay-filter="userGrade">
						<option value="0" <%if(user.getUser_rank().equals("0")) out.print("selected"); %>>系统管理员</option>
						<option value="1" <%if(user.getUser_rank().equals("1")) out.print("selected"); %>>活动管理员</option>
				        <option value="2" <%if(user.getUser_rank().equals("2")) out.print("selected"); %>>普通观众</option>
				    </select>
				</div>
		    </div>
		    
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">站点描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入站点描述" name="user_info"   class="layui-textarea linksDesc"><%=user.getUser_info() %></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addUser">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>

</body>
<script type="text/javascript">
//alert("alluser.js");
var $;
layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage;
		$ = layui.jquery;

		$(".layui-btn").on('click',function(){
	 		alert("ok");	
	 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
	 		$.post("userUpdateById",$("form").serialize(),function(data){
				if(data!=""){
					 setTimeout(function(){
				            top.layer.close(index);
							top.layer.msg("信息修改成功！");
				 			layer.closeAll("iframe");
					 		//刷新父页面
					 		parent.location.reload();
				        },2000);
				 		return false;
				}else{
					alert("用户名或密码错误！");
				}
			});
			return false;
	 		
	 	})
	 	
	
})



</script>
</html>