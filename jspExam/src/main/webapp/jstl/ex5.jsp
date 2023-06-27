<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%--경로 표현이 그렇지만 라이브러리를 찾아가는 것 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5</title>
</head>
<body>

	<c:set var="data" value="1" />
	
	 <c:if test="${data == 1 }">
	 	<h3>데이터는 1이다.</h3>
	 </c:if>
	 <c:if test="${data == 2 }">
	 	<h3>데이터는 2이다.</h3>
	 </c:if>
	 <c:if test="${data == 3 }">
	 	<h3>데이터는 3이다.</h3>
	 </c:if>
	 <h3>다 음 문 장</h3>
	 
	 <c:choose>
	 	<c:when test="${data == 1 }">
	 		<h3>데이터는 1이다.</h3>
	 	</c:when>
	 	<c:when test="${data == 2 }">
	 		<h3>데이터는 2이다.</h3>
	 	</c:when>
	 	<c:when test="${data == 3 }">
	 		<h3>데이터는 3이다.</h3>
	 	</c:when>
	 	<c:otherwise>
	 		<h3>데이터는 1 또는 2는 아니다.</h3>
	 	</c:otherwise>
	 </c:choose>
	 <h3>다 음 문 장</h3>
</body>
</html>