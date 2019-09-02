<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="com.test.domain.Battle"%>
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
	
	<script type="text/javascript" src="js/playerpair.js"></script>

	

</head>
<body>
<% 
String contest_id = request.getParameter("contest_id");

Battle battle =  (Battle)request.getAttribute("battleresult");
int player1 = battle.getPlayer1_ticket();
int player2 = battle.getPlayer2_ticket();
int player1total;
int player2total;
int player1_judge = battle.getPlayer1_judge();
int player2_judge = battle.getPlayer2_judge();




/* out.print("player1 : "+player1);out.print("   ");
out.print("player2 : "+player2);out.print("   "); */
/* out.print((player1/(player2+player1)*200)+player1_judge);
out.print((player2/(player2+player1)*200)+player2_judge) */; 
%>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>修改选手配对（评委评分）</legend>
</fieldset>
<form action="updateBattleByContestId" method="post">
    <input type="hidden" value="<%=contest_id%>" name="contest_id">
	<div class="layui-inline" style="margin-left: 100px;">
      <label class="layui-form-label">选手一</label>
      <div class="layui-input-inline" style="width: 250px;">
      
        <input  name="player1" lay-verify="title" readonly="readonly" autocomplete="on" class="layui-input" id="player1" value="<%=battle.getPlayer1() %>">
        
        
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 300px;">
      <label class="layui-form-label">选手二</label>
      <div class="layui-input-inline"  style="width: 250px;">
        <input  name="player2" lay-verify="title" readonly="readonly" autocomplete="on" class="layui-input" id="player2" value="<%=battle.getPlayer2() %>">
       
        
      </div>
    </div>
    <br>  <br>
    <div class="layui-inline" style="margin-left: 100px;" >
      <label class="layui-form-label">参赛作品</label>
      <div class="layui-input-inline" style="width: 250px;">
        
         <input  name="player1_title" lay-verify="title" value="<%=battle.getPlayer1_title() %>" readonly="readonly"autocomplete="on" class="layui-input" id="player1_title">
        
       
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 300px;">
      <label class="layui-form-label">参赛作品</label>
      <div class="layui-input-inline" style="width: 250px;">
       <input  name="player2_title" lay-verify="title"  readonly="readonly"  value="<%=battle.getPlayer2_title() %>"autocomplete="on" class="layui-input" id="player2_title">
        
        
      </div>
    </div>
   
     <br>  <br>
    <div class="layui-inline" style="margin-left: 100px;" >
      <label class="layui-form-label">评委投票</label>
      <div class="layui-input-inline" style="width: 250px;">
        
         <input  name="player1_judge" lay-verify="title" placeholder="选手一评委投票"value="<%=battle.getPlayer1_judge() %>" autocomplete="on" class="layui-input" id="player1_title">
        
       
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 300px;">
      <label class="layui-form-label">评委投票</label>
      <div class="layui-input-inline" style="width: 250px;">
       <input  name="player2_judge" lay-verify="title" placeholder="选手二评委投票"  value="<%=battle.getPlayer2_judge() %>" autocomplete="on" class="layui-input" id="player2_title">
        
        
      </div>
    </div>
     <br>  <br>
    <div class="layui-inline" style="margin-left: 100px;" >
      <label class="layui-form-label">观众投票</label>
      <div class="layui-input-inline" style="width: 250px;">
        
         <input  name="player1_ticket" lay-verify="title" value="<%=battle.getPlayer1_ticket() %>"  readonly="readonly" autocomplete="on" class="layui-input" id="player1_title">
        
       
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 300px;">
      <label class="layui-form-label">观众投票</label>
      <div class="layui-input-inline" style="width: 250px;">
       <input  name="player2_ticket" lay-verify="title"  autocomplete="on" value="<%=battle.getPlayer2_ticket() %>"  readonly="readonly" class="layui-input" id="player2_title">
        
        
      </div>
    </div>
     <br>  <br>
    <div class="layui-inline" style="margin-left: 100px;" >
      <label class="layui-form-label" style="color: red">总投票数</label>
      <div class="layui-input-inline" style="width: 250px;">
        
         <input  name="player1_totalscore" lay-verify="title"  autocomplete="on" value="<%=battle.getPlayer2_totalscore()%>"  readonly="readonly"class="layui-input" id="player1_title">
        
       
      </div>
    </div>
    <div class="layui-inline" style="margin-left: 300px;">
      <label class="layui-form-label" style="color: red">总投票数</label>
      <div class="layui-input-inline" style="width: 250px;">
       <input  name="player2_totalscore" lay-verify="title"  autocomplete="on" value="<%=battle.getPlayer2_totalscore()%>"  readonly="readonly" class="layui-input" id="player2_title">
        
        
      </div>
    </div>
	 <br>
	 <div style="margin-left: 500px;margin-top: 40px;">
	  <button type="button" class="layui-btn layui-btn-warm" style="width: 80px;height: 50px;">提交</button>
	 <button type="button" class="layui-btn layui-btn-normal"style="width: 80px;height: 50px;margin-left: 100px;">返回</button>
	 </div>
	
   <hr class="layui-bg-green" style="margin-top: 70px;">
   

</form>
<script type="text/javascript">
$(function(){
	$(".layui-btn-warm").bind('click',function(){
		alert("submit");
		$("form").submit();
		
	});
	
	
	
});
	
	
</script>

</html>