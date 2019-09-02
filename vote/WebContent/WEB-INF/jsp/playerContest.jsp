<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/user.css" media="all" />
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/playerpair.js"></script>
	
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />



<script type="text/javascript" src="js/playerEdit.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>比赛选手配对</legend>
</fieldset>
<form >

	<div class="layui-inline">
      <label class="layui-form-label">选手一</label>
      <div class="layui-input-inline" style="width: 250px;">
      
        <select  name="player1" lay-verify="title" autocomplete="on" class="layui-input" id="player1">
        
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">选手二</label>
      <div class="layui-input-inline"  style="width: 250px;">
        <select  name="player2" lay-verify="title" autocomplete="on" class="layui-input" id="player2">
       
        </select>
      </div>
    </div>
    <br>  <br>
    <div class="layui-inline">
      <label class="layui-form-label">参赛作品</label>
      <div class="layui-input-inline" style="width: 250px;">
        
         <select  name="player1_title" lay-verify="title" autocomplete="on" class="layui-input" id="player1_title">
        
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">参赛作品</label>
      <div class="layui-input-inline" style="width: 250px;">
       <select  name="player2_title" lay-verify="title" autocomplete="on" class="layui-input" id="player2_title">
        
        </select>
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 150px;margin-bottom: 50px;">
            <button class="layui-btn"  >开始配对</button>
			<button type="reset" class="layui-btn layui-btn-normal newsAdd_btn">重置</button>
				
	</div>
	<hr class="layui-bg-green">
   
   
    <div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="5%">
				<col width="6%">
				<col width="10%">
				<col width="5%">
				<col width="5%">
				<col width="6%">
				<col width="6%">
				<col width="10%">
				<col width="5%">
				<col width="5%">
				<col width="6%">
				<col width="13%">
		    </colgroup>
		 
		    <thead>
				<tr>
					<th ><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th><b>选手一</b></th>
					<th><b>参数项目</b></th>
					<th><b>评委投票</b></th>
					<th><b>观众投票</b></th>
					<th><b>总得票</b></th>
					<th><b>选手二</b></th>
					<th><b>参数项目</b></th>
					<th><b>评委投票</b></th>
					<th><b>观众投票</b></th>
					<th><b>总得票</b></th>
					<th><b>操作</b></th>
				</tr> 
				
		    </thead>
		    <tbody class="news_content"></tbody>
		</table>
		
	</div>
	<div id="page"></div>


</form>
<script type="text/javascript">
$(function(){
	
	
	
$(".layui-btn").click(function(){
	
	alert("0000");
	alert($("#player1").val());
	alert($("#player2").val());
	alert($("#player1_title").val());
	alert($("#player2_title").val());
	data = {
			"player1":$("#player1").val(),
			"player2":$("#player2").val(),
			"player1_title":$("#player1_title").val(),
			"player2_title":$("#player2_title").val()
			}
	
	var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		 $.post("addBattle",data,function(resultJSONObject){
			
		 setTimeout(function(){
            top.layer.close(index);
			top.layer.msg("分组配对成功！");
 			layer.closeAll("iframe");
	 		//刷新父页面
	 		parent.location.reload();
        },2000);
 		return false;
	});
	return false; 
	
});

	
$("#player1,#player2").append("<option>- - - - - - - - -&nbsp; 请选择 &nbsp;- - - - -  - - -</option>");

//点击事件 player1 change
$("select[name='player1']").bind('change',function(){
	//alert($("#player1").val());
	var player_name = $("#player1").val();
	
	$.ajax({
		url:"selectPlayerTiteByName",
		type:"POST",
		data:{"player_name":player_name},
	    dataType:"Json",
	    async: false,
		success:function(obj){

			 var users = obj.Userlist;
			// alert("users.length:"+users.length);
			 $("#player1_title").empty();
			  $.each(users,function(index,values){
				    var str = '';
					//alert(values.player_title);
					str = "<option >"+values.player_title+"</option>";
					$("select[name='player1_title']").append(str); 
			  }) 
			  
			 
	       
		},error:function(){
			alert("ERROR");
		}
		});
		
})

//点击事件 player1 change
$("select[name='player2']").bind('change',function(){
	//alert($("#player2").val());
	var player_name = $("#player2").val();
	
	$.ajax({
		url:"selectPlayerTiteByName",
		type:"POST",
		data:{"player_name":player_name},
	    dataType:"Json",
	    async: false,
		success:function(obj){

			 var users = obj.Userlist;
			// alert("users.length:"+users.length);
			 $("#player2_title").empty();
			  $.each(users,function(index,values){
				    var str = '';
					//alert(values.player_title);
					str = "<option >"+values.player_title+"</option>";
					$("select[name='player2_title']").append(str); 
			  }) 
			  
			 
	       
		},error:function(){
			alert("ERROR");
		}
		});
		
})

	
$.ajax({
	url:"selectPlayerAll",
	type:"POST",
    dataType:"Json",
    async: false,
	success:function(obj){
		// alert("yes");
	     var Html = '';
		 var jobj= $.parseJSON(obj);	
		 var users = jobj.Userlist;
		  //alert("users.length"+users.length);
		  $.each(users,function(index,values){
			
				str = "<option >"+values.player_name+"</option>";
				 $("select[name='player1']").append(str); 
				 $("select[name='player2']").append(str); 
		  })
		 
       
	},error:function(){
		alert("ERROR");
	}
	});
	
	

	
    $.ajax({
	url:"playerNaTi",
	type:"POST",
    dataType:"Json",
    async: false,
	success:function(obj){
		//alert("000");
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
				var nums = 8; //每页出现的数据量
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
							    	+'<td>'+currData[i].player1+'</td>'
							    	dataHtml +='<td align="left" style="color:#f00">'+currData[i].player1_title+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player1_judge+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player1_ticket+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player1_totalscore+'</td>'
							    	
							    	+'<td >'+currData[i].player2+'</td>'
							    	dataHtml +='<td align="left"style="color:#f00">'+currData[i].player2_title+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player2_judge+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player2_ticket+'</td>'
							    	
							    	dataHtml +='<td>'+currData[i].player2_totalscore+'</td>'
							    	+'<td>'
									+  '<a class="layui-btn layui-btn-mini news_edit" data-id="'+currData[i].contest_id+'"><i class="iconfont icon-edit"></i> 编辑</a>'
									
									+  '<a  id = "news_del" class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="'+currData[i].contest_id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
							        +'</td>'
							    	+'</tr>';  
							}        
							
						}else{
							dataHtml = '<tr><td colspan="12">暂无数据</td></tr>';
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
    
 
 
	
});
	
	
</script>

</html>