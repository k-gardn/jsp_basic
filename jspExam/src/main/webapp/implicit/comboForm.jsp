<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoForm</title>
</head>
<body>
	<h3>검색 엔진을 선택하세요.</h3>
	<br>
	<form action="comboResult.jsp" method="post">  
		<select name="engine" >
		    <option value="google">구글</option>
		    <option value="naver">네이버</option>
  		</select>
	
		<input type="submit" value="확인">
	</form>
	
</body>
</html>