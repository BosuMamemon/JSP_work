<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String userID = request.getParameter("userID");
	String password = request.getParameter("password");
	
	MemberDAO dao = MemberDAOImpl.getInstance();
	int flag = dao.loginCheck(userID, password);
	
	if(flag==1) {
		session.setAttribute("sUserID", userID);
	}
	
	out.println(flag);
%>