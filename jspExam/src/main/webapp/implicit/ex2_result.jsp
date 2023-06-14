<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_result</title>
</head>
<body>

	<%
		// 내장객체 HttpServletRequest request = new HttpServletRequest();
		String id =  request.getParameter("id");
		String pw =  request.getParameter("pw");
		
		//나중에 아마도 이런 식으로 로그인 검증을 할 것이다.
		//MemberDAO memberDao = new MemberDAO();
		//memberDao.selectId();
		out.print("아이디 : " + id + "<br>");
		out.print("비밀번호  : " + pw + "<br>");
	%>
</body>
</html>