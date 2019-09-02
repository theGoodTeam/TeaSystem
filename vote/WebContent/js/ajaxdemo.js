
function ajaxdemo(){
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
									$("#onlyvote").html(renderDate(users,obj.curr));
									
								    
								     $("#white").animate({ width: 0,left:"250px"}, 1000 ,function(){
								         $("#vs").fadeIn("slow",function(){
								             $("#all").html(a+b);$("#aa").html(a);$("#bb").html(b);
								             var newLeft = a/(a+b)*500-20 + "px";
								             $("#vs").animate({left:newLeft}, 1000);
								             $("#red").animate({width:newLeft}, 1000);
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
										//alert("player1_ticket:"+currData[i].player1_ticket +"      "+"player2_ticket:"+currData[i].player2_ticket);
										a = currData[i].player1_ticket;
										b = currData[i].player2_ticket;	
										
										contest_id = currData[i].contest_id;
										
										dataHtml +=

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
		    
}