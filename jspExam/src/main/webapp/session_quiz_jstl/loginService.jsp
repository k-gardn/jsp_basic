<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="memberDao" class="session_quiz.MemberDAO" />
<c:set var="memberDto" value="${memberDao.selectId(param.id)}" />
${memberDao.disConnection() }
<c:choose>
	<c:when test="${not empty memberDto and memberDto.pw == param.pw }">
		<c:set var="id" value="${memberDto.id}" scope="session" />
		<c:set var="userName" value="${memberDto.userName}" scope="session" />
		<c:set var="address" value="${memberDto.address}" scope="session" />
		<c:set var="mobile" value="${memberDto.mobile}" scope="session" />
		<c:redirect url="index.jsp"/>
	</c:when>
	<c:otherwise>
		<c:redirect url="login.jsp" />
	</c:otherwise>
</c:choose>


