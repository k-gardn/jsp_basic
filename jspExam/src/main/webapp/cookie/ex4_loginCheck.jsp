<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");
	System.out.println("remember : " + remember);
	
	if(remember != null && remember.equals("true")){ //아이디 기억하기 체크박스에 체크를 함
		if("admin".equals(id) && "1234".equals(pw)){
			Cookie cookie = new Cookie("userId", "admin");
			response.addCookie(cookie);
		}
	}else{
		// 표시 안했을 때 아이디 자동완성되지 않게 하기 위해서 만든 것 같음.
		Cookie cookie = new Cookie("userId", "admin");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	response.sendRedirect("ex4_login.jsp");
%>
