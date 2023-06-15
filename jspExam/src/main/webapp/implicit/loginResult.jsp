<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forResult</title>
</head>
<body>
	<%
	
	String id =  request.getParameter("id");
	String password =  request.getParameter("pw");
	
	String dbId = "admin";
	String dbPw = "admin";
	
	if(id.equals("")  || password.equals("")){
		response.sendRedirect("loginForm.jsp");
	}
	else if(id.equals(dbId) && password.equals(dbPw)){
		response.sendRedirect("loginIndex.jsp");
	}else{
		response.sendRedirect("loginFailed.jsp");
	}
		
	%>
		
</body>
</html>