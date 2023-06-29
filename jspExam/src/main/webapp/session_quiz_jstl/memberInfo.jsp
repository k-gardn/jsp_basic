<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<c:choose>
		<c:when test="${empty param.select }">
			<c:set var="select" value="" />
		</c:when>
	</c:choose>
	
	<c:catch var="catchException">
		<c:set var="currentPage" value="${Integer.parseInt(param.currentPage)}"/>
	</c:catch>
	<c:if test = "${catchException != null}">
		<c:set var="currentPage" value="1" />
	</c:if>
	
	<c:set var="pageBlock" value="4" />
	<c:set var="end" value="${pageBlock * currentPage}" />
	<c:set var="begin" value="${end - pageBlock + 1}" />
	
	<jsp:useBean id="memberDao" class="session_quiz.MemberDAO" />
	
	<c:choose>
		<c:when test="${empty param.select}">
			<c:set var="members" value="${memberDao.getPage(begin, end)}" />
			<c:set var="totalCount" value="${memberDao.count()}" />
		</c:when>
		<c:otherwise>
			<c:set var="members" value="${memberDao.getPage(begin, end, select, search)}" />
			<c:set var="totalCount" value="${ memberDao.count(select, search)}" />
		</c:otherwise>
	</c:choose>
	
	<div align="center">
		<h1>회원 목록</h1>
	<c:choose>
		<c:when test="${empty members}">
			<h1> 등록된 데이터가 존재하지 않습니다. </h1>
		</c:when>
		<c:otherwise>
			<table border=1>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<c:forEach var="member" items="${members}">
					<tbody>
						<tr>
							<td onclick="location.href='userInfo.jsp?id=${member.id}'">
								${member.id}
							</td>
							<td>${member.userName}</td>
							<td>${member.address}</td>
							<td>${member.mobile}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<c:set var="totalPage" value="${Math.ceil(totalCount / pageBlock)}"/>
	<c:choose>
		<c:when test="${currentPage > 1}">
			<a href='${"memberInfo.jsp?&currentPage="}${currentPage-1}'>[이전]</a>
		</c:when>
		<c:otherwise>
			<a href='${"memberInfo.jsp?&currentPage=1"}'>[이전]</a>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="1" end="${totalPage}" step="1">
			<a href='${"memberInfo.jsp?&currentPage="}${i}'>[${i}] </a>
	</c:forEach>
	
	<c:choose>
		<c:when test="${currentPage < totalPage}">
			<a href='${"memberInfo.jsp?&currentPage="}${(currentPage+1)}'>[다음]</a>
		</c:when>
		<c:otherwise>
			<a href='${"memberInfo.jsp?&currentPage="}${totalPage}'>[다음]</a>
		</c:otherwise>
	</c:choose>
		
		<form>
			<select name="select">
				<option value="total">전체</option>
				<option value="id">아이디</option>
				<option value="address">주소</option>
				<option value="mobile">전화번호</option>
			</select>
			<input type="text" name="search">
			<input type="submit" value="검색">
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>






























