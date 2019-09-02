<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<script type="text/javascript" src="ja/jquery.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/playercontest.js"></script>
</head>
<body class="childrenBody">
	<form class="layui-form" action="addContestContrllor" method="post">
		<div class="user_left">
			<div class="layui-form-item">
			    <label class="layui-form-label">比赛名称</label>
			    <div class="layui-input-block">
			    	<input type="text"   name="contest_name"  ="required" class="layui-input">
			    </div>
			</div>
			<!-- <div class="layui-form-item">
			    <label class="layui-form-label">比赛地点</label>
			    <div class="layui-input-block">
			    	<input type="text" name="contest_site"   lay-verify="required" class="layui-input">
			    </div>
			</div> -->
			
			
			<div class="layui-form-item">
			    <label class="layui-form-label">比赛日期</label>
			    <div class="layui-input-block">
			    	<input type="text" value="" name="contest_time" placeholder="请输入比赛日期" lay-verify="required|date" onclick="layui.laydate({elem: this,max: laydate.now()})" class="layui-input">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">比赛地点</label>
			    <div class="layui-input-inline"  style="width:122px;"  >
	                <select name="province" lay-filter="province"  >
	                    <option value="" >请选择省</option>
	                </select>
	            </div>
	            <div class="layui-input-inline" style="width:122px;">
	                <select name="city" lay-filter="city" disabled  >
	                    <option value="" >请选择市</option>
	                </select>
	            </div>
	            <div class="layui-input-inline"  style="width:122px;">
	                <select name="area" lay-filter="area" disabled  >
	                    <option value="" >请选择县/区</option>
	                </select>
	            </div>
			</div>
			
			
			<div class="layui-form-item">
			    <label class="layui-form-label">比赛说明</label>
			    <div class="layui-input-block">
			    	<textarea placeholder="请输入内容" class="layui-textarea" name="contest_des" ></textarea>
			    </div>
			</div>
		</div>
		
		
		<div class="layui-form-item" style="margin-left: 5%;">
		    <div class="layui-input-block">
		        <button type="submit" style="width: 80px;height: 38px; background-color: #1E9FFF;border:none;cursor: pointer;">百搭按钮</button>
 				<button type="reset" class="layui-btn layui-btn-primary">返回</button>
				
		    </div>
		</div>
	</form>
	
</body>
<script>

  
</script>
</html>