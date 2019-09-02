<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.sql.*,java.io.*,common.*,user.*,subject.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<link href="css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
<link href="css/print.css" rel="stylesheet" type="text/css"  media="print" />
<script src="js/jquery-1.10.1.min.js"></script>
<script src="js/side.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<body>
<!-- Popup -->
<div id="Popup">
<%
int id = Integer.parseInt(request.getParameter("id"));//获取传递过来的被修改的用户的编号
System.out.println(id);
request.setAttribute("id", id);
SubjectDao dao = new SubjectDao();
Subject subject = dao.doSelect(id);
%>

<!-- SubPopup -->
<div id="SubPopup">
<script type="text/javascript">
$(function(){
$(".select").each(function(){
var s=$(this);
var z=parseInt(s.css("z-index"));
var dt=$(this).children("dt");
var dd=$(this).children("dd");
var _show=function(){dd.slideDown(200);dt.addClass("cur");s.css("z-index",z+1);};
var _hide=function(){dd.slideUp(200);dt.removeClass("cur");s.css("z-index",z);};
dt.click(function(){dd.is(":hidden")?_show():_hide();});
dd.find("a").click(function(){dt.html($(this).html());_hide();});
$("body").click(function(i){ !$(i.target).parents(".select").first().is(s) ? _hide():"";});})})
</script>
<form action="/JavaOnlineExamination/Update_Subject_Servlet" method="post"> 
<input type="hidden" name="id" value="<%=subject.getSub_id()%>">
<div class="form_boxC" style="margin-left: 300px;">
<table cellpadding="0" cellspacing="0">
<tr>
<th width="100">科目编号</th>
<td><!-- selectbox -->
<div class="selectbox" style="width:230px;height: 30px;">
<input class="select" type="text" style="width:225px;height: 25px;" name="sub_code" value="<%=subject.getSub_code()%>">
</div>
<!-- /selectbox --></td>
</tr>
<tr>
<th>科目名称</th>
<td><!-- selectbox -->
<div class="selectbox" style="width:230px;">
<input class="select" type="text" style="width:225px;height: 25px;"  name="sub_name" value="<%=subject.getSub_name()%>">
</div>
<!-- /selectbox --></td>
</tr>

</table>
</div>
</div>
<!-- SubPopup -->
<div id="BtmBtn">
<div class="btn_boxB floatR mag_l20"><input name=""  value="返回" type="button"  onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onclick="window.location.href='query_sub.jsp';"></div>
<div class="btn_box floatR"><input name="" type="submit" value="提交" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></div>
</div>
</div>
</form>
<!-- /Popup -->

</body>
</html>