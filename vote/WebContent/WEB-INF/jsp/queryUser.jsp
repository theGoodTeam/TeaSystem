<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.util.*,com.test.domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
<meta charset="utf-8">
<title>用户总数--layui后台管理模板</title>
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
<script type="text/javascript" src="js/usersList.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body class="childrenBody"><%-- ${result } --%>
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
					<th >登录名</th>
					<th>性别</th>
					<th>联系电话</th>
					<th>用户等级</th>
					<th>是否展示</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr> 

		    </thead>
		    <tbody class="news_content">
		    	<%
				 ArrayList<User> list =(ArrayList)session.getAttribute("userlist");
		        Iterator<User> it = list.iterator();
		       
		        while(it.hasNext()){
		        	User users = it.next();
		        	String user_rank;
		        	String user_sex;
		        	if(users.getUser_rank().equals("1")){
		        		user_rank ="系统管理员";
		        	}else if(users.getUser_rank().equals("2")){
		        		user_rank ="系统管理员";
		        	}else{
		        		user_rank ="系统管理员";
		        	}
		        	
		        	if(users.getUser_sex().equals("1")){
		        		user_sex="男";
		        	}else{
		        		user_sex="女";
		        	}
				%>
				<tr >
					<th style="font-weight: normal;"><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></th>
					<th><%=users.getUser_name() %></th>
					<th><%=user_sex %></th>
					<th><%=users.getUser_phone() %></th>
					<th><%= user_rank%></th>
					<th><input type="checkbox" name="show" lay-skin="switch" lay-text="是|否" lay-filter="isShow"' checked></th>
					<th>2017-12-31</th>
					<th>
					<a class="layui-btn layui-btn-mini news_edit" data-id="<%=users.getUser_id() %>"><i class="iconfont icon-edit"></i> 编辑</a>
					<a class="layui-btn layui-btn-normal layui-btn-mini news_collect"><i class="layui-icon">&#xe600;</i> 收藏</a>
					<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="<%=users.getUser_id() %>"><i class="layui-icon">&#xe640;</i> 删除</a>
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