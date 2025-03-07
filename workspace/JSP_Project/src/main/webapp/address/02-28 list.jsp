<%@page import="java.util.ArrayList"%>
<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
	</head>
	
	<%
		AddressDAO dao = new AddressDAO();
		String field = "";
		String word = "";		
		if(request.getParameter("word")!=null) {
			field = request.getParameter("field");
			word = request.getParameter("word");
		}
		ArrayList<Address> aList = dao.list(field, word);
	%>
	
	<body>
		<table border=1 style="text-align:center;">
			<tr>
				<th colspan="3">
					ADDRESS LIST(
					<%= dao.getCount(field, word) %>
					)
				</th>
			</tr>
			<tr>
				<th>이름</th>
				<th>주소</th>
				<th>전화번호</th>
			</tr>
			<%
				for(Address ad: aList){
			%>
			<tr>
				<td><a href="02-28 detail.jsp?num=<%= ad.getNum() %>"><%= ad.getName() %></a></td>
				<td><%= ad.getAddress() %></td>
				<td><%= ad.getTel() %></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="3"><a href="02-28 insert.jsp" style="text-decoration:none; color:black; font-weight:bold;">추가하기</a></td>
			</tr>
		</table>
		<br>
		<form action="02-28 list.jsp">
			<select name="field">
				<option value="name">이름</option>
				<option value="address">주소</option>
			</select>
			<input type="text" name="word">
			<button type="submit">검색</button>
		</form>
	</body>
</html>