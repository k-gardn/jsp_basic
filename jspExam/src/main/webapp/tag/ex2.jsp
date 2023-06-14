<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = "홍길동";
	%>
	<h1> 이름은 <%= 10+30-30%> 입니다.</h1>
	<h1> 이름은 <% out.print(name); %> 입니다. </h1> <%--세미콜론 붙음 --%> 
	
</body>
</html>