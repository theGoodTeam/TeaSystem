﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.sql.*,java.io.*,common.*,user.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
</head>

<body>
<form action="/JavaOnlineExamination/QueryUser_Servlet" method="post">
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="/JavaOnlineExamination/all_manage/img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;-</span>&nbsp;用户管理
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
					<form>
						<div class="cfD">
							<input class="userinput" type="text" placeholder="输入用户名" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
							<button class="userbtn">搜索</button>
						</div>
					</form>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="400px" class="tdColor">用户名</td>
							<td width="630px" class="tdColor">用户密码</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<%
						 ArrayList<User> user_list = (ArrayList<User>)request.getAttribute("user_list"); 
						 if(user_list != null ){
								for(int i = 0;i<user_list.size();i++){
									User user = user_list.get(i);
							      
									
						 %>
						<tr height="40px">
							<td class="SortCLASS"><%request.getContextPath();%></td>
							<td><%=user.getAccount() %></td>
							<td><%=user.getPassword() %></td>
							<td><a href="useradd.html"><img class="operation"src="/JavaOnlineExamination/all_manage/img/update.png"></img></a> 
							<img class="operation delban" src="/JavaOnlineExamination/all_manage/img/delete.png"></img></td>
						</tr>
						<%}   
}%>  						<tr height="40px">
							<td>1</td>
							<td>运营专员</td>
							<td>山下就只</td>
							<td>2015-25-36 12:12</td>
							<td><a href="useradd.html"><img class="operation" src="img/update.png"></a> 
							<img class="operation delban" src="img/delete.png"></td>
						</tr>
					</table>
					<div class="paging">此处是分页</div>
				</div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>

	</div>


	<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="img/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="#" class="ok yes">确定</a><a class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
		</form>
</body>

<style type="text/css">


</style>

<script type="text/javascript">
// 广告弹出框
$(".delban").click(function(){
  $(".banDel").show();
});
$(".close").click(function(){
  $(".banDel").hide();
});
$(".no").click(function(){
  $(".banDel").hide();
});
// 广告弹出框 end
</script>

</html>