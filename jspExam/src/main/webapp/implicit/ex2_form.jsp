<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--  --%>
	<!--  <form action="http://localhost:8085/jsp_exam/implicit/ex2_result.jsp">-->
	<form action="ex2_result.jsp" method="post">
		<input type="text" placeholder="아이디" name="id"><br>
		<input type="password" placeholder="비밀번호" name="pw"><br>
		<input type="submit" value="로그인">
		<input type="button" value="취소" onclick="javascript:location.href='ex2_result.jsp'"><!-- location class에 href 객체에 넣어준다.-->
		<input type="reset" value="지우기">
		<!-- Service 에서 검증하고 -> DAO에 가서 db와 비교해야 할 듯 -->
	</form>

</body>
</html>