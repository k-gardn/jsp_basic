<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_make</title>
</head>
<body>
<!-- http://localhost:8085/jsp_exam/cookie/ex2_make.jsp -->
	<%
		Cookie cookie = new Cookie("cookieName", "cookieValue");
		
		// 유효기간(초)
		cookie.setMaxAge(30); //  하루 : 60  * 60 * 24 
		
		// 서버가 클라이언트(웹브라우저)에게 생성한 쿠키를 전달함.
		// 서버가 주려면 응답에서 줘야하니까, response를 사용해야 함.
		response.addCookie(cookie);
	%>
	
	<a href="ex2_check.jsp">쿠키 확인하러 가기</a>
</body>
</html>