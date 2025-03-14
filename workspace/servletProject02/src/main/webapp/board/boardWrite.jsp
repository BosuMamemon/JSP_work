<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp" %>
		<div class="container mt-5">
			<form action="write.do" method="post" id="form" name="form" onsubmit="return validateForm(this)">
				<h3>Board Write</h3>

				<div class="row mb-3">
					<div class="col">
						<label for="userID">UserID: </label>
						<input type="text" class="form-control" id="userID" name="userID" placeholder="Enter UserID" value="${ sessionScope.sUser.userID }" readonly>
					</div>
				</div>
				<div class="mb-3">
					<label for="subject">Subject: </label><br>
					<input type="text" class="form-control" id="subject" name="subject" placeholder="Enter Subject">
				</div>
				<div class="mb-3">
					<label for="email">Email: </label>
					<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" value="${ sessionScope.sUser.email }" readonly>
				</div>
				<div class="mb-3">
					<label for="content">Content:</label>
					<textarea class="form-control" id="content" name="content" placeholder="Content goes here." rows=5></textarea>
				</div>
				<div class="mt-3">
					<button type="submit" class="btn btn-primary" id="btnSend">글쓰기</button>				
				</div>
			</form>
		</div>
	</body>
	
	<script>
		function validateForm(form) {
			if(form.subject.value=="") {
				alert("제목을 입력하세요.");
				form.subject.focus();
				return;
			}
			
			if(form.content.value=="") {
				alert("내용을 입력하세요.");
				form.content.focus();
				return;
			}
		}
	</script>
</html>