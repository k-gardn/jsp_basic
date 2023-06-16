<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4_login</title>
</head>
<body>
<%--
0. ex4_login -> ex4_loginCheck
1. 체크박스를 클릭하고 로그인 시 ID/PW가 일치하면 
   ex4_login.jsp 에서 아이디의 값을 출력해주세요.
2. 체크박스를 클릭하고 로그인 시 ID/PW가 틀리면 
   ex4_login.jsp 에서 아이디의 값을 출력하지 않아요.
3. 체크박스를 클릭하지 않고 로그인 성공/실패 두 경우 모두 
	ex4_login.jsp 에서 아이디의 값을 출력하지 않아요.
 --%>
 <%
	String loginId = (String)session.getAttribute("userId"); 
 	// userId 이름을 갖고 있는 Attribute가 존재한다면'admin'을 반환할 것임.
 	// userId 이름을 갖고 있는 Attribute가 존재하지 않으면 null을 반환.
 	String id = "";
 	
 	if(loginId != null){
 		id = loginId;
 	}else{
 		id = "";
 	}
	
 
 %>
	<form action="ex4_loginCheck.jsp" method="get">
		<input type="text" placeholder="아이디" name="id" value="<%=id%>"> <br>
		<input type="password" placeholder="비밀번호" name="pw" ><br> 
		<% 
		if(id.isEmpty()){
			out.print("<input type='checkbox' name='remember' value='true' />아이디 기억하기"); 
		}else{
		%>
			<input type="checkbox" name="remember" value="true" checked="checked"/>아이디 기억하기 
		<%
		}
		%>
		<br><input type="submit" value="로그인" >
		<input type="reset" value="취소" >	
	</form>
</body>
</html>

