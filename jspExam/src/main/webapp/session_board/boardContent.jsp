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

	<%@ include file="/session_quiz/header.jsp" %>
	<%
		String num = request.getParameter("num");
		BoardDAO boardDao = new BoardDAO();
		BoardDTO boardDto = boardDao.selectNo(num);
		
		if(num == null || boardDto == null){
			response.sendRedirect("/session_board/boardForm.jsp");
			return;
		}
		
		if(boardDto.getFileName() == null){
			boardDto.setFileName("");
			return;
		}
		
		boardDao.updateHits(num);
	%>
	<script>
		function deleteCheck(){
			result = confirm('진짜로 삭제하겠습니까?');
			if(result == true){
				location.href='boardDeleteService.jsp?num=<%=boardDto.getNo()%>'
			}
		}
	</script>
	
	<div align="center">
	<h1>글 내용</h1> 
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
				<th>제목</th><td colspan='3'><%= boardDto.getTitle()%></td>
			</tr>
			<tr>
				<th>문서내용</th><td colspan='3'><%= boardDto.getContent()%></td>
			</tr>
			<tr>
				<td colspan='4'>
					<form>
						<button type="button" onclick="location.href='boardForm.jsp'">목록</button>
						<button type="button" onclick="location.href='boardModify.jsp?num=<%=boardDto.getNo()%>'">수정</button>
						<button type="button" onclick= "deleteCheck()">삭제</button>
					</form>
				
				</td>
			</tr>
		</table>
	</div>

	<%@ include file="/session_quiz/footer.jsp" %>
	
</body>
</html>