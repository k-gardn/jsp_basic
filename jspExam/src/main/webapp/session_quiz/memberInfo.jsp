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
	
	<!--  
	처음에는 무조건 1페이지를 보여줘야하고.
	페이지 번호를 눌렀을 때, 해당 페이지를 보여줘야한다.
	이전, 다음도 구현해야함.
	-->
	<%
		String cp = request.getParameter("currentPage");
		String select = request.getParameter("select"); // 검색어
		String search = request.getParameter("search"); // 검색 카테고리
		
		if(select == null){
			select = "";
		}
		
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		int pageBlock = 4; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
	%>
	<div align="center">
		<h1>회원 목록</h1>
		
		<%
			MemberDAO memberDao = new MemberDAO();
			//ArrayList<MemberDTO> members = memberDao.selectAll();
			
			ArrayList<MemberDTO> members = null;
			double totalCount = 0;
			 // 페이지 번호 눌렀을 때 해당하는 데이터 불러오기.
			 if(select.isEmpty()){
				members = memberDao.getPage(begin, end);
				totalCount = memberDao.count();
			 }else{
				members = memberDao.getPage(begin, end, select, search);
				totalCount = memberDao.count(select, search);
			 }

			 // 해당하는 모든 데이터의 수.
			
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
					<th>주소</th>
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
					<td><%=member.getAddress() %></td>
					<td><%=member.getMobile() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<%} 
		// 해당하는 전체 데이터 수(totalCount)를 알아야 페이지를 나눌 수 있음.
		int totalPage = (int)Math.ceil(totalCount / pageBlock); // 11명인데 한 페이지에 3명일 때, 2명 남음 -> 4페이지.
		if(currentPage > 1){
			out.print("<a href='memberInfo.jsp?&currentPage="+(currentPage-1)+"'>[이전] </a>");
		}
		else{
			out.print("<a href='memberInfo.jsp?&currentPage="+1+"'>[이전] </a>");
		}
		
		for(int i=1; i<=totalPage; i++){
			out.print("<a href='memberInfo.jsp?&currentPage="+i+"'>["+i+"] </a>");
		}
		
		if(currentPage < totalPage){
			out.print("<a href='memberInfo.jsp?&currentPage="+(currentPage+1)+"'>[다음] </a>");
		}
		else{
			out.print("<a href='memberInfo.jsp?&currentPage="+totalPage+"'>[다음] </a>");
		}
		%>
		<form>
			<select name="select">
				<option value="total">전체</option>
				<option value="id">아이디</option>
				<option value="address">주소</option>
				<option value="mobile">전화번호</option>
			</select>
			<input type="text" name="search">
			<input type="submit" value="검색">
		</form>
	</div>
	
	
	
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>






























