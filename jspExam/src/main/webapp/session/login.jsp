<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<%
	String userId = (String)session.getAttribute("userId");
	
	// admin으로 로그인 했을 경우,
	if(userId != null){
	%>
	<%=userId%> 님이 로그인 상태입니다.
	<br>
	<br>
	<button onclick="location.href='index.jsp'">인덱스 이동</button>
	<%	
	}
	
	// admin으로 로그인 하지 않았을 경우,
	else{
	%>
	<form action="loginService.jsp" method="post">
		<input type="text" placeholder="아이디" name="id"><br>
		<input type="password"  placeholder="비밀번호" name="pw"><br>
		
		<br><input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
	<%	
	}
		
	%>

</body>
</html>