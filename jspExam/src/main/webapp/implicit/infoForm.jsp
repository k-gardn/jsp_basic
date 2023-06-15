<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoForm</title>
</head>
<body>

	<form action="infoResult.jsp" method="post">
		ID : <input type="text" placeholder="아이디" name="id"><br>
		Password : <input type="password" placeholder="비밀번호" name="pw"><br>
		자기소개 <br> <textArea name="introduce"></textArea><br>
		<input type="submit" value="전송" onclick="javascript:location.href='infoResult.jsp'">
		<input type="reset" value="지우기">
	</form>
	

</body>
</html>