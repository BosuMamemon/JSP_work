<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ad" class="com.address.Address"></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>
    
<%
	AddressDAO dao = new AddressDAO();
	dao.insert(ad);
	response.sendRedirect("02-28 list.jsp"); // 객체로 응답을 받으면 리다이렉트를 보내준다는 메소드
%>