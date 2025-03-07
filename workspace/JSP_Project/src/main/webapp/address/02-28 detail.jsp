<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>detail</title>
	</head>
	
	<%
		AddressDAO dao = new AddressDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		Address addr = dao.detail(num);
	%>
	
	<body>
		<form action="02-28 updateProcess.jsp" method="post">
			<table border=1>
				<tr>
					<th>번호</th>
					<td><input type="text" name="num" value="<%= addr.getNum() %>" readonly="readonly" ></td>
					<!-- disabled는 ?뒤에 값을 아예 못넘겨줌... readonly여야 넘겨줄 수 있음 -->
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%= addr.getName() %>"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
						<input type="text" name="zipcode" value="<%= addr.getZipcode() %>" size=15 id="zipcode">
						<button type="button" onclick="zipfinder()">검색</button>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%= addr.getAddress() %>" size=40 id="address"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="<%= addr.getTel() %>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button>수정</button>
						<button type="reset">초기화</button>
						<button type="button" onclick="del()">삭제</button>
						<button type="button" onclick="location.href = '02-28 list.jsp'">전체 보기</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
	
	<script>
		function del() {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href = "02-28 deleteProcess.jsp?num=<%= num %>";
			}
		}
		
		function zipfinder() {
			window.open("03-06 zipCheck.jsp", "", "width=700 height=400")
		}
	</script>
</html>