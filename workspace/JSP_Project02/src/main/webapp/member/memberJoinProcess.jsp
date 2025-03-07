<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="com.member.dto.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	MemberDAO dao = MemberDAOImpl.getInstance();
	// DAO의 메소드를 static 멤버로 만들면 객체 하나 만들고 다른 로직에서 계속 돌려쓸 수 있음 ㄷㄷ
	// static 방식으로 안하면 DAO 객체를 그때그때 새로 만들어줘야 함
	dao.memberInsert(member);
	response.sendRedirect("loginForm.jsp");
%>