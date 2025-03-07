<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userID");
	MemberDAO dao = MemberDAOImpl.getInstance();
	String flag = dao.idCheck(userID);
	
	out.println(flag);
%>