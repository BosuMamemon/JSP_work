<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
		
		<div class="container mt-5">
			<h2>BoardView</h2>
			<input type="hidden" name="bNum" id="bNum" value="${ board.num }">
			<table class="table table-hover">
				<tr>
					<th>글 번호</th>
					<td>${ board.num }</td>
					<th>조회수</th>
					<td>${ board.readCount }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ board.userID }</td>
					<th>작성일</th>
					<td>${ board.regdate }</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td colspan="3">${ board.subject }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">${ board.content }</td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary" onclick="location.href='update.my?num=${board.num}';">수정</button>
			<button type="button" class="btn btn-secondary" id="btnDelete">삭제</button>
		</div>
	</body>
	
	<script>
		$("#btnDelete").click(function() {
			if(confirm("정말 삭제할까요?")) {
				location.href = "delete.my?num=" + ${board.num};
			}
		})
	</script>
</html>