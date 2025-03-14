<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/includes/header.jsp" %>
		
		<div class="container mt-5">
			<h2>Board List</h2>
			<div class="mt-5 mb-3">
				<button class="btn btn-secondary" id=btnWrite>글쓰기</button>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ barr }" var="board">
						<tr>
							<td>${ board.num }</td>
							<td>${ board.subject }</td>
							<td>${ board.userID }</td>
							<td>${ board.regdate }</td>
							<td>${ board.readCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
	</body>
	
	<script>
		$(function() {
			$("#btnWrite").click(function() {
				if(${empty sessionScope.sUser}) {
					alert("먼저 로그인해주십시오.");
					location.href = "/member/login.do";
					return;
				}
				location.href = "/board/write.do"
			})
		})
	</script>
</html>