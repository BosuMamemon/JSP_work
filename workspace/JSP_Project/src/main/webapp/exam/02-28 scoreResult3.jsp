<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreResult3</title>
	</head>
	
	<%
	request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="sb" class="com.exam.ScoreBean"/>
	<!-- sb라는 이름의 ScoreBean 객체를 태그로 생성한 것임 -->
	<jsp:setProperty property="*" name="sb"/>
	<!-- 사용하려면 클래스의 필드명과 html의 name이 같아야함 -->
	
	<body>
		이름: <%= sb.getName()%><br>
		국어: <%= sb.getKor() %><br>
		영어: <%= sb.getEng() %><br>
		수학: <%= sb.getMath() %><br>
		<br>
		총점: <%= sb.getTotal() %><br>
		평균: <%= sb.getAvg() %><br>
		학점: <%= sb.getGrade() %><br>
		<br><hr><br>
		이름: <jsp:getProperty property="name" name="sb"/><br>
		국어: <jsp:getProperty property="kor" name="sb"/><br>
		영어: <jsp:getProperty property="eng" name="sb"/><br>
		수학: <jsp:getProperty property="math" name="sb"/><br>
	</body>
</html>