<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoResult</title>
</head>
<body>

	<h3>입력한 정보는 아래와 같습니다.</h3>
	
	<%
		request.setCharacterEncoding("utf-8");
		String id =  request.getParameter("id");
		String pw =  request.getParameter("pw");
		String introduce =  request.getParameter("introduce");
		
		out.print("ID : " + id + "<br>");
		out.print("Password  : " + pw + "<br>");
		out.print("자기소개  : " + introduce + "<br>");
	%>
</body>
</html>