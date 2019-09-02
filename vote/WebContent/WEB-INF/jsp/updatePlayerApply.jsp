<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.test.domain.Player" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加选手页</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/user.css" media="all" />
	
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/updatePlayer.js"></script>
</head>
<body class="childrenBody">
	<%
	Player player =  (Player)request.getAttribute("playerresult");
	%>
	<form class="layui-form" action="addPlayerinfo" method="post">
	<input type="hidden" name="player_id" value="<%=player.getPlayer_id()%>">
		<div class="user_left">
			<div class="layui-form-item">
			    <label class="layui-form-label">真实姓名</label>
			    <div class="layui-input-block">
			    	<input type="text"   name="player_name" value="<%=player.getPlayer_name() %>"  lay-verify="required" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">选手编号</label>
			    <div class="layui-input-block">
			    	<input type="text" name="player_num" value="201907123456"  lay-verify="required" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">参赛作品</label>
			    <div class="layui-input-block">
			    	<input type="text" name="player_title"value="<%=player.getPlayer_title() %>" lay-verify="required" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item" pane="">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block">
			    	<input type="radio" name="player_sex" value="男" title="男" checked="">
	     			<input type="radio" name="player_sex" value="女" title="女">
	     		
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">联系号码</label>
			    <div class="layui-input-block">
			    	<input type="tel" value="<%=player.getPlayer_phone() %>" placeholder="请输入手机号码" name="player_phone" lay-verify="required|phone" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">出生年月</label>
			    <div class="layui-input-block">
			    	<input type="text" value="<%=player.getPlayer_birthday() %>" name="player_birthday" placeholder="请输入出生年月" lay-verify="required|date" onclick="layui.laydate({elem: this,max: laydate.now()})" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label" >家庭住址</label>
			    <div class="layui-input-inline"  style="width:122px;"  >
	                <select name="province" lay-filter="province"  name="player_address">
	                    <option value="" >请选择省</option>
	                </select>
	            </div>
	            <div class="layui-input-inline" style="width:122px;">
	                <select name="city" lay-filter="city" disabled  name="player_address">
	                    <option value="" >请选择市</option>
	                </select>
	            </div>
	            <div class="layui-input-inline"  style="width:122px;">
	                <select name="area" lay-filter="area" disabled  name="player_address">
	                    <option value="" >请选择县/区</option>
	                </select>
	            </div>
			</div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">邮箱</label>
			    <div class="layui-input-block">
			    	<input type="text" value="<%=player.getPlayer_email() %>"  name="player_email" placeholder="请输入邮箱" lay-verify="required|email" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">自我评价</label>
			    <div class="layui-input-block">
			    	<textarea placeholder="请输入内容" class="layui-textarea" name="player_info" ><%=player.getPlayer_info() %></textarea>
			    </div>
			</div>
		</div>
		<div class="user_right" style="margin-left: 200px;">
			<input type="file" name="player_img" id="test1"  lay-title="点我设置头像，让大家认识你吧">
			<p>点我换头像，快让大家认识你吧！</p>
			<img src="<%="images/"+player.getPlayer_img() %>" class="layui-circle" >
		</div>
		
		
		
		<div class="layui-form-item" style="margin-left: 5%;">
		    <div class="layui-input-block">
		    	<button class="layui-btn"  lay-submit="" lay-filter="changeUser">修改提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	
</body>

</html>