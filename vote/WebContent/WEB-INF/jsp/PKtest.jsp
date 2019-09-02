<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

<link rel="stylesheet" href="css/images.css" media="all" />
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="css/news.css" media="all" />
<link rel="stylesheet" href="css/pk.css" media="all" />

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/usersList.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<style>
	.player_voted{
	 float:left  ;background-color: #FF0000;border: none;color: #fff;width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 5px;
	}
	#show1{
	float:left  ;background-color: #0083BC;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 40px;
	}
	#vate1{
	float:left  ;background-color: #F7BE39;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 5px;
	}
	#show2{
	float:left  ;background-color: #0083BC;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 55px;
	}
	#vate2{
	float:left  ;background-color: #F7BE39;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 5px;
	}
	#one{
	border: 1px solid red;margin-left: 15px;
	}
	
	#page{
	text-align:center;
	border: 1px solid black;margin-left: 15px;
	}
	#box_bg{
	-moz-transform:scale(1.3,1.8);
	
	}
	
	</style>
</head>
<body class="childrenBody">
<ul class="layui-nav layui-bg-blue">
  <li class="layui-nav-item"><a href="">艳蓝导航</a></li>
  <li class="layui-nav-item layui-this"><a href="">当前投票</a></li>
  <li class="layui-nav-item"><a href="">大数据</a></li>
  <li class="layui-nav-item">
    <a href="javascript:;">设置</a>
    <dl class="layui-nav-child">
      <dd><a href="">个人中心</a></dd>
      <dd><a href="">修改密码</a></dd>
      <dd><a href="">退出</a></dd>
    </dl>
  </li>
 
</ul> 
	
		<ul id="Images" >
			
		</ul>
		
	<br><br><br><br><br>		
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	<div id="page"></div>
	
</body>
<script type="text/javascript">

$(function(){
	
	
	
    $.ajax({
	url:"battleListShow",
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
					usersList();
					
					/*投票写在这里*/

				function usersList(){
					//分页
				var nums = 1; //每页出现的数据量
				laypage({
					cont : "page",
					pages : Math.ceil(users.length/nums),
					jump : function(obj){
							$("#Images").html(renderDate(users,obj.curr));
							
						    
						     $("#white").animate({ width: 0,left:"250px"}, 1000 ,function(){
						         $("#vs").fadeIn("slow",function(){
						             $("#all").html(a+b);$("#aa").html(a);$("#bb").html(b);
						             var newLeft = a/(a+b)*500-20 + "px";
						             $("#vs").animate({left:newLeft}, 1000);
						             $("#red").animate({width:newLeft}, 1000);
						         });
						     });
						     
						     
						     $("#vate1").bind('click',function(){
						        
						        	
						        	$.post("player1_vate",{"contest_id":contest_id},function(data){
						    			if(data!=""){
						    				alert("vote1 投票成功");
						    			}else{
						    				alert("用户名或密码错误！");
						    			}
						    		});
						        	
						        	$("<button id='voted'>已投票</button>").replaceAll(this);
						        	$("#voted").addClass("player_voted");
						        	$("#voted").click(function(){
						        		return false;
						        	});
						        });
						     
						form.render();
					}
				});

					function renderDate(data,curr){
						//alert("进入renderDate()");
						var dataHtml = '';
						currData = users.concat().splice(curr*nums-nums, nums);

						if(currData.length != 0){
							for(var i=0;i<currData.length;i++){
								alert("player1_ticket:"+currData[i].player1_ticket +"      "+"player2_ticket:"+currData[i].player2_ticket);
								a = currData[i].player1_ticket;
								b = currData[i].player2_ticket;	
								
								contest_id = currData[i].contest_id;
								
								dataHtml +=
									'<li id="one">'
								    + '<img src="images/金秀贤.jpg">'
									+'<div class="operate">'
									
									+'<div class="check">'
									+'<input type="checkbox"  >'+currData[i].player1
									+'</div>'
									
									+'<button type="button"  id="show1" >看详情'
									+'</button>'
									
									+'<button type="button"  id="vate1" >投一票'
									+'</button>'
									
									+'</div>'

							    	+'</li>'
							    	
							    	
							    	+'<li id="two" style="border: 1px solid green;float:right;margin-right: 15px;">'
								    + '<img src="images/杨幂.jpg">'
									+'<div class="operate">'
									
									+'<div class="check">'
									+'<input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" >'+currData[i].player2
									+'</div>'
									
									+'<button type="button"  id="show2" >看详情'
									+'</button>'
									
									+'<button type="button"  id="vate2" >投一票'
									+'</button>'
									
									+'</div>'

							    	+'</li>'
							    	
							    	+'<br>'
							    	+'<br>'
							    	+'<br>'
							    	
							    	+'<div id="box_bg">'
							    	+'<div id="container">'
							    	+'<div id="green" class="line">'+'</div>'
							    	+'<div id="red"   class="line">'+'</div>'
							    	+'<div id="white" class="line">'+'</div>'
							    	+'<div id="vs" >'+'</div>'
							    	+'</div>'
							    	+'</div>'
							    	
							   	    +'<div style="width:640px;height:30px; margin:50px auto;font-size: 20px;border:1px solid red">'
							    	
							   	    +'<div id="aa2" class="scope" style="border:1px solid black">选手一'
							    	+'<span id="aa">'+'X '
							    	+'</span>'+'票'
							    	+'</div>'
							    	
							    	
							    	+'<div id="bb2" class="scope" style="border:1px solid green">选手二'
							    	+'<span id="bb">'+'X'
							    	+'</span>'+'票'
							    	+'</div>'
							    	
							    	+'<div id="all2" class="scope" style="border:1px solid orange">总共'
							    	+'<span id="all">'+'X'
							    	+'</span>'+'票'
							    	+'</div>'
							    	
							    	
							      	+'</div>' 
							    	;  
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
    
   
    var a = 1;
    var b = 10;
    $("#white").animate({ width: 0,left:"250px"}, 1000 ,function(){
        $("#vs").fadeIn("slow",function(){
            $("#all").html(a+b);$("#aa").html(a);$("#bb").html(b);
            var newLeft = a/(a+b)*500-20 + "px";
            $("#vs").animate({left:newLeft}, 1000);
            $("#red").animate({width:newLeft}, 1000);
        });
    });
    
    
    
   

});



		

</script>

</html>