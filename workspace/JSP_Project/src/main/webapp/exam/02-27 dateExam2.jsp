<%@page import="com.exam.DateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>dateExam2</title>
	</head>
	
	<%
	DateBean bean = new DateBean();
	%>
	
	<body>
		<%= bean.getToday() %>
	</body>
</html>