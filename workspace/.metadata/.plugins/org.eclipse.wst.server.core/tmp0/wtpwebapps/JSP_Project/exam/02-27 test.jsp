<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test</title>
	</head>
	
	<body>
		<h3>테스트: 서버</h3>
		<form action="testResult.jsp" method="get">
			<fieldset>
				<legend>바보바보</legend>
				<label for="name">이름: </label> 
				<input id="name" name="name" type="text"><br>
				<label for="address">주소: </label>
				<input id="address" name="address" type="text"><br>
				<button type="submit">전송</button>			
			</fieldset>
		</form>
	</body>
</html>