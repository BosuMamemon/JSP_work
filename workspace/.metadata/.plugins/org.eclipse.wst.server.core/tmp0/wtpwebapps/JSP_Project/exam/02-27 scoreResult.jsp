<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>scoreResult</title>
	</head>
	
	<%
	
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor + eng + math;
	double avg = total / 3;
	
	// 학점 만들기
	String grade = "";
	
	switch((int)avg / 10) {
		case 10:
		case 9: grade = "A"; break;
		case 8: grade = "B"; break;
		case 7: grade = "C"; break;
		default: grade = "F";
	}
	
	%>
	
	<body>
		이름: <%= name %><br>
		국어: <%= kor %>점<br>
		영어: <%= eng %>점<br>
		수학: <%= math %>점<br>
		<br>
		총점: <%= total %>점<br>
		평균: <%= avg %>점<br>
		학점: <%= grade %>
	</body>
</html>