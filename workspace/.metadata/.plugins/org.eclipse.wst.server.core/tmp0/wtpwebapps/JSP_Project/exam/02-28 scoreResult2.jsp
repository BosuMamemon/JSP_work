<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreResult2</title>
	</head>
	
	<%
	request.setCharacterEncoding("utf-8");
	ScoreBean sb = new ScoreBean();
	
	sb.setName(request.getParameter("name"));
	sb.setKor(Integer.parseInt(request.getParameter("kor")));
	sb.setEng(Integer.parseInt(request.getParameter("eng")));
	sb.setMath(Integer.parseInt(request.getParameter("math")));
	%>
	
	<body>
		이름: <%= sb.getName()%><br>
		국어: <%= sb.getKor() %><br>
		영어: <%= sb.getEng() %><br>
		수학: <%= sb.getMath() %><br>
		<br>
		총점: <%= sb.getTotal() %><br>
		평균: <%= sb.getAvg() %><br>
		학점: <%= sb.getGrade() %><br>
	</body>
</html>