<%@page import="com.address.AddressDAO"%>
<%@page import="com.address.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	Address address = new Address();
	
	address.setName(request.getParameter("name"));
	address.setName(request.getParameter("zipcode"));
	address.setName(request.getParameter("address"));
	address.setName(request.getParameter("tel"));
	
	AddressDAO jdao = new AddressDAO();
	jdao.insert(address);
	response.sendRedirect("03-06 list.jsp");
	
%>