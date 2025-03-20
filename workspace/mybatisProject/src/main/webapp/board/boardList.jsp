<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/includes/header.jsp" %>
		
		<div class="container mt-5">
			<h2>Board List(${ count })</h2>
			<div class="mt-5 mb-3">
				<button class="btn btn-secondary" id="btnWrite">글쓰기</button>
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
					<c:forEach items="${ bList }" var="board" varStatus="st">
						<tr>
							<td>${ board.num }</td>
							<td><a href="view.my?num=${ board.num }">${ board.subject }</a></td>
							<td><b>${ board.userID }</b></td>
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
				location.href = "/mybatisProject/board/write.my"
			})
		})
	</script>
</html>