<%@page import="session_board.BoardDTO"%>
<%@page import="session_board.BoardDAO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		textArea 수정하고 db에 update
	*/
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO boardDto = boardDao.selectNo(num);
	
	boardDao.updateContent(num, title, content);
	response.sendRedirect("boardForm.jsp");
%>