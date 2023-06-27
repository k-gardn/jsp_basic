<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("data", "pageContext");
	request.setAttribute("data", "request");
	session.setAttribute("data", "session");
	application.setAttribute("data", "application");

%>

	<%-- 지정을 안해주면 다 확인하면서 있으면 넣어준다. 
		항상 scope 지정을 해주는게 좋다.
	--%> 
	범위 지정 없음 : ${data} <br> 
	pageContext : ${pageScope.data} <br> 
	request : ${requestScope.data} <br> 
	session : ${sessionScope.data} <br> 
	application : ${applicationScope.data} <br> 
	
	<a href="ex7_B.jsp">이동</a>


