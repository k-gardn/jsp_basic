<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_make</title>
</head>
<body>

	<%
		// 클라이언트의 쿠키를 확인후
		Cookie[] cookies = request.getCookies();
		// 쿠키의 유무에 따라
		
		// script를 실행 / 미실행
		for(Cookie cookie : cookies){
			out.print("쿠키 이름 : " + cookie.getName() + "<br>");
			out.print("쿠키 값 : " + cookie.getValue() + "<br><br>");
		}
	%>
	<script>
		window.open(
			'ex3_popup.jsp',
			'',
			'width=300, height=300, left=400, top=200'
		)
	</script>
</body>
</html>