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
  
    <link rel="stylesheet" href="css/layui.css"  media="all">
    <script src="js/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/images.css" media="all" />
	<link rel="stylesheet" href="css/pk.css" media="all" />
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/images.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
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
 <form action="" class="layui-form">
	
		<ul id="Images" >
			<li style="border: 1px solid red;margin-left: 15px;">
				<img src="images/金秀贤.jpg">
				<div class="operate">
						<div class="check">
						<input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="金秀贤">
						</div>
						<button type="button" style="float:left  ;background-color: #0083BC;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 40px;" >看详情</button>
						<button type="button" style="float:left  ;background-color: #F7BE39;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 5px;" >投一票</button>
				</div>
			</li>
			
			
							
			
			<li style="border: 1px solid green;float: right;margin-right: 15px;">
				<img src="images/杨幂.jpg">
				<div class="operate">
						<div class="check">
						<input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="杨幂">
						</div>
						<button type="button" style="float:left  ;background-color: #0083BC;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 55px;" >看详情</button>
						<button type="button" style="float:left  ;background-color: #F7BE39;border: none;color: #fff;
						width: 55px;height: 25px;border-radius: 8%;cursor: pointer;margin-top: 6px;margin-left: 5px;" >投一票</button>
				</div>
			</li>
		</ul>
	
	
	<br><br><br>
		  <div id="box_bg" style="-moz-transform:scale(1.3,1.8);" >
				    <div id="container" >
				        <div id="green" class="line"></div>
				        <div id="red" class="line"></div>
				        <div id="white" class="line"></div>
				        <div id="vs"></div>
				    </div>
				</div>
				
				<div style="width:440px; margin:50px auto;font-size: 20px;font-family: '楷体'">
				    <div id="aa2" class="scope">正方<span id="aa"></span>票</div>
				    <div id="bb2" class="scope">反方<span id="bb"></span>票</div>
				    <div id="all2" class="scope">总共<span id="all"></span>票</div>
				</div>
		
				
	
</form> 
</body>
<script type="text/javascript">
    // alert("00");
    $(document).ready(function(){
        var a = 1;
        var b = 10;
        $("#white").animate({ width: 0,left:"250px"}, 1000 ,function(){
            $("#vs").fadeIn("slow",function(){
                $("#all").html(a+b);$("#aa").html(a);$("#bb").html(b);
                var newLeft = a/(a+b)*500-20 + "px"; //20为vs 的一半
                $("#vs").animate({left:newLeft}, 1000);
                $("#red").animate({width:newLeft}, 1000);
            });
        });
        
       <%--  alert(<%=$(result)%>); --%>
        
       
    });
    
    
    layui.use('element', function(){
    	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    	  
    	  //监听导航点击
    	  element.on('nav(demo)', function(elem){
    	    //console.log(elem)
    	    layer.msg(elem.text());
    	  });
    	});
</script>
</html>