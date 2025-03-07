<%@page import="com.member.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<title>memberList</title>
	</head>
	
	<%
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAOImpl.getInstance();
		
		ArrayList<Member> mArr = dao.memberList();
		
		String sUserID = (String)session.getAttribute("sUserID");
	%>
	
	<body>
		<div class="container mt-5">
			<h2><b>회원 리스트</b></h2>
			<br>
			<div align="right">
				<%= sUserID %>님 반갑습니다. / <a href="logout.jsp">로그아웃</a>
			</div>
			<br>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>구분</th>
						<th>삭제</th>
						
					</tr>
				</thead>
				<tbody>
					<% for(Member m : mArr) {
							String mode = m.getAdmin()==0?"일반회원":"관리자";
						%><tr>
							<td><%= m.getName() %></td>
							<td><%= m.getUserID() %></td>
							<td><%= m.getTel() %></td>
							<td><%= m.getEmail() %></td>
							<td><%= mode %></td>
							<td>idk</td>
						</tr><%
						}
					%>
					
				</tbody>
			</table>
			<br>
			<div align="left">
				<button type="button" class="btn btn-primary" onclick="window.open('memberJoin.jsp')">회원 추가</button>
				<button type="button" class="btn btn-secondary" onclick="">회원 삭제</button>
			</div>
		</div>
	</body>
</html>