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
			<c:if test="${ (sessionScope.sUser.userID == board.userID) || (sessionScope.sUser.admin == 1) }">
				<button type="button" class="btn btn-primary" onclick="location.href='update.do?num=${board.num}';">수정</button>
				<button type="button" class="btn btn-secondary" id="btnDelete">삭제</button>
			</c:if>
		</div>
		<br>
		<div class="container mt-3">
			<div class="mt-3"><strong>Comments(<span id="cntSpan"></span>)</strong></div>
			<div id="result"></div>
			<textarea class="form-control" id="comment" name="comment" placeholder="Comment goes here."></textarea>
			<button class="btn btn-success btn-sm" id="btnComment">댓글 작성</button>
		</div>
	</body>
	
	<script>
		let init = function() {
			$.getJSON(
					"commentsList.do",
					{"bNum": $("#bNum").val()},
					function(resp) {
						let str = "<table class='table table-hover'>";
						$.each(resp.jArr, function(key, val) {
							str += "<tr>";
								str += "<td><b>" + val.userID + "</b></td>";
								str += "<td>" + val.comment + "</td>";
								str += "<td>" + val.regdate + "</td>";
							str += "</tr>";
						})
						str += "</table>";
						
						$("#cntSpan").html(resp.count);
						$("#result").html(str);
					}
				);
		}
		
		init();
	
		$("#btnDelete").click(function() {
			if(confirm("정말 삭제할까요?")) {
				location.href = "delete.do?num=" + ${board.num};
			}
		})
		
		$("#btnComment").click(function() {
			if($("#comment").val()=="") {
				alert("메시지를 입력하세요.");
				$("#comment").focus();
				return false;
			}
			
			$.ajax({
				type: "post",
				url: "commentsInsert.do",
				data: {
					"comment": $("#comment").val(),
					"bNum": $("#bNum").val()
				}
			})
			.done(function(resp) {
				if(resp.trim()=="login") {
					alert("먼저 로그인해주십시오.");
					location.href = "/member/login.do";
				} else {
					alert(resp + "개의 댓글이 등록되었습니다.");
					$("#comment").val("");
					init();
				}
			})
			.fail(function(e) {
				alert("error: " + e);
			})
		})
	
	</script>
</html>