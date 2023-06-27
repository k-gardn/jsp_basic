<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

	아이디 : <%=request.getParameter("id") %><br>
	비밀번호 : <%=pwd %><br>
	
	<br>
	
	<%-- el태크 param을 사용할 수 있다. --%>
	아이디 : ${param.id}<br> 
	비밀번호 : ${param.pwd}<br>
