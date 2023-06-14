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
	
		int sum = 0;
		int evenSum = 0;
		int oddSum = 0;
			for(int i = 1; i <= 100 ; i++){
				sum += i;
				if(i % 2 == 0){
					evenSum += i;
				}else{
					oddSum += i;
				}
			}
		out.print(String.format("<div>1 + 2 + 3 + ... + 100 = %d</div>", sum));
		out.print("<br>"); 
		
		out.print(String.format("<div>1 ~ 100 까지의 짝수의 합 = %d</div>", evenSum));
		out.print("<br>");
		
		out.print(String.format("<div>1 ~ 100 까지의 홀수의 합 = %d</div>", oddSum));
		out.print("<br>");
	%>
		1 + 2 + 3 + ... + 100 = 	<%= sum %> <br>
		1 ~ 100 까지의 짝수의 합 : 		<%= evenSum %> <br>
		1 ~ 100 까지의 홀수의 합 :  	<%= oddSum %> <br>

</body>
</html>