<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 부트스트랩 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<!-- member.js -->
		<script src="../js/member.js"></script>
		<title>member</title>
	</head>
	
	<body>
		<div class="container mt-3">
			<form action="memberJoinProcess.jsp" method="post" id="form">
				<h3>회원가입</h3>
				<div class="mb-3 mt-3">
					<label for="name">Name: </label>
					<input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="userID">UserID: </label>
						<input type="text" class="form-control" id="userID" name="userID" placeholder="Enter UserID" readonly>
					</div>
					<div class="col mt-4 align-self-end">
						<button type="button" class="btn btn-secondary" id="btnIDcheck">중복확인</button>
					</div>
				</div>
				<div class="mb-3">
					<label for="password">Password: </label><br>
					<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
				</div>
				<div class="mb-3">
					<label for="password_chk">Password_Check: </label>
					<input type="password" class="form-control" id="password_chk" name="password_chk" placeholder="Enter Password_Check">
				</div>
				<div class="mb-3">
					<label for="email">Email: </label>
					<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email">
				</div>
				<div class="mb-3">
					<label for="tel">Phone: </label>
					<input type="tel" class="form-control" id="tel" name="tel" placeholder="Enter Phone">
				</div>
				<div class="form-check-inline">
					<input type="radio" class="form-check-input" id="radio1" name="admin" value=0 checked>
					<label class="form-check-label" for="radio1">일반회원</label>
				</div>
				<div class="form-check-inline">
					<input type="radio" class="form-check-input" id="radio2" name="admin" value=1>
					<label class="form-check-label" for="radio2">관리자</label>
				</div>
				<div class="mt-3">
					<button type="submit" class="btn btn-primary">Submit</button>				
				</div>
			</form>
		</div>
	</body>
</html>