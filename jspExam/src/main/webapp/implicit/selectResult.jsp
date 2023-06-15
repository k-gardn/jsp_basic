<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectResult</title>
</head>
<body>

	<h3>입력한 정보는 아래와 같습니다.</h3>
	
	<%
		request.setCharacterEncoding("utf-8");
		String education =  request.getParameter("education");
		String country =  request.getParameter("country");
		String[] interests =  request.getParameterValues("interests");
		
		out.print("학력 : " + education + "<br>");
		out.print("소속 국가  : " + country + "<br>");
		
		out.print("관심 분야  : ");
		for(String interest : interests){
			out.print(interest + " " );
		}
	%>
</body>
</html>