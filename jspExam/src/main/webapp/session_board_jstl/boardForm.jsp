<%@page import="session.PageService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardForm</title>
</head>
<body>

	<c:import url="/session_quiz_jstl/header.jsp" />
	
	<fmt:requestEncoding value="utf-8"/>
	
	<c:set var="currentPage" value="1" />
	<c:catch var="catchException">
		<c:set var="currentPage" value="${Integer.parseInt(param.currentPage)}" />
	</c:catch>
	<c:if test = "${catchException != null}">
		<c:set var="currentPage" value="1" />
	</c:if>
	
	<jsp:useBean id="boardDao" class="session_board.BoardDAO" />
	<c:set var="totalBoard" value="${boardDao.boardCount()}" />
	<c:set var="eachPage" value="4" />
	<c:set var="end" value="${currentPage * eachPage }" />
	<c:set var="begin" value="${end - eachPage + 1 }" />
	<c:set var="boards" value="${ boardDao.getBoardPage(begin, end)}" />
	
	<div align="center"  >
		<h1>게시판 목록</h1>
		<table border=1 style="width:80%;">
			<thead>
				<tr>
					<th>No.</th>
					<th width="200px">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty boards}">
					<tr align="center">
						<td colspan='5'>등록된 값이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="boardDto" items="${boards}">
						<tr align="center">
							<td>${boardDto.no}</td>
							<td onclick="location.href='boardContent.jsp?no=${boardDto.no}'">
								${boardDto.title}
							</td>
							<td>${boardDto.id}</td>
							<td>${boardDto.writeDate}</td>
							<td>${boardDto.hits}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
						<c:set var="url" value='${"boardForm.jsp?currentPage="}' />
						<c:set var="result" value="${PageService.printPage(url, currentPage, totalBoard, eachPage)}" />
				<tr>
					<td colspan='4'>
						${result}
					</td>
					<td>
						<button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<c:import url="/session_quiz/footer.jsp" />
	
</body>
</html>