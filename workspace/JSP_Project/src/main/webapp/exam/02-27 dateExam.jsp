<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>dateExam</title>
	</head>
	
	<%
//	지금 시간 갖고 있는 객체 생성
	Calendar ca = Calendar.getInstance();
	
	String[] days = {"일", "월", "화", "수", "목", "금", "토"};
	
	%>
	
	<body>
		오늘은 
		<%= ca.get(Calendar.YEAR) %>년 
		<%= ca.get(Calendar.MONTH) + 1 %>월 
		<%= ca.get(Calendar.DATE) %>일 
		<%= days[ca.get(Calendar.DAY_OF_WEEK) - 1] %>요일
	</body>
</html>