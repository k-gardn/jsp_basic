<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%--경로 표현이 그렇지만 라이브러리를 찾아가는 것 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3</title>
</head>
<body>
	<%
	String data1 = "자바 변수의 데이터";
	pageContext.setAttribute("data2", data1);
	%>
	data1 : <%=data1 %><br>
	<c:set var="data3" value="jstl 변수의 데이터" />
	<c:set var="data4" value="<%=data1 %>" />
	<%-- jstl과 el을 함께 써야할때 --%>
	
	data1 : ${data1 }<br> <%--이거는 안나옴 --%>
	data2 : ${pageScope.data2 }<br>
	data3 : ${data3 }<br>
	data4 : ${data4 }
	
</body>
</html>