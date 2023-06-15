<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5_A</title>
</head>
<body>

	<%
	// forward는 getRequestDispatcher라는 class안에 있는 매서드
	// redirect와 다른 점 = url이 바뀌지 않음 -> 요청이 안 되었다는 의미!!!!
	// trafic이 줄어듦. -> 상황에 따라 redirect 혹은 forward를 적절하게 쓰면됨.
		request.getRequestDispatcher("ex5_B.jsp").forward(request, response);
	
	%>
</body>
</html>