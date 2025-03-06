<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert</title>
	</head>
	
	<body>
		<form action="03-06 insertProcess.jsp" id="form" method="post">
			<table border=1>
				<tr>
					<th colspan="2">주소록 등록하기</th>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="zipcode" id="zipcode" size=5 readonly="readonly">
						<button type="button" id="zipcodeButton" onclick="zipfinder()">검색</button>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address" size=50 readonly="readonly"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="tel" id="tel"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="submitButton">등록</button>
						<button type="reset" id="resetButton">취소</button>
					</td>
				</tr>
			</table>
			<br><hr><br>
			<div>
				<a href="02-28 list.jsp">전체보기</a>
			</div>
		</form>
	</body>
	
	<script>
		function zipfinder() {
			window.open("03-06 zipCheck.jsp", "", "width=700 height=400")
		}
	</script>
</html>