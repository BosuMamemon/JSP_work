<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreInput_jquery</title>
	</head>
	
	<body>
		<form action='02-28 scoreResult2.jsp' id="form">
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
				<button type="button" id="button">ㄱㄱ</button>
			</fieldset>
		</form>
	</body>
	
	<!-- 아래 j쿼리 스크립트 안에다가 자바스크립트를 쓰고 그래서는 안됨 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- 이렇게 내가쓸 자바스크립트는 태그를 새로 열어줘야함 -->
	<script>
//		J쿼리를 의미하는게 $ 기호임
//		클릭 이벤트때 걍 바로 익명함수 사용해버리는 방법 
		$("#button").click(
			function() {
				if($("#name").val() == "") {
					alert("이름을 입력하십시오.")
					return;
				}
				
				if($("#kor").val() == "") {
					alert("국어 점수를 입력하십시오.")
				} else if($("#kor").val() < 0) {
					alert("올바른 국어 점수를 입력하십시오.")
				} else if($("#kor").val() > 100) {
					alert("올바른 국어 점수를 입력하십시오.")
					return;
				}
				
				if($("#eng").val() == "") {
					alert("영어 점수를 입력하십시오.")
				} else if($("#eng").val() < 0) {
					alert("올바른 영어 점수를 입력하십시오.")
				} else if($("#eng").val() > 100) {
					alert("올바른 영어 점수를 입력하십시오.")
					return;
				}
				
				if($("#math").val() == "") {
					alert("수학 점수를 입력하십시오.")
				} else if($("#math").val() < 0) {
					alert("올바른 수학 점수를 입력하십시오.")
				} else if($("#math").val() > 100) {
					alert("올바른 수학 점수를 입력하십시오.")
					return;
				}
				
				$("#form").submit()
			}		
		)
//		만일 script태그를 id 등등 위에 작성해서 스크립트가 그걸 못알아먹는다?
//		그럼 위 코드를
//		$(document).ready() 안에다가 작성해야함
//		$(document).ready(
//			function() {
//				$("#button").click()...이런식으로
//			}
//		)
	</script>
</html>