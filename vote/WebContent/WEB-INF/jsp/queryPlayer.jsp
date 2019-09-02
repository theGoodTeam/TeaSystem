<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.test.domain.Player,java.util.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选手列表</title>
<meta charset="utf-8">
<title>选手总数--layui后台管理模板</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="css/news.css" media="all" />

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/playerlist.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body class="childrenBody">

	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn" name="key">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加用户</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="7%">
				<col width="12%">
				<col width="12%">
				<col width="12%">
				<col width="12%">
				<col width="12%">
				<col width="12%">
				<col width="21%">
		    </colgroup>
				
		    <thead>
		    
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th >选手姓名</th>
					<th>性别</th>
					<th>参赛节目</th>
					<th>爱好</th>
					<th>联系电话</th>
					<th>个人信息</th>
					<th>操作</th>
				</tr> 
				
		    </thead>
		    <tbody class="news_content">
		     <%
				ArrayList<Player> list =(ArrayList)session.getAttribute("playerlist");
		        Iterator<Player> it = list.iterator();
		       
		        while(it.hasNext()){
		        	Player players = it.next();
				%>
				<tr >
					<th style="font-weight: normal;"><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></th>
					<th><%=players.getPlayer_name() %></th>
					<th><%=players.getPlayer_sex()%></th>
					<th><%=players.getPlayer_title()%></th>
					<th><%=players.getPlayer_favorite()%></th>
					<th><%=players.getPlayer_phone()%></th>
					<th><%=players.getPlayer_info()%></th>
					<th>
					<a class="layui-btn layui-btn-mini news_edit" data-id="<%=players.getPlayer_id() %>"><i class="iconfont icon-edit"></i> 编辑</a>
					
					<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="<%=players.getPlayer_id() %>"><i class="layui-icon">&#xe640;</i> 删除</a>
					</th>
				</tr> 
				<%
       			  }
        	    %> 
		    
		    </tbody>
		</table>
		
	</div>
	<div id="page"></div>
	
</body>

</html>