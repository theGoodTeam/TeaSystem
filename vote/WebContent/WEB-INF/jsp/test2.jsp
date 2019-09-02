<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图片上传测试</title>
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
	<script type="text/javascript" src="js/player.js"></script>
</head>
<body class="childrenBody">
<form action="Imgtest2" method="post">
<div class="user_left">
			<div class="layui-form-item">
			    <label class="layui-form-label">真实姓名</label>
			    <div class="layui-input-block">
			    	<input type="text"   name="player_name"  ="required" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">选手编号</label>
			    <div class="layui-input-block">
			    	<input type="text" name="player_num"   lay-verify="required" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">参赛作品</label>
			    <div class="layui-input-block">
			    	<input type="text" name="player_title"  lay-verify="required" class="layui-input">
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
			    	<input type="tel" value="" placeholder="请输入手机号码" name="player_phone" lay-verify="required|phone" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">出生年月</label>
			    <div class="layui-input-block">
			    	<input type="text" value="" name="player_birthday" placeholder="请输入出生年月" lay-verify="required|date" onclick="layui.laydate({elem: this,max: laydate.now()})" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">家庭住址</label>
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
			    <label class="layui-form-label">兴趣爱好</label>
			    <div class="layui-input-block" name="player_favorite">
			    	<input type="checkbox" name="player_favorite" value="唱歌" title="唱歌">
				    <input type="checkbox" name="player_favorite" value="舞蹈"  title="舞蹈">
				    <input type="checkbox" name="player_favorite" value="相声"  title="相声">
				    <input type="checkbox" name="player_favorite" value="杂技"  title="杂技">
				    <input type="checkbox" name="player_favorite" value="游戏"  title="游戏">
				    <input type="checkbox" name="player_favorite" value="吉他"  title="吉他">
				    <input type="checkbox" name="player_favorite" value="钢琴"  title="钢琴">
				    <input type="checkbox" name="player_favorite" value="武术"  title="武术">
				    <input type="checkbox" name="player_favorite" value="其他"  title="其他">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">邮箱</label>
			    <div class="layui-input-block">
			    	<input type="text" value=""  name="player_email" placeholder="请输入邮箱" lay-verify="required|email" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">自我评价</label>
			    <div class="layui-input-block">
			    	<textarea placeholder="请输入内容" class="layui-textarea" name="player_info" ></textarea>
			    </div>
			</div>
		</div>
<div class="user_right" style="margin-left: 200px;">
			<input type="file" name="player_img" id="test1"  lay-title="点我设置头像，让大家认识你吧">
			<p>由于是纯静态页面，所以只能显示一张随机的图片</p>
			<img src="" class="layui-circle" id="userFace">
		</div>
		
		<button lay-submit="" lay-filter="changeUser">立即提交</button>
</form>
</body>
</html>