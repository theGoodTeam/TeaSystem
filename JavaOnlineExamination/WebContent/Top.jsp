<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>
body {
background-color: #3992d0;

line-height: 10px;
}
.exit{
margin-top: 50px;
}
.right{
margin-right: 15px;
}
a{
text-decoration: none;
text-shadow: blue;
}
.title{
font-size: 60px;
margin-left: 100px;
letter-spacing: 15px;
font-family: '华文彩云';
}
.top{
margin-top:25px;
float: left;
color: white;
}
</style>

<body>
<%
 //获取session变量保存的用户信息
 User user = (User)session.getAttribute("user");
 String count = (String)application.getAttribute("count");//获取在线人数
 %>
<div class="top"><font class="title">在线考试后台管理系统</font></div>
<p align="right" class="right">『<%=user.getAccount()%>』你好！&nbsp; 在线人数: <%=count%> </p>
<p id = "showtime" align="right">
<div class="exit">
<p align="right"><a href="/JavaOnlineExamination/Exit_Servlet" target="_top">退出</a></p>
</div>

<!-- 超链接 -->
<!-- _self:显示本身位置
     _top:会把原来的框架删除，让连接的页面充满页面（常用）
     _blank:会产生一个新的窗口（新的页面）
     _parent:子窗口显示在父窗口中
 -->
 


<script language="javascript"> 
function showtime(){
	var mytime=new Date();
	var nian=mytime.getFullYear();
	var yue=mytime.getMonth()+1;
	var riqi=mytime.getDate();
	var xingqi=mytime.getDay();
	var myarr=new Array("天","一","二","三","四","五","六");
	var shi=mytime.getHours()<10?"0"+mytime.getHours():mytime.getHours();
	var fen=mytime.getMinutes()<10?"0"+mytime.getMinutes():mytime.getMinutes();
	var miao=mytime.getSeconds()<10?"0"+mytime.getSeconds():mytime.getSeconds();
	var st=document.getElementById("showtime");
	st.innerHTML="<span class='red'>"
		+nian+"</span>年<span class='red'>"
		+yue+"</span>月<span class='red'>"
		+riqi+"</span>日 星期<span class='red'>"
		+myarr[xingqi]+"</span> "
		+shi+":"+fen+":"+miao;
}
var t=setInterval(function(){showtime();},1000); 
</script> 
</body>
</html>