<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();	// 모든 세션을 다 지움
	// session.removeAttribute();	// 이건 세션의 지우고싶은 attribute만 지우는 메소드
	response.sendRedirect("loginForm.jsp");
%>