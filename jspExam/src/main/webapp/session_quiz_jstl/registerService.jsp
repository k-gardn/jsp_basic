<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="memberDto" class="session.MemberDTO"/>

<jsp:setProperty property="*" name="memberDto"/> 
<!-- property와 parameter로 넘겨준 속성의 이름이 동일할 경우 바로 setter로 만들어진다. -->

<c:choose>
	<c:when test="${empty memberDto.id or empty memberDto.pw}">
		<c:redirect url="register.jsp" />
	</c:when>
	<c:when test="${ memberDto.pw != memberDto.confirm}">
		<c:redirect url="register.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:useBean id="memberDao" class="session_quiz.MemberDAO" />
		<c:set var="check" value="${memberDao.selectId(memberDto.id)}"/>
		<c:choose >
			<c:when test="${empty check}">
				${memberDao.register(memberDto.id, memberDto.pw, memberDto.userName, memberDto.address, memberDto.mobile)}
				<c:set var="msg" value="회원 가입 완료" />
				<c:set var="path" value="index.jsp"/>
			</c:when>
			<c:otherwise>
				<c:set var="msg" value="회원 가입 실패"/> <%--이미 가입된 회원일 경우 --%>
				<c:set var="path" value="register.jsp"/>
			</c:otherwise>
		</c:choose>
		${memberDao.disConnection()}
	</c:otherwise>
</c:choose>

<script>alert('${msg}'); location.href='${path}';</script>




