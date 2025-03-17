<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/includes/header.jsp" %>
		
		<div class="container mt-5">
			<h2>Board List(${ count })</h2>
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
							<td><a href="view.do?num=${ board.num }">${ board.subject }</a></td>
							<td>${ board.userID }</td>
							<td>${ board.regdate }</td>
							<td>${ board.readCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex justify-content-between mt-3">
				<ul class="pagination">
					<c:if test="${ page.startPage > page.blockPage }">
						<li class="page-item"><a class="page-link" href="list.do?pageNum=${ page.startPage - page.blockPage }">Previous</a></li>
					</c:if>
					<c:forEach begin="${ page.startPage }" end="${ page.endPage }" var="i">
						<c:if test="${ page.currentPage != i }">
							<li class="page-item"><a class="page-link" href="list.do?pageNum=${ i }">${ i }</a></li>
						</c:if>
						<c:if test="${ page.currentPage == i }">
							<li class="page-item active"><a class="page-link" href="#">${ i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${ page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="list.do?pageNum=${ page.endPage+1 }">Next</a></li>
					</c:if>
				</ul>			
				<form action="" class="d-inline-flex">
					<select class="form-select" id="searchField">
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" class="form-control" id="searchWord" name="searchWord">
					<button type="submit" class="btn btn-success btn-sm">검색</button>
				</form>
			</div>
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