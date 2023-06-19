<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = memberDao.selectId(id);
		memberDao.disConnection(); // db연결 끊기
		
		if(memberDto != null && memberDto.getPw().equals(pw)){
			session.setAttribute("id", memberDto.getId());
			session.setAttribute("name", memberDto.getName());
			session.setAttribute("email", memberDto.getEmail());
			response.sendRedirect("index.jsp");
		}else{
			// session.removeAttribute("id");
			response.sendRedirect("login.jsp");
		}
		
	%>

</body>
</html>