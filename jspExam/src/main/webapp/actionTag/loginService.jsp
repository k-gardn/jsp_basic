<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--  loginDTO 클래스 인스턴스 생성   --%>
<%-- actionTag.LoginDTO loginDto = new actionTag.LoginDTO(); --%>
<%--id가 변수명 --%>
<jsp:useBean id="loginDto" class="actionTag.LoginDTO" /> 

<%--  setter, getter 메서드 호출  --%>
<%--loginDto.setId(request.getParameter("id"));--%>

<%--
<jsp:setProperty property="id" name="loginDto"/>
<jsp:setProperty property="pw" name="loginDto"/> 
--%>

<%-- "*"를 사용하여, DTO setter를 한번에 만들 수도 있음--%>
<jsp:setProperty property="*" name="loginDto"/>

<%--loginDto.getId();--%>
<%--loginDto.getPw();--%>
<%--
아이디 : <jsp:getProperty property="id" name="loginDto" /> 
비밀번호 : <jsp:getProperty property="pw" name="loginDto" />
--%>

<%
	//자바에서도 getter 원래대로쓸 수 있음.
		if("admin".equals(loginDto.getId()) && "1234".equals(loginDto.getPw())){
			session.setAttribute("id", "admin");
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("login.jsp");
		}
%>