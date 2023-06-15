<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forResult</title>
</head>
<body>
	<h2>계산 결과</h2>
	<%
		String number =  request.getParameter("number");
		int numInt = 0;
		int sum = 0;
		// 숫자가 아닌 다른 문자가 들어갈 경우 에러가 나기 때문에 try/catch문을 써야함.
		try{
			numInt = Integer.parseInt(number);
		}catch(Exception e){
			response.sendRedirect("forForm.jsp");
			return; // jsp 페이지를 종료
			
		}
		for(int i=1 ; i <= numInt ; i++){
			out.print(i);
			if(i < numInt){
				out.print(" + ");
			}
			sum += i;
		}
		out.print(" = " + sum);
	%>
</body>
</html>