<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>formResult</title>
	</head>
	
	<%
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String[] hobbys = request.getParameterValues("hobby");
	String hobby = "";
	if(hobbys != null) {
		for(int i = 0; i < hobbys.length; i++) {
			hobby += hobbys[i] + " ";
		}		
	} else {
		hobby = "없음";
	}
	String job = request.getParameter("job");
	
	%>
	
	<body>
		이름: <%= name %><br>
		나이: <%= age %><br>
		성별: <%= gender %><br>
		관심분야: <%= hobby %><br>
		직업: <%= job %><br>
	</body>
</html>