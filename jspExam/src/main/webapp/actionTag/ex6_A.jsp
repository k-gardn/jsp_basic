<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex6_A</title>
</head>
<body>

	<%
		pageContext.setAttribute("id", "pageId"); // 페이지가 바뀌면 값을 유지할 수 없음. -> pageContext는 지역변수 처럼 쓸 수 있음
		request.setAttribute("id", "requestId");  // 리 다이렉트 후에는 값이 사라짐.
		session.setAttribute("id", "sessionId");  // 서버 종료시 사라짐. 브라우저가 서버에 접근할 때 sessionId를 줌. 
		application.setAttribute("id", "applicationId"); //
	
		//request.getRequestDispatcher("ex6_B.jsp").forward(request, response);
	%>
	<jsp:forward page="ex6_B.jsp" />
</body>
</html>