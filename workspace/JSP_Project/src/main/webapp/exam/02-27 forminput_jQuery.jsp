<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>forminput_jQuery</title>
	</head>
	
	<body>
		<form action="02-27 formResult.jsp" id="form">
			<fieldset>
				<legend>기본 정보</legend>
				<label for="name">이름:	</label>
				<input type="text" name="name" id="name">
				<br>
				<label for="age">나이:	</label>
				<input type="number" name="age" id="age">
				<br>
				성별: 
				<label for="male">	남자</label>
				<input type="radio" name="gender" value="남자" class="gender" id="male" checked>
				<label for="female">여자</label>
				<input type="radio" name="gender" value="여자" class="gender" id="female">
				<br>
				관심분야:
				<label for="hb1">	운동</label>
				<input type="checkbox" name="hobby" value="운동" class="hobby" id="hb1">
				<label for="hb2">게임</label>
				<input type="checkbox" name="hobby" value="게임" class="hobby" id="hb2">
				<label for="hb3">등산</label>
				<input type="checkbox" name="hobby" value="등산" class="hobby" id="hb3">
				<label for="hb4">영화</label>
				<input type="checkbox" name="hobby" value="영화" class="hobby" id="hb4">
				<br>
				<label for="job">직업:	</label>
				<select name="job" id="job">
					<option value="없음">---</option>
					<option value="사무직">사무직</option>
					<option value="전문직">전문직</option>
					<option value="서비스직">서비스직</option>
					<option value="예체능">예체능</option>
					<option value="기타">기타</option>
				</select>
			</fieldset>
			<button type="button" id="button">전송</button>
		</form>
	</body>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	<script>
	$("#button").click(
		function(){
			if($("#name").val() == "") {
				alert("이름을 입력하세요.");
				return;
			}
			
			if($("#age").val() == "") {
				alert("나이를 입력하세요.");
				return;
			}
			
			if($("input:checkbox[name='hobby']:checked").length == 0) {
				alert("관심분야를 선택해주세요.");
				return;
			}
			
			$("#form").submit()
		}		
	)
	</script>
</html>