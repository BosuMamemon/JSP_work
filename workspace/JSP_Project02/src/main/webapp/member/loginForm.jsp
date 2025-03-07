<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<title>loginForm</title>
	</head>
	
	<body>
		<div class="container mt-3">
			<h2>로그인</h2>
			<div class="mb-3">
				<label for="userID">ID: </label><br>
				<input type="text" class="form-control" id="userID" name="userID" placeholder="ID를 입력하세요.">
			</div>
			<div class="mb-3">
				<label for="password">Password: </label><br>
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요.">
			</div>
			<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
			<button type="button" class="btn btn-secondary" onclick="window.open('memberJoin.jsp')">회원가입</button>
		</div>
	</body>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		$("#btnLogin").click(function() {
			if($("#userID").val()=="") {
				alert("아이디를 입력하세요.");
				$("#userID").focus();
				return;
			}
			
			if($("#password").val()=="") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			
			$.ajax({
				type: "post",
				url: "loginProcess.jsp",
				data: {"userID": $("#userID").val(), "password": $("#password").val()},
				success: function(res) {
					if(res==1) {
						alert("로그인 성공");
						$(location).attr("href", "memberList.jsp");
					} else if(res==-1) {
						alert("아이디를 잘못 입력하셨습니다.");
					} else if(res==2) {
						alert("비밀번호를 잘못 입력하셨습니다.");
					}
				},
				error: function(e) {
					alert(e+"error");
				}
			})
		})
	</script>
</html>