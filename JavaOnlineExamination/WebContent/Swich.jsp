<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function switchSysBar(){
	 if (parent.document.getElementById('attachucp').cols=="220,10,*"){
	 document.getElementById('leftbar').style.display="";
	 parent.document.getElementById('attachucp').cols="0,10,*";
	 }
	 else{
	 parent.document.getElementById('attachucp').cols="220,10,*";
	 document.getElementById('leftbar').style.display="none"
	 }
	}
	function load(){
	 if (parent.document.getElementById('attachucp').cols=="0,10,*"){
	 document.getElementById('leftbar').style.display="";
	 }
	}
</script>
<body marginwidth="0" marginheight="0" bgcolor="#f2f2f2" onload="load()" topmargin="200" leftmargin="0">
<center>
<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%">
<tbody>
<tr>
<td bgcolor="#009fef" width="1">
<img height="1" width="1" src="images/ccc.gif"/>
</td>
<td id="leftbar" bgcolor="#f5f4f4" style="display: none;">
<a onclick="switchSysBar()" href="javascript:void(0);">
<img height="90" border="0" width="9" alt="展开左侧菜单" src="images/pic24.gif"/>
</a>
</td>
<td id="rightbar" bgcolor="#f5f4f4">
<a onclick="switchSysBar()" href="javascript:void(0);">
<img height="90" border="0" width="9" alt="隐藏左侧菜单" src="images/pic23.gif"/>
</a>
</td>
</tr>
</tbody>
</table>
</center>
</body>
</html>