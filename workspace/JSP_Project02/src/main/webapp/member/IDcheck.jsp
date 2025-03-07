<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<!-- member.js -->
		<script src="/JSP_Project02/js/member.js"></script>
		<title>IDCheck</title>
	</head>
	
	<body>
		<h2>아이디 중복확인</h2>
		아이디
		<input type="text" name="userID" id="userID"/>
		<button type="button" id="btnUse">중복확인</button>
	</body>
</html>