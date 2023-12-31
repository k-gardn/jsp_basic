<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<c:import url="header.jsp" />

<c:set var="id" value="${sessionScope.id}" />
<c:choose>
	<c:when test="${empty id }">
		<c:redirect url="login.jsp" />
	</c:when>
	<c:otherwise>
		<div align="center">
			<h1>회원 수정</h1>
			<table ><tr><td>
			<form action="updateService.jsp" method="post" id="f">
				<input type="text" value="${id}" id="id"> (*필수 항목) <br>
				<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
				<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
				onchange="pwCheck()">
				<label id="label" ></label><br>
				<input type="text" name="userName" id="userName" value="${sessionScope.userName }" ><br>
				<input type="text" name="address" value="${sessionScope.address}"><br>
				<input type="text" name="mobile" value="${sessionScope.mobile}"><br>
				<input type="button" value="회원수정" onclick="allCheck()">
				<input type="button" value="취소" onclick="location.href='index.jsp'"><br>
			</form>
			</td></tr></table>
		</div>
	</c:otherwise>
</c:choose>
<c:import url="footer.jsp" />




