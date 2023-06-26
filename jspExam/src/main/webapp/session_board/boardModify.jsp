<%@page import="session_board.BoardDTO"%>
<%@page import="session_board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardForm</title>
</head>
<body>
	<!-- 

	 -->
	<%@ include file="/session_quiz/header.jsp" %>
	<%
		String num = request.getParameter("num");
		
		if(num == null){
			response.sendRedirect("boardContent.jsp?num=" + num);
			return;
		}
		
		BoardDAO boardDao = new BoardDAO();
		BoardDTO boardDto = boardDao.selectNo(num);
		boardDao.disConnection();
		
		if(boardDto == null){
			response.sendRedirect("boardContent.jsp?no="+num);
			return;
		}
		
		if(boardDto.getFileName() == null)
			boardDto.setFileName("");
		
	%>
	<div align="center">
	<h1>글 내용</h1> 
		<form action="boardModifyService.jsp?num=<%=boardDto.getNo() %>" method="post">
			<table border = 1>
				<tr>
					<th>작성자</th><td><%= boardDto.getId()%></td>
					<th>조회수</th><td><%= boardDto.getHits()%></td>
				</tr>
				<tr>
					<th>작성일</th><td><%= boardDto.getWriteDate()%></td>
					
					<th>다운로드</th>
					<!-- boardDownload.jsp?id=admin&fileNmae=test.txt&no=13 -->
					<td onclick="location.href='boardDownload.jsp?id=<%=boardDto.getId()%>&fileName=<%=boardDto.getFileName()%>&num=<%=boardDto.getNo()%>'">
						<%= boardDto.getFileName()%>
					</td>
				</tr>
				<tr>
					<th>제목 수정</th>
					<td colspan='3'>
						<input style="width:100%;" type="text" name="title" value="<%= boardDto.getTitle()%>">
					</td>
				</tr>
				<tr>
					<th>문서내용 수정</th>
					<td colspan='3'>
						<textarea rows="10" cols="30" style="width:100%" name="content"><%= boardDto.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan='4'>
					<button type="button" onclick="location.href='boardForm.jsp'">목록</button>
						<button type="button" onclick="history.back()">이전</button> <!-- 자바스크립트 코드 -->
						<input type="submit" value="수정">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
	
</body>
</html>