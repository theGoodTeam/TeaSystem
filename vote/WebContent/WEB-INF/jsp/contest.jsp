<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>比赛场次</title>
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
<script type="text/javascript" src="js/contest.js"></script>
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
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加比赛</a>
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
				<col width="30%">
				<col width="12%">
				
				<col width="21%">
		    </colgroup>
		 
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th >比赛名称</th>
					<th>比赛地点</th>
					<th>比赛时间</th>
					<th>比赛详情</th>
					<th>开启比赛</th>
					
					<th>操作</th>
				</tr> 
				
		    </thead>
		    <tbody class="news_content"></tbody>
		</table>
		
	</div>
	<div id="page"></div>
	
</body>
<script type="text/javascript">


$(function(){
	
	
	
    $.ajax({
	url:"contestListShow",
	type:"POST",
    dataType:"Json",
    async: false,
	success:function(obj){
		
		 var jobj= $.parseJSON(obj);
		
		 var users = jobj.Userlist;
		 
		 layui.config({
				base : "js/"
			}).use(['form','layer','jquery','laypage'],function(){
				var form = layui.form(),
					layer = parent.layer === undefined ? layui.layer : parent.layer,
					laypage = layui.laypage,
					$ = layui.jquery;
				
				//alert("users.length"+users.length);
				usersList();
				
				
				
				function usersList(){
					//alert("进入usersList()");
					
					//分页
				var nums = 5; //每页出现的数据量
				laypage({
					cont : "page",
					pages : Math.ceil(users.length/nums),
					jump : function(obj){
						//document.write(JSON.stringify(obj));
						//alert(JSON.stringify(users));
						//$(".news_content").html(renderDate(users,obj.curr));
							$(".news_content").html(renderDate(users,obj.curr));

						form.render();
					}
				});
				
				
					function renderDate(data,curr){
						//alert("进入renderDate()");
						var dataHtml = '';
						currData = users.concat().splice(curr*nums-nums, nums);
						//document.write(JSON.stringify(currData));
						//alert(JSON.stringify(currData));
						//alert(currData.length );
						if(currData.length != 0){
							for(var i=0;i<currData.length;i++){
								dataHtml += '<tr>'
							    	+'<td><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></td>'
							    	+'<td align="left">'+currData[i].contest_name+'</td>'
							    	+'<td align="left">'+currData[i].contest_site+'</td>'
									
							    	
							    	 +'<td>'+currData[i].contest_time+'</td>'
							    	 +'<td>'+currData[i].contest_des+'</td>'
							    	
							    	
							    	dataHtml +='<td><input type="checkbox"  id="check" name="show" data-id="'+currData[i].battle_id+'" lay-skin="switch" lay-text="是|否" lay-filter="isShow"'+currData[i].contest_state+'></td>'
							    	
							    
							    	+'<td>'
									+  '<a class="layui-btn layui-btn-mini news_edit" data-id="'+currData[i].battle_id+'"><i class="iconfont icon-edit"></i> 编辑</a>'

									+  '<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="'+currData[i].battle_id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
							        +'</td>'
							    	+'</tr>';  
							}        
							
						}else{
							dataHtml = '<tr><td colspan="8">暂无数据</td></tr>';
						}
						return dataHtml;
					}
				
				}
			
				
			}); 
		 
   
           
	},
	error:function(){
		alert("ERROR");
	}
	});
    
   
  //查询
	$(".search_btn").click(function(){
		
//		var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
		if($(".search_input").val() != ''){
			layer.msg($(".search_input").val());
			window.location.href="selectUserByKey?key="+$(".search_input").val();
		}else{
			layer.msg("请输入需要查询的内容");
		}
	})
		 
			


});


</script>

</html>