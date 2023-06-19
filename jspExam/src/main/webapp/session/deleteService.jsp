<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("delete.jsp");
		return;
	}
	
	if(pw.equals(confirmPw) == false){
		response.sendRedirect("delete.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO(); // 이때 db연결
	MemberDTO memberDto = memberDao.selectId(id);
	
	if(pw.equals(memberDto.getPw()) == false){
		response.sendRedirect("delete.jsp");
		return;
	}
	memberDao.delete(id);
	memberDao.disConnection(); // db연결 끊기
	
	session.invalidate();
	response.sendRedirect("index.jsp");
	

%>