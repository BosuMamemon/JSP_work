<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreInput_Javascript</title>
	</head>
	
	<body>
		<form action='scoreResult.jsp' id="form" onsubmit="return check()">
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
				<!-- <input type='button' value="ㄱㄱ" onclick="check()"> 이렇게도 되고 -->
				<button type="submit">ㄱㄱ</button>
			</fieldset>
		</form>
	</body>
	
	<script>
//		아래 같은 케이스도 있고
//		function check() {
//			if(document.form.name.value == "") {	// 여기서 폼에 name을 붙여줘야 함
//				alert("이름을 입력하세요.")
//			}
//		}

//		이런 케이스도 사용 가능
		function check() {
			if(document.getElementById("name").value == "") {
				alert("이름을 입력하세요.");
				return false;
			}
			if(document.getElementById("kor").value == "") {
				alert("국어 점수를 입력하세요.");
			} else if(document.getElementById("kor").value < 0) {
				alert("정확한 국어 점수를 입력하세요.");
			} else if(document.getElementById("kor").value > 100) {
				alert("정확한 국어 점수를 입력하세요.");
				return false;
			}
			if(document.getElementById("eng").value == "") {
				alert("영어 점수를 입력하세요.");
			} else if(document.querySelector("#eng").value < 0 ) {
				alert("정확한 영어 점수를 입력하세요.");
			} else if(document.querySelector("#eng").value > 100) {
				alert("정확한 영어 점수를 입력하세요.");
				return false;
			}
			if(document.getElementById("math").value == "") {
				alert("수학 점수를 입력하세요.");
			} else if(document.querySelector("#math").value < 0) {
				alert("정확한 수학 점수를 입력하세요.")
			} else if(document.querySelector("#math").value > 100) {
				alert("정확한 수학 점수를 입력하세요.")
				return false;
			}
			
//			document.getElementById("form").submit(); 이건 버튼에다가 onclick이벤트를 넣었을 때
			return true;
		}
	</script>
</html>