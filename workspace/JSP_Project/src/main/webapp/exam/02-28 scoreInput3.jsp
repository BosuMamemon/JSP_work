<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreInput3</title>
	</head>
	
	<body>
		<form action='02-28 scoreResult3.jsp'>
			<fieldset>
				<legend>점수 입력</legend>
				
				<label for='name'>이름: </label>
				<input type='text' id='name' name='name'>
				<br>
				<label for='kor'>국어: </label>
				<input type='number' id='kor' name='kor'>
				<br>
				<label for='eng'>영어: </label>
				<input type='number' id='eng' name='eng'>
				<br>				
				<label for='math'>수학: </label>
				<input type='number' id='math' name='math'>
				<br><br>
				<button>ㄱㄱ</button>
			</fieldset>
		</form>
	</body>
</html>