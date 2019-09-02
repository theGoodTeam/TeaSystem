<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.util.Iterator,java.util.ArrayList,java.util.List,java.sql.*,java.io.*,common.*,user.*,subject.*"%>
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
<%//获取session变量中保存的商品信息
SubjectDao dao = new SubjectDao();
ArrayList<Subject> list = dao.doSelectAll_list();
Iterator<Subject> it = list.iterator();
%>
<body>
<!-- wrap_left -->

<!-- /wrap_left -->

<!-- picBox -->
<div class="picBox" onClick="switchSysBar()" id="switchPoint"></div>
<!-- /picBox -->



<!-- wrap_right -->
<div class="wrap_right">
<header>
<!-- Header -->

<!-- /Header -->
</header>

<form action="/JavaOnlineExamination/QuerySub_servlet" method="post">
<!-- Contents -->

<div id="BtmMain">
<span class="ttl">商品查找</span>

<!-- txtbox -->
<div class="txtbox floatL mag_r20">
<span class="sttl">按名称：</span>
<input name="sub_name" type="text" size="8">
</div>
<!-- /txtbox -->

<!-- txtbox -->
<div class="txtbox floatL mag_r20">
<span class="sttl">按类别：</span>
<input name="sub_type" type="text" size="8">
</div>
<!-- /txtbox -->



<!-- btn_box -->

<!-- /btn_box -->

<!-- btn_box -->
<div class="btn_box floatR mag_l20">
<input style="margin-right: 400px;" type="submit" value="搜索" onMouseMove="this.className='input_move'" onMouseOut="this.className='input_out'"></div>
<!-- /btn_box -->
</div>
</form>
<div id="Contents">
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

<!-- MainForm -->
<div id="MainForm">
<div class="form_boxB">
<h2>全部科目</h2>
<table cellpadding="0" cellspacing="0">
<tr>
</tr>
<tr>
<th>序号</th>
<th>科目编号</th>
<th>科目名称</th>
<th>科目类别</th>
<th>科目简介</th>

<th colspan="3">操作</th>
</tr>
 <%while(it.hasNext()){
	 Subject subject = it.next();
			  %>
<tr>
<td><%=subject.getSub_id()%></td>
<td><%=subject.getSub_code()%></td>
<td><%=subject.getSub_name()%></td>
<td><%=subject.getSub_type()%></td>
<td><%=subject.getSub_desc()%></td>

<td class="last"><a href="#">修改</a></td>
<td class="last"><a href="#">删除</a></td>
</tr>
<%} %>

</table>
<p class="msg">共找到6条年度预算记录，当前显示从第1条至第10条</p>
</div>
</div>
<!-- /MainForm -->


<!-- BtmMain -->

<!-- /BtmMain -->

<!-- PageNum -->
<ul id="PageNum">
<li><a href="#">首页</a></li>
<li><a href="#">上一页</a></li>
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li><a href="#">6</a></li>
<li><a href="#">下一页</a></li>
<li><a href="#">尾页</a></li>
</ul>
<!-- /PageNum -->
</div>
<!-- /Contents -->

<!-- /footer -->
<footer>
<address>2019 Corporation,All Rights</address>
</footer>
<!-- /footer -->

</div>
<!-- /wrap_right -->
</body>
</html>
