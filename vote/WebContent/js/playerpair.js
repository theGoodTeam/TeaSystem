//alert("user.js");
var areaData = address;
var $form;
var form;
var $;
layui.config({
	base : "js/"
}).use(['form','layer','upload','laydate','jquery','laypage'],function(){
	form = layui.form();
	var layer = parent.layer === undefined ? layui.layer : parent.layer;
		$ = layui.jquery;
		$form = $('form');
		laydate = layui.laydate;
        loadProvince();

})

