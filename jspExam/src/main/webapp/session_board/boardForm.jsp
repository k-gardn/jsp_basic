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
		request.setCharacterEncoding("utf-8");
		String cp = request.getParameter("currentPage");
		
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		BoardDAO boardDao = new BoardDAO();
		// BoardDTO boardDto = new BoardDTO();
		int totalBoard = boardDao.boardCount();
		int eachPage = 4;
		
		int begin = (eachPage * (currentPage - 1)) + 1; // 1,4,7
		int end = currentPage * eachPage; //3,6,9
		ArrayList<BoardDTO> boards =  boardDao.getBoardPage(begin, end);
		
	%>
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
			<%
			if(boards.isEmpty()){%>
				<tr align="center">
					<td colspan='5'>등록된 값이 없습니다.</td>
				</tr>
			<%	
			}else{
				for(BoardDTO boardDto : boards){%>
					<tr align="center">
						<td><%= boardDto.getNo()%></td>
						<td onclick="location.href='boardContent.jsp?num=<%= boardDto.getNo()%>'">
							<%= boardDto.getTitle()%>
						</td>
						<td><%= boardDto.getId()%></td>
						<td><%= boardDto.getWriteDate()%></td>
						<td><%= boardDto.getHits()%></td>
					</tr>
					
				<%}%>
			
			<%
			}
			%>
				<tr>
					<td colspan='4'>
					<%
						int totalPage = totalBoard / eachPage;
						if(totalBoard % eachPage != 0)
							totalPage++;
						if(currentPage > 1){%>
							<a href="boardForm.jsp?currentPage=<%= currentPage-1%>">[이전]</a>
						<%}else{%>
							<a href="boardForm.jsp?currentPage=1">[이전]</a>
						<%}
						%>
						<%for(int i=1; i <=totalPage; i++){%>
							<a href="boardForm.jsp?currentPage=<%= i%>"><%= i%></a>
						<%}
						if(currentPage < totalPage){%>
							<a href="boardForm.jsp?currentPage=<%= currentPage+1%>">[다음]</a>
						<%}else{%>
							<a href="boardForm.jsp?currentPage=totalPage">[다음]</a>
						<%}
						%>
					</td>
					<td>
						<button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
	
</body>
</html>