<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>구구단</h2>
	<%
		// 반복문 사용해서 구구단(2~9단) 출력하기.
		
		for(int i = 1; i <= 9 ; i++){
			for(int j= 1; j <=9 ; j++){
			
				// out.print(i + " X " + j + " = " + i*j+ "<br>");
				out.print(String.format("<div> %d X %d = %d </div>",i , j, i*j));
			}
			out.print("<br>");
		}
	%>


</body>
</html>