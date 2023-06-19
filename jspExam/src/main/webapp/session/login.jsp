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
	String id = (String)session.getAttribute("userId");
	
	if(id != null){
	%>
	<%=id%> 님이 로그인 상태입니다.
	<br>
	<br>
	<button onclick="location.href='index.jsp'">인덱스 이동</button>
	<%	
	}
	
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