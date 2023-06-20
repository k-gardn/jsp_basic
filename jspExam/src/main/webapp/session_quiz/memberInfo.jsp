<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>
	<div align="center">
		<h1>회원 목록</h1>
		
		<%
			MemberDAO memberDao = new MemberDAO();
			ArrayList<MemberDTO> members = memberDao.selectAll();
			if(members.isEmpty() == true){
				out.print("<h1> 등록된 데이터가 존재하지 않습니다. </h1>");
				return;
			}else{
		%>
		<table border=1>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDTO member : members){ %>
				<tr>
					<td onclick="location.href='userInfo.jsp?id=<%=member.getId() %>'">
						<%=member.getId() %>
					</td>
					<td><%=member.getUserName() %></td>
					<td><%=member.getMobile() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<%} %>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>






























