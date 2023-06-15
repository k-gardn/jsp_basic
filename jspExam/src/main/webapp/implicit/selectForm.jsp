<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoForm</title>
</head>
<body>

	<form action="selectResult.jsp" method="post">
		학력  
		<select name="education" >
		    <option value="재학생">재학생</option>
		    <option value="학사">학사</option>
		    <option value="석사">석사</option>
		    <option value="박사">박사</option>
  		</select>
  		<br>
  		<br>
		소속 국가
		<select name='country' size='3'>
		  <option value='대한민국'>대한민국</option>
		  <option value='미국'>미국</option>
		  <option value='일본'>일본</option>
		</select>
		<br>
		<br>
		관심 분야
		<select multiple name='interests' size='4'>
		  <option value='컨설팅'>컨설팅</option>
		  <option value='프로듀서'>프로듀서</option>
		  <option value='프로그래머'>프로그래머</option>
		  <option value='서버관리자'>서버관리자</option>
		</select>
		<br>
		<br>
		<input type="submit" value="전송" onclick="javascript:location.href='selectResult.jsp'">
		<input type="reset" value="지우기">
	</form>
	<!-- 쌤 풀이 -->
	<!-- 
	<form action="selectResult.jsp" method="post">
		<table>
			<tr><td>학력</td>
				<td>
					<select name="edu">
						<option>재학생</option>
						<option>학사</option>
						<option>석사</option>
						<option>박사</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 소속 국가 </td>
				<td><select name="country" size="4">
					<option>대한민국</option>
					<option>미국</option>
					<option>중국</option>
					<option>일본</option>
				</select>
				</td>
			</tr>
			<tr>
				<td> 관심 분야 </td>
				<td>
				<select name="like" size="4" multiple>
					<option>IT 컨설팅</option>
					<option>프로그래머</option>
					<option>시스템엔지니어</option>
					<option>네트워크엔지니어</option>
				</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
		<input type="reset" value="초기화">
	</form>
	-->
</body>
</html>