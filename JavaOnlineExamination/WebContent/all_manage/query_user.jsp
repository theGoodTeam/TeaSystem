<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.util.Iterator,java.util.ArrayList,java.util.List,java.sql.*,java.io.*,common.*,user.*,subject.*"%>
<!DOCTYPE HTML>
<html>
<head>
<%String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
  %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<style type="text/css">
@charset"UTF-8";

body{margin:0px;padding:0px;font-family:Verdana, Arial, Helvetica, Meiryo, '寰蒋闆呴粦', sans-serif;font-size: 12px; background-color:#f1f1f1; color:#333;}
div,
form,
h1,h2,h3,h4,
ul,li,
dl,dt,dd,
p{margin:0px;padding:0px;line-height: 1.5em;}
p,dt,dd{text-align:justify;text-justify:distribute;}
a img,img{border:0;}
li{list-style-type:none;}

*{transition:color 200ms,background 200ms,border 200ms,opacity 300ms;
-moz-transition:color 200ms,background 200ms,border 200ms,opacity 300ms;
-webkit-transition:color 200ms,background 200ms,border 200ms,opacity 300ms;
-o-transition:color 200ms,background 200ms,border 200ms,opacity 300ms}
@charset"UTF-8";
html,body{margin:0px;padding:0px;height:100%; line-height:100%;width:100%;border:none;}
h1{}
h2{}
h3{}
h4{}
.clr{clear:both;}
.floatL{float:left;}
.floatR{float:right;}
.alignL{text-align:left;}
.alignR{text-align:right;}
.alignC{clear:both;text-align:center;}
.lastChild{margin-right:0%!important;float:right!important;}
.f_cA{ color:#1fbba6;}
.f_cB{ color:#e32727;}
.f_cC{ color:#3085be;}
.f_cD{ color:#4a91b9;}

.f_s14{ font-size:14px;}
.f_s16{ font-size:16px;}

.bgcA td,
.bgcA th{ background-color:#6fe7d7;}
.bgcB td,
.bgcB th{ background-color:#ffa0a0;}
.bgcC td,
.bgcC th{ background-color:#84ceff;}
.bgcD td,
.bgcD th{ background-color:#ffdcab;}

.money{ text-align:right !important;}
.msg{ padding:10px 0px 10px 10px;}

.pdg_t5{ padding-top:5px;}
.mag_r20{margin-right:20px;}
.mag_l20{margin-left:20px;}


#Wrap{}
address{ text-align:center; font-style:normal; line-height:1.8em;  color:#999;border-top:#dfe4e7 solid 1px;padding:20px 0px;}
address span{ color:#8c9bc1; padding-right:45px;}

.wrap_left{width:250px;background-color:#55a9cd; overflow: auto;}
.wrap_right{ text-align:left;overflow: auto;height:100%;}
.picBox{width:12px;background:#efefef url(../images/common/right.gif) no-repeat right center;cursor:pointer;}
.picBox:hover{filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;}
.wrap_left,.picBox{float:left;height:100%;}

#Logo{height:72px;line-height:72px;text-align:center;background-color:#FFF;padding-top:15px; position:relative;}
*html #Logo{height:87px;}
#Logo h1{width:243px;height:61px;margin:0px auto;background:url(../images/common/logo.gif) no-repeat left top;text-indent:-9999px;display:block;}
#Logo span{ display:block; font-size:12px; font-weight:bold; color:#eb6d48; position:absolute; right:15px; top:-18px;}
#Header{background-color:#FFF;height:87px; border-bottom:#e9e9e9 solid 2px;}
#Header .user{ width:300px; float:right; padding-top:14px;}
#Header .user div{ width:300px; clear:both;}
#Header .user p{ float:left; padding-right:5px;}
#Header .user a{ float:left; margin-left:10px; width:auto; position:relative;}
#Header .user a span{ display:block;-moz-border-radius: 30px; -webkit-border-radius: 30px;border-radius:30px; position:absolute; right:-10px; top:-10px; padding:0px 5px; background-color:#e95c5c; color:#FFF; z-index:999;}
#Header .user a:hover{ width:auto;filter:alpha(opacity=60);-moz-opacity:0.6;opacity:0.6;}
#Header .user .search_box{ width:227px; margin-left:65px; margin-top:5px;}
#Header .user .search_box input{ float:left;}
#Header .user .search_box .box{border-bottom:#cad6e2 solid 1px;border-right:#cad6e2 solid 1px;border-top:#cad6e2 solid 1px;border-left: none; width:165px; height:26px; padding-left:10px;}

#Navi{ padding-top:20px;margin-left:20px;}
#Navi .btn_menu{ padding-top:7px; width:45px;float:left;}
#Navi ul{ padding-left:60px; width:auto;}
#Navi li{text-align:center;float:left; padding-left:0.8%; padding-right:0.8%;}
#Navi li a{display:block;width:100%;text-align:center;padding:30px 0px 0px 0px;color:#919dac;text-decoration:none;font-size:12px;}
#Navi li.active a,
#Navi li a:hover{ color:#4a91b9;}
#Navi li a img{display:block;margin:0px auto;}
#Navi li a span{display:block;text-align:center;padding-top:12px;}
#Navi li.nav01 a{background:url(../images/common/navi01.gif) no-repeat center top;}
#Navi li.nav01 a:hover{background:url(../images/common/navi01_o.gif) no-repeat center top;}
#Navi li.nav02 a{background:url(../images/common/navi02.gif) no-repeat center top;}
#Navi li.nav02 a:hover{background:url(../images/common/navi02_o.gif) no-repeat center top;}
#Navi li.nav03 a{background:url(../images/common/navi03.gif) no-repeat center top;}
#Navi li.nav03 a:hover{background:url(../images/common/navi03_o.gif) no-repeat center top;}
#Navi li.nav04 a{background:url(../images/common/navi04.gif) no-repeat center top;}
#Navi li.nav04 a:hover{background:url(../images/common/navi04_o.gif) no-repeat center top;}
#Navi li.nav05 a{background:url(../images/common/navi05.gif) no-repeat center top;}
#Navi li.nav05 a:hover{background:url(../images/common/navi05_o.gif) no-repeat center top;}
#Navi li.nav06 a{background:url(../images/common/navi06.gif) no-repeat center top;}
#Navi li.nav06 a:hover{background:url(../images/common/navi06_o.gif) no-repeat center top;}
#Navi li.nav07 a{background:url(../images/common/navi07.gif) no-repeat center top;}
#Navi li.nav07 a:hover{background:url(../images/common/navi07_o.gif) no-repeat center top;}
#Navi li.nav08 a{background:url(../images/common/navi08.gif) no-repeat center top;}
#Navi li.nav08 a:hover{background:url(../images/common/navi08_o.gif) no-repeat center top;}


.menu_list{width:100%;clear:both;background-color:#55a9cd;}
.menu_list dl{}
.menu_list dt{font-size:16px;position:relative;cursor:pointer;background:#55a9cd url(../images/common/ico01.gif) no-repeat 1.5em 1.1em;padding:15px 20px 15px 66px;color:#FFF; }
.menu_list dt.open,
.menu_list dt:hover{color:#b7d7e7;}
.menu_list dt span{display:block;padding-right:10px;background:url(../images/common/ico03.png) no-repeat right center;}

.menu_list dd{font-size:16px;display:none; position:relative;}
.menu_list dd a{padding:10px 0px 10px 66px;color:#FFF;display:block;text-decoration:none;background:#55a9cd;background-repeat: no-repeat;background-position: right center;}
.menu_list dd a.active,
.menu_list dd a:hover{
	padding: 10px 0px 10px 60px;
	border-left: #FFF solid 6px;
	background-color: #63b7dc;
	background-image: url(../images/common/ico_arrowA.gif);
	background-repeat: no-repeat;
	background-position: right center;
}


#Contents{ padding:25px 20px 25px 20px; height: auto; overflow:auto;}
#TopMain{ margin-bottom:20px;}
#BtmMain{ margin-top:20px;}
#BtmMain .ttl{ font-size:16px; float:left; padding:8px 20px 0px 0px;}
#MainForm{ background-color:#FFF;-webkit-box-shadow: #e0e0e0 0px 0px 10px;-moz-box-shadow: #e0e0e0 0px 0px 10px;box-shadow: #e0e0e0 0px 0px 10px; clear:both;}
#MainForm h2{ background-color:#f9f9f9; font-size:16px; padding:15px 20px 12px 20px; color:#333; font-weight:normal; border-bottom:#e8e8e8 solid 1px;}

.form_boxA{}
.form_boxA table{width:100%;}
.form_boxA th{border-bottom:#e3e3e3 solid 2px; text-align:center; font-size:14px; padding:10px 0px;}
.form_boxA td{border-bottom:#e3e3e3 solid 1px; text-align:center; font-size:14px; padding:8px 15px;}
.form_boxA a{ color:#3085be; text-decoration:none;}
.form_boxA a:hover{ color:#1e628f; text-decoration:underline;}

.form_boxB{}
.form_boxB table{width:100%;}
.form_boxB th{border-bottom:#e3e3e3 solid 2px; text-align:center; font-size:14px; padding:10px 0px;}
.form_boxB td{border-bottom:#e3e3e3 solid 1px;border-right:#e3e3e3 solid 1px;text-align:center; font-size:14px; padding:8px 15px;}
.form_boxB td.last{border-right: none !important;}
.form_boxB a{ color:#3085be; text-decoration:none;}
.form_boxB a:hover{ color:#1e628f; text-decoration:underline;}

.form_boxC{ padding:0px 20px;}
.form_boxC th{ font-size:16px; font-weight:normal; text-align:left; padding:5px 15px 5px 0px;}
.form_boxC td{ padding:5px 0px;}

.form_boxD{ padding:0px 20px;}
.form_boxD th{ font-size:16px; font-weight:normal; text-align:left; padding:5px 15px 5px 0px;border-top:#e3e3e3 solid 1px;}
.form_boxD td{ padding:5px 0px; border-top:#e3e3e3 solid 1px;}
.form_boxD tr.ttl th{border-bottom:#CCC solid 1px;border-top: none !important;}


.selectbox{ padding:3px; background-color:#FFF;-webkit-box-shadow: #e0e0e0 0px 0px 10px;-moz-box-shadow: #e0e0e0 0px 0px 10px;box-shadow: #e0e0e0 0px 0px 10px;}
.selectbox .sttl{ float:left; font-size:16px; display:block; color:#1fbba6; padding:6px 10px 0px 10px;}
.selectbox .select{position:relative;float:left;z-index:999; width:100%;}
.selectbox .select dt{
	height: 29px;
	line-height: 29px; font-size:16px;
	cursor: pointer;padding-left:10px; 
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	position: relative;
	z-index: 99;
	background: url(../images/common/ico10.gif) no-repeat right top;
}
.selectbox .select dt:hover,.select dt.cur{}
.selectbox .select dd{position:absolute;left:0;top:29px;background:#fff;display:none;width:100%; font-size:14px;-webkit-box-shadow: #e0e0e0 0px 0px 5px;-moz-box-shadow: #e0e0e0 0px 0px 5px;box-shadow: #e0e0e0 0px 0px 5px;}
.selectbox .select dd ul{max-height:250px;overflow:auto; width:100%;}
.selectbox .select dd ul li a{line-height:28px;display:block;padding:0 8px; text-decoration:none; color:#333;}
.selectbox .select dd ul li a:hover{background:#f1f1f1;color:#1fbba6;}

.txtbox{ padding:3px; background-color:#FFF;-webkit-box-shadow: #e0e0e0 0px 0px 10px;-moz-box-shadow: #e0e0e0 0px 0px 10px;box-shadow: #e0e0e0 0px 0px 10px;}
.txtbox .sttl{ float:left; font-size:16px; display:block; color:#1fbba6; padding:6px 5px 0px 10px;}
.txtbox input{ border:none;height:29px;line-height: 29px; float:left; font-size:16px; padding:0px 10px;}
.txtbox textarea{border:none;font-size:16px; padding:10px;}

.btn_box{ -webkit-box-shadow: #e0e0e0 0px 0px 10px;-moz-box-shadow: #e0e0e0 0px 0px 10px;box-shadow: #e0e0e0 0px 0px 10px;}
.btn_box input{ height:33px; line-height:33px; vertical-align:middle; border:none; font-size:16px; background-color:#1fbba6; padding:0px 10px; color:#FFF;-moz-border-radius: 3px; -webkit-border-radius: 3px;border-radius:3px; cursor:pointer;}
.btn_box .input_out{ background-color:#1fbba6;}
.btn_box .input_move{ background-color:#009b86;}

.btn_boxB{ -webkit-box-shadow: #e0e0e0 0px 0px 10px;-moz-box-shadow: #e0e0e0 0px 0px 10px;box-shadow: #e0e0e0 0px 0px 10px;}
.btn_boxB input{ height:33px; line-height:33px; vertical-align:middle; border:none; font-size:16px; background-color:#888; padding:0px 10px; color:#FFF;-moz-border-radius: 3px; -webkit-border-radius: 3px;border-radius:3px; cursor:pointer;}
.btn_boxB .input_out{ background-color:#888;}
.btn_boxB .input_move{ background-color:#666;}

.info_boxA{ text-align:left !important; font-size:16px; font-weight:bold; padding-left:20px !important; border-right: none !important;}

#PageNum{ text-align:center; padding-top:50px;}
#PageNum li{ text-align:center; display:inline-block; padding:0px 5px;}
#PageNum li a{ display:block; background-color:#FFF; height:30px; line-height:30px; vertical-align:middle; font-size:12px; padding:0px 10px;-moz-border-radius: 30px; -webkit-border-radius: 30px;border-radius:30px; text-decoration:none; color:#333;}
#PageNum li a:hover{ background-color:#eb6d48; color:#FFF;}


#Popup{}
#Popup #BtmBtn{ padding:15px 20px;border-top:#e3e3e3 solid 1px;}
#SubPopup{ padding:20px;}
#maskTitle{ background-color:#e5e5e5 !important; background-image:none !important;}

@media all and (max-width:1200px) 
{
#Navi li{text-align:center;float:left; padding-left:3px; padding-right:3px;}
}



@charset"UTF-8";
/* hack css */
#Header,
#Navi,
#TopMain,
#BtmMain,
.selectbox,
.txtbox,
#Popup #BtmBtn,
#Header .user div,
#Header .user .search_box
{display:inline-block;}


#Header:after,
#Navi:after,
#TopMain:after,
#BtmMain:after,
.selectbox:after,
.txtbox:after,
#Popup #BtmBtn:after,
#Header .user div:after,
#Header .user .search_box:after
{content: ".";display: block;height: 0;clear: both;visibility: hidden;overflow: hidden;}



/* Hide from IE-mac \*/
*html #Header,
*html #Navi,
*html #TopMain,
*html #BtmMain,
*html .selectbox,
*html .txtbox,
*html #Popup #BtmBtn,
*html #Header .user div,
*html #Header .user .search_box
{height: 1%;}


#Header,
#Navi,
#TopMain,
#BtmMain,
.selectbox,
.txtbox,
#Popup #BtmBtn,
#Header .user div,
#Header .user .search_box
{display: block;}
/* End hide fromIE-mac*/







@charset"UTF-8";

#Side,
#Header ul
{display: none;}

#Wrap{border:none;}
#Contents{}
#Main{padding:10px 54px;float:none;}
address{}


#spanFirst {
text-align:center;
padding-top:50px;
text-align:center; 
display:inline-block;
padding:0px 5px;
background-color:#FFF;
height:30px;
line-height:30px;
vertical-align:middle;
font-size:12px; 
padding:0px 10px;
-moz-border-radius: 30px; 
-webkit-border-radius: 30px;
border-radius:30px; 
text-decoration: none;
}
#spanPre{
text-align:center;
padding-top:50px;
text-align:center; 
display:inline-block;
padding:0px 5px;
background-color:#FFF;
height:30px;
line-height:30px;
vertical-align:middle;
font-size:12px; 
padding:0px 10px;
-moz-border-radius: 30px; 
-webkit-border-radius: 30px;
border-radius:30px; 
text-decoration: none;
}

#spanNext{
text-align:center;
padding-top:50px;
text-align:center; 
display:inline-block;
padding:0px 5px;
background-color:#FFF;
height:30px;
line-height:30px;
vertical-align:middle;
font-size:12px; 
padding:0px 10px;
-moz-border-radius: 30px; 
-webkit-border-radius: 30px;
border-radius:30px; 
text-decoration: none;
}
#spanLast{
text-align:center;
padding-top:50px;
text-align:center; 
display:inline-block;
padding:0px 5px;
background-color:#FFF;
height:30px;
line-height:30px;
vertical-align:middle;
font-size:12px; 
padding:0px 10px;
-moz-border-radius: 30px; 
-webkit-border-radius: 30px;
border-radius:30px; 
text-decoration: none;
}
</style>


<script src="js/jquery-1.10.1.min.js"></script>
<script src="js/side.js" type="text/javascript"></script>



<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

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
<%//获取session变量中保存的商品信息
response.setContentType("text/html ; charset = utf-8"); 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("urf-8");

SubjectDao dao = new SubjectDao();
ArrayList<Subject> list = dao.doSelectAll_list();
Iterator<Subject> it = list.iterator();
%>
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
<input style="margin-right: 400px;" type="submit" value="站内搜索" onMouseMove="this.className='input_move'" onMouseOut="this.className='input_out'"></div>
<!-- /btn_box -->
</div>

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
<table cellpadding="0" cellspacing="0" id="t_student">
<tr>
<th>序号</th>
<th>科目编号</th>
<th>科目名称</th>
<th>科目类别</th>
<th>科目简介</th>
<th colspan="3">操作</th>
</tr>
 <%
 ArrayList<Subject> sub_list = (ArrayList<Subject>)request.getAttribute("sub_list"); 
 if(sub_list != null ){
		for(int i = 0;i<sub_list.size();i++){
			Subject subject = sub_list.get(i);
	      
			
 %>
<tr>
<td><%=subject.getSub_id()%></td>
<td><%=subject.getSub_code()%></td>
<td><%=subject.getSub_name()%></td>
<td><%=subject.getSub_type()%></td>s
<td><%=subject.getSub_desc()%></td>

<td class="last"><a href="all_manage/sub_update.jsp?id=<%=subject.getSub_id()%>">修改</a></td>
<td class="last"><a href="Delete_subject_servlet?id=<%=subject.getSub_id()%>">删除</a></td>
</tr>
<%}   
}%>

</table>

<div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;" > 
        共有 <span id="spanTotalInfor"></span> 条记录     
        当前第<span id="spanPageNum"></span>页     
        共<span id="spanTotalPage"></span>页
    </div>
    <div class="gridItem" style="margin-left:50px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
            <span id="spanFirst" onmouseover="this.style.background='#eb6d48'" onmouseout="this.style.background=''">首页</span> 
            <span id="spanPre" onmouseover="this.style.background='#eb6d48'" onmouseout="this.style.background=''">上一页</span>
            <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
                第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页 
            </span>
            <span id="spanNext" onmouseover="this.style.background='#eb6d48'" onmouseout="this.style.background=''">下一页</span> 
            <span  id="spanLast" onmouseover="this.style.background='#eb6d48'" onmouseout="this.style.background=''">尾页</span> 
        </div>


</div>
</div>

 </form>
<!-- /MainForm -->
 <script type="text/javascript">
            var theTable = document.getElementById("t_student");
            var txtValue = document.getElementById("Text1").value;
            function changepage() {
                var txtValue2 = document.getElementById("Text1").value;
                if (txtValue != txtValue2) {
                    if (txtValue2 > pageCount()) {

                    }
                    else if (txtValue2 <= 0) {

                    }
                    else if (txtValue2 == 1) {
                        first();
                    }
                    else if (txtValue2 == pageCount()) {
                        last();
                    }
                    else {
                        hideTable();
                        page = txtValue2;
                        pageNum2.value = page;

                        currentRow = pageSize * page;
                        maxRow = currentRow - pageSize;
                        if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
                        for (var i = maxRow; i < currentRow; i++) {
                            theTable.rows[i].style.display = '';
                        }
                        if (maxRow == 0) { preText(); firstText(); }
                        showPage();
                        nextLink();
                        lastLink();
                        preLink();
                        firstLink();
                   }

                    txtValue = txtValue2;
                }
            }
            
    </script>
    
   <script type="text/javascript">
 //获取对应控件
   var totalPage = document.getElementById("spanTotalPage");//总页数
   var pageNum = document.getElementById("spanPageNum");//当前页
   var totalInfor = document.getElementById("spanTotalInfor");//记录总数
   var pageNum2 = document.getElementById("Text1");//当前页文本框

   var spanPre = document.getElementById("spanPre");//上一页
   var spanNext = document.getElementById("spanNext");//下一页
   var spanFirst = document.getElementById("spanFirst");//首页
   var spanLast = document.getElementById("spanLast");//尾页
   var pageSize = 8;//每页信息条数

   var numberRowsInTable = theTable.rows.length-1;//表格最大行数

   var page = 1;

   //下一页
   function next() {
       if (pageCount() <= 1) {
       }
       else {
               hideTable();
               currentRow = pageSize * page + 1; //下一页的第一行
               maxRow = currentRow + pageSize;    //下一页的一行
               if (maxRow > numberRowsInTable) maxRow = numberRowsInTable+1;//如果计算中下一页最后一行大于实际最后一行行号
               for (var i = currentRow; i < maxRow; i++) {
                   theTable.rows[i].style.display = '';
               }
               page++;
               pageNum2.value = page;
               if (maxRow == numberRowsInTable) { //如果下一页的最后一行是表格的最后一行
                   nextNoLink(); //下一页 和尾页 不点击
                   lastNoLink(); 
               }
               showPage();//更新page显示
               if (page == pageCount()) {//如果当前页是尾页
                   nextNoLink();
                   lastNoLink();
               }
               
               preLink();
               firstLink();
           }
       }



   //上一页
   function pre() {
       if (pageCount() <= 1) {
       }
       else {       
               hideTable();
               page--;
               pageNum2.value = page;
               currentRow = pageSize * page + 1;//下一页的第一行
               maxRow = currentRow - pageSize;//本页的第一行
               if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;//如果计算中本页的第一行小于实际首页的第一行行号，则更正
               for (var i = maxRow; i < currentRow; i++) {
                   theTable.rows[i].style.display = '';
               }
               if (maxRow == 0) { preNoLink(); firstNoLink(); }
               showPage();//更新page显示
               if (page == 1) {
                   firstNoLink();
                   preNoLink();
               }
               nextLink();
               lastLink();
           }
       }


   //第一页
   function first() {
       
       if (pageCount() <= 1) {
       }
       else {
           hideTable();//隐藏所有行
           page = 1;
           pageNum2.value = page;
           for (var i = 1; i < pageSize+1; i++) {//显示第一页的信息
               theTable.rows[i].style.display = '';
           }
           showPage();//设置当前页

           firstNoLink();
           preNoLink();
           nextLink();
           lastLink();
       }
   }


   //最后一页
   function last() {
       if (pageCount() <= 1) {
       }
       else {
           hideTable();//隐藏所有行
           page = pageCount();//将当前页设置为最大页数
           pageNum2.value = page;
           currentRow = pageSize * (page - 1)+1;//获取最后一页的第一行行号
           for (var i = currentRow; i < numberRowsInTable+1; i++) {//显示表格中最后一页信息
               theTable.rows[i].style.display = '';
           }

           showPage();
           lastNoLink();
           nextNoLink();
           preLink();
           firstLink();
       }
   }


   function hideTable() {//隐藏表格内容
       for (var i = 0; i < numberRowsInTable+1; i++) {
           theTable.rows[i].style.display = 'none';
       }
       theTable.rows[0].style.display = '';//标题栏显示
   }


   function showPage() {//设置当前页数
       pageNum.innerHTML = page;
   }

   function inforCount() {//设置总记录数
       spanTotalInfor.innerHTML = numberRowsInTable;
   }

   //总共页数
   function pageCount() {
       var count = 0;
       if (numberRowsInTable % pageSize != 0) count = 1;
       return parseInt(numberRowsInTable / pageSize) + count;
   }


   //显示链接 link方法将相应的文字变成可点击翻页的  nolink方法将对应的文字变成不可点击的
   function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
   function preNoLink(){ spanPre.innerHTML = "上一页"; }

   function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
   function nextNoLink(){ spanNext.innerHTML = "下一页";}

   function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>首页</a>"; }
   function firstNoLink(){ spanFirst.innerHTML = "首页";}

   function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>尾页</a>"; }
   function lastNoLink(){ spanLast.innerHTML = "尾页";}

   //初始化表格
   function hide() {
       for (var i = pageSize + 1; i < numberRowsInTable+1 ; i++) {
           theTable.rows[i].style.display = 'none';
       }
       theTable.rows[0].style.display = '';

       inforCount();

       totalPage.innerHTML = pageCount();
       showPage();
       pageNum2.value = page;

       if (pageCount() > 1) {
           nextLink();
           lastLink();
       }

   }

   hide();
   
   </script>

<!-- BtmMain -->

<!-- /BtmMain -->


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
