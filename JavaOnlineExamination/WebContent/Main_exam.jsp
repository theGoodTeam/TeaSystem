<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>



<frameset rows="80,304" cols="*" framespacing="1" border="1" bordercolor="#66FFFF">
<frame src="Top.jsp"  name="top" scrolling="no"  noresize="noresize" />

<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="220,10,*" rows="*">

<frame scrolling="yes" noresize="" frameborder="no" name="leftFrame" src="left.jsp"></frame>

<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="Swich.jsp"></frame>


<frame scrolling="yes" noresize="" border="0" name="mainFrame" src="all_manage/tab.jsp"></frame>


</frameset>
  
</frameset>
<noframes>
<body>
</body>
</noframes>

</html>