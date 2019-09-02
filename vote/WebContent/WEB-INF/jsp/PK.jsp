<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.test.domain.User"%>
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

<link rel="stylesheet" href="css/pk.css" media="all" />

<script type="text/javascript" src="js/ajaxdemo.js"></script> 
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/usersList.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>


</head>
<body class="childrenBody">
<% 
	//User user = (User)request.getAttribute("userresult");
%>
<ul class="layui-nav layui-bg-blue">
  <li class="layui-nav-item"><a href="">艳蓝导航</a></li>
  <li class="layui-nav-item layui-this"><a href="">热门投票</a></li>
  <li class="layui-nav-item">你好！${userresult.user_name} </li>
  <li class="layui-nav-item">
    <a href="player_login">退出</a>
   
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
							//alert(player1);
							//alert(player2);
							
							
							  $.ajax({
							    	url:"selectPlayer1ByName",
							    	type:"POST",
							    	data:{"player1":player1},
							        dataType:"Json",
							        async: false,
							        contentType: 'application/x-www-form-urlencoded',
							    	success:function(obj){
							    		// alert("YES");
		
							    		 var users = obj.Userlist; 
							    		 //alert(JSON.stringify(users));
							    		 //alert(users[0].player_img);
							    		
							    		 var img = "images/"+users[0].player_img;
							    		 //alert(img);
							    		  $("<img src='"+img+"'>").replaceAll($("#one img"));
							    		  palyer1_id = users[0].player_id;
							        },
							    		
							    	 error:function(){
							    	  alert("ERROR");
							    	 }
							  });
							  
							  
							  $.ajax({
							    	url:"selectPlayer2ByName",
							    	type:"POST",
							    	data:{"player2":player2},
							        dataType:"Json",
							        async: false,
							        contentType: 'application/x-www-form-urlencoded',
							    	success:function(obj){
							    		 //alert("YES");
		
							    		 var users = obj.Userlist; 
							    		// alert(JSON.stringify(users));
							    		 //alert(users[0].player_img);
							    		
							    		 var img = "images/"+users[0].player_img;
							    		 //alert(img);
							    		  $("<img src='"+img+"'>").replaceAll($("#two img"));
							    		  
							    		 palyer2_id = users[0].player_id;
							    		 
							        },
							    		
							    	 error:function(){
							    	  alert("ERROR");
							    	 }
							  });
							
						     $("#white").animate({ width: 0,left:"250px"}, 1000 ,function(){
						         $("#vs").fadeIn("slow",function(){
						             $("#all").html(yy);$("#aa").html(a);$("#bb").html(b);
						             var newLeft = a/(a+b)*200-20 + "px";
						             $("#vs").animate({left:newLeft}, 1000);
						             $("#red").animate({width:newLeft}, 1000);
						         });
						     });
						     
						   /*   $.ajax({
							    	url:"selectAllVote",
							    	type:"POST",
							        dataType:"Json",
							        async: false,
							        contentType: 'application/x-www-form-urlencoded',
							    	success:function(obj){
							    		 alert("YES");
		
							    		 var users = obj.Userlist; 
							    		 //alert(JSON.stringify(users));
							    		 alert(users[0].user_id);
							    		
							    		
							    		 
							        },
							    		
							    	 error:function(){
							    	  alert("ERROR");
							    	 }
							  });
							
				        	
 */

						     
						     $("#vate1").bind('click',function(){
						        
						        	 
						        	$.post("player1_vate",
						        		{
						        		"contest_id":contest_id,
						        		"user_id":${userresult.user_id},
						        		"battle_id":battle_id,
						        		"palyer1_id":palyer1_id},
						        		function(data){
						    			if(data!=""){
						    				 setTimeout(function(){
						    					 ajaxdemo();
						    					// location.reload();
								    			layer.msg("投票成功！");
						    		            },2000);
						    				
						    			}else{
						    				layer.msg("投票失败！");
						    			}
						    		});
						        	
						        					        	
						        	$("<button id='voted'>已投票</button>").replaceAll(this);
						        	$("#voted").addClass("player_voted");
						        	$("#voted").click(function(){
						        		return false;
						        	});
						        	$("<button id='voted'>已投票</button>").addClass("player_voted_gray").replaceAll("#vate2")
						        });
						     
						     
						     $("#vate2").bind('click',function(){
						        	
						        	
						        	$.post("player2_vate",
						        			{"contest_id":contest_id,
							        		 "user_id":${userresult.user_id},
							        		 "battle_id":battle_id,
							        		 "palyer2_id":palyer2_id
						        			},
						        			function(data){
						    		    	if(data!=""){
						    				  setTimeout(function(){
						    					  ajaxdemo();
						    					 //location.reload();
						    					 // location.reload();
								    			layer.msg("投票成功！");
						    		            },2000);
						    				
						    			}else{
						    				layer.msg("投票失败！");
						    			}
						    		});
						        	$("<button id='voted'>已投票</button>").replaceAll(this);
						        	$("#voted").addClass("player_voted");
						        	$("#voted").click(function(){
						        		return false;
						        	});
						        	$("<button id='voted'>已投票</button>").addClass("player_voted_gray").replaceAll("#vate1")
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
								//alert("player1_ticket:"+currData[i].player1_ticket +"      "+"player2_ticket:"+currData[i].player2_ticket);
								a = currData[i].player1_ticket;
								b = currData[i].player2_ticket;	
								player1 = currData[i].player1;
								player2 = currData[i].player2;
								
								battle_id = currData[i].battle_id;
								
								contest_id = currData[i].contest_id;
								
								player1juge = currData[i].player1_judge;
								player2juge = currData[i].player2_judge;
								player1total = currData[i].player1_ticket+currData[i].player1_judge;
								player1tota2 = currData[i].player2_ticket+currData[i].player2_judge;
								
								total = player1total+player1tota2;
								bb =(currData[i].player1_ticket/player1tota2)*100+currData[i].player1_judge; 
								vv = bb.toFixed(2);
								yy = ((b/player1tota2)*100+currData[i].player2_judge).toFixed(2);
								alert(yy);
								dataHtml +=
									'<li id="one">'
								    + '<img >'
									+'<div class="operate">'
									
									+'<div class="check">'
									+'<input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" >'+currData[i].player1
									+'</div>'
									
									+'<button type="button"  id="show1" >看详情'
									+'</button>'
									
									+'<button type="button"  id="vate1" >投一票'
									+'</button>'
									
									+'</div>'

							    	+'</li>'
							    	
							    	
							    	+'<li id="two" style="border: 2px solid green;float:right;margin-right: 15px; ">'
								    + '<img >'
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
							    	
							    	+'<div id = "onlyvote">'
							    	+'<div id="box_bg">'
							    	+'<div id="container">'
							    	+'<div id="green" class="line">'+'</div>'
							    	+'<div id="red"   class="line">'+'</div>'
							    	+'<div id="white" class="line">'+'</div>'
							    	+'<div id="vs" >'+'</div>'
							    	+'</div>'
							    	+'</div>'
							    	
							   	    +'<div style="width:640px;height:30px; margin:50px auto;font-size: 18px;font-family: 楷体;">'
							    	
							   	    +'<div id="aa2" class="scope" >评委：'+'<span style="color:blue">'+currData[i].player1_judge+'</span>'+'票'
							    	+' 观众:<span id="aa">'
							    	+'</span>'+'票'
							    	+'</div>'
							    	
							    	
							    	+'<div id="bb2" class="scope" >评委：'+'<span style="color:blue">'+currData[i].player2_judge+'</span>'+'票'
							    	+' 观众:<span id="bb">'
							    	+' </span>'+'票'
							    	+'</div>'
							    	
							    	+'<div id="all2" class="scope" >'+'<span style="color:blue">'+vv+'分'+'</span>'
							    	+'-总共-<span id="all">'
							    	+'</span>'+'分'
							    	+'</div>'
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