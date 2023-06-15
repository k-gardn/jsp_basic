<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectResult</title>
</head>
<body>

	<%
		String engine =  request.getParameter("engine");
		response.sendRedirect("http://www." + engine +".com");
	%>
</body>
</html>