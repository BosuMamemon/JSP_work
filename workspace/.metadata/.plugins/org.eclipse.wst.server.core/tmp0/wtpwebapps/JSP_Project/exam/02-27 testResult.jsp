<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>testResult</title>
	
	</head>
	
	<%
	// 스크립트 릿(여기에는 자바의 문법이 들어가면 됨)
	// 아래 문장을 쓰면 문자열을 utf-8로 인코딩함
	request.setCharacterEncoding("utf-8");
	
	// form에서 받아온 name을 받아오는 jsp의 객체의 메소드
	// = request.getParameter()
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	%>
	
	<body>
		<!-- out.print(파라미터 이름)을 하면 스크립트 릿에서 설정한 html에 불러올 수가 있음 -->
		이름: <% out.println(name); %><br>
		주소: <% out.println(address); %><br>
		<br>
		<!-- %= 파라미터 이름 = out.print()의 축약어임 -->
		이름 2트: <%= name %><br>
		주소 2트: <%= address %><br>
	</body>
</html>