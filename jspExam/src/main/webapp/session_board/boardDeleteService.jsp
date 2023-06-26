<%@page import="java.io.File"%>
<%@page import="session_board.BoardDTO"%>
<%@page import="session_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 작성자와 session 값 비교
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("../session_quiz/login.jsp");
		return;
	}
	
	String num = request.getParameter("num");
	
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectNo(num);
	if(board == null){
		response.sendRedirect("boardContent.jsp?num="+num);
		return;
	}
	if(id.equals(board.getId()) == false){
		response.sendRedirect("boardContent.jsp?num="+num);
		return;
	}
	// 테이블 삭제, 파일삭제
	boardDao.delete(num);
	boardDao.disConnection();
	
	String saveDir = "C:\\javas\\upload\\" + id + "\\" + board.getFileName();
	File f = new File(saveDir);
	if(f.exists() == true){
		f.delete();	
	}
	
	response.sendRedirect("boardForm.jsp");
%>





