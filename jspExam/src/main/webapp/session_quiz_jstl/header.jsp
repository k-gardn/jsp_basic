<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<style type="text/css">
	a {text-decoration: none; color:black;}
	ul {padding: 20px;}
	ul li {display: inline; padding: 15px;}
	.main_div{height: 150px; padding-top : 80px;}
</style>    

<script src="session_quiz.js"></script>


<div align="center">
	<h1>CARE</h1>
</div>

<c:url var="context" value="/session_quiz_jstl" />
<div align="right">
	<hr>
	<ul>
		<li><a href="${context }/index.jsp">HOME</a></li>
		<li><a href="${context }/register.jsp">Register</a></li>
		<li><a href="${context }/login.jsp">Login</a></li>
		<li><a href="${context }/memberInfo.jsp">MemberInfo</a></li>
		<li><a href="${context }/logout.jsp">Logout</a></li>
		<li><a href="${context }/boardForm.jsp">Board</a></li>
	</ul>
	<hr>
</div>