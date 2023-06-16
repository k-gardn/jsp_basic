<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_make</title>
</head>
<body>
	<%
		// 쿠키 생성 후 클라이언트에게 전달.
		Cookie cookie = new Cookie("popup", "popup");
		cookie.setMaxAge(30);
		// 서버가 클라이언트(웹브라우저)에게 생성한 쿠키를 전달함.
		response.addCookie(cookie);
	%>
	<script>window.close()</script>
</body>
</html>