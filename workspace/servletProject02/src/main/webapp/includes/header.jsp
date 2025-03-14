<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<title></title>
	</head>
	
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="/board/list.do">HOME</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/board/write.do">BOARD INSERT</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/board/list.do">BOARD LIST</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">PRODUCT</a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<c:if test="${ sessionScope.sUser.admin == 1 }">
						<span class="navbar-text">(${ sessionScope.sUser.name }) 관리자님, 반갑습니다.</span>
					</c:if>
					<c:if test="${ sessionScope.sUser.admin == 0 }">
						<span class="navbar-text">(${ sessionScope.sUser.name })님, 반갑습니다.</span>
					</c:if>
					<c:if test="${ not empty sessionScope.sUser }">
						<li class="nav-item">
							<a class="nav-link" href="/member/logout.do">로그아웃</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="">회원정보 변경</a>
						</li>
					</c:if>
					<c:if test="${ empty sessionScope.sUser }">
						<li class="nav-item">
							<a class="nav-link" href="/member/login.do">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/member/join.do">회원가입</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>