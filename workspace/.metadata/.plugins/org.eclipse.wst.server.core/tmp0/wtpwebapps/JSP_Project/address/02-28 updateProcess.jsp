<%@page import="com.address.AddressDAO"%>
<%@page import="com.address.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("utf-8");
	Address addr = new Address(
				Integer.parseInt(request.getParameter("num")),
				request.getParameter("name"),
				request.getParameter("zipcode"),
				request.getParameter("address"),
				request.getParameter("tel")
			);
	AddressDAO dao = new AddressDAO();
	
	dao.update(addr);
	
	response.sendRedirect("02-28 list.jsp");
%>