<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../includes/header.jsp" %>
		<div class="container mt-5">
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
				url: "login.do",
				data: {"userID": $("#userID").val(), "password": $("#password").val()},
				success: function(resp) {
	                if(resp.trim()==0){
	                    alert("일반회원 로그인성공")
	                    location.href="/board/list.do";
	                } else if(resp.trim()==1) {
	                    alert("관리자 로그인성공")
	                    $(location).attr("href", "/board/list.do");
	                } else if(resp==-1) {
	                    alert("아이디가 존재하지 않습니다.")
	                } else if(resp==2) {
	                    alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인하세요.")
	                }
	            },
	            error: function(e) {
	                alert(e+":error")
	            }
			})
		})
	</script>
</html>