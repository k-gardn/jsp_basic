<%@page import="session.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<table border=1>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%
		MemberDAO memberDao = new MemberDAO();
		ArrayList<MemberDTO> members = memberDao.selectAll();
		memberDao.disConnection();
		if(members.isEmpty()){
			out.print("<h3>등록 후 이용하세요.</h3>");
		}
		
		for(MemberDTO member : members){ 
		%>
			<tr>
				<td><%= member.getId() %></td>
				<td><%= member.getPw() %></td>
				<td><%= member.getName()%></td>
				<td><%= member.getEmail()%></td>
			</tr>
		<%
		} 
		%>
	</table>

</body>
</html>