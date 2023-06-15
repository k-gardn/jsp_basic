<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bmiResult</title>
</head>
<body>

	<h3>BMI 결과</h3>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String name =  request.getParameter("name");
		String height =  request.getParameter("height");
		String weight =  request.getParameter("weight");
		
		double heightNum = 0 , weightNum = 0 ;
		
		try {
			heightNum = Double.parseDouble(height);
			weightNum = Double.parseDouble(weight);
		} catch (NumberFormatException e) {
			response.sendRedirect("bmiForm.jsp");
		}
		
		double standardWeight =  (heightNum - 100) * 0.9;
		double BMI = weightNum / standardWeight * 100;
		String BMIStr = String.format("%.2f", BMI);
		
		String result ="";
		if(BMI >= 130){
			result = "고도비만";
		}else if(BMI >= 120){
			result = "비만";
		}else if(BMI >= 110){
			result = "과체중";
		}else if(BMI >= 100){
			result = "정상";
		}else{
			result = "저체중";
		}
		out.print(name + " 님의 비만도는 " + BMIStr + "% 로 " + result +" 입니다.");
		
	%>
</body>
</html>