<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>



<body>

<%
//退出的处理页面
session.setAttribute("userName",null);//清空session变量userName

//下线
int n;//当前在线人数
String count;//当前在线人数
count = (String)application.getAttribute("count");
n = Integer.parseInt(count);
n--;
application.setAttribute("count",String.valueOf(n));//更新当前在线人数
response.sendRedirect("../Login_suprime/index.jsp");//退到登录页面
%>

</body>



</html>