<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.address.ZipCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	request.setCharacterEncoding("utf-8");
 
 	String input = request.getParameter("input");
 	AddressDAO jdao = new AddressDAO();
 	ArrayList<ZipCode> zarr = jdao.zipCodeRead(input);
 	
 	// zarr(자바의 자료형) -> json 형태로 파싱
 	JSONArray jsonArr = new JSONArray();
 	for(ZipCode zc : zarr) {
 		JSONObject jobj = new JSONObject();
 		jobj.put("zipcode", zc.getZipcode());
 		jobj.put("sido", zc.getSido());
 		jobj.put("gugun", zc.getGugun());
 		jobj.put("dong", zc.getDong());
 		jobj.put("bunji", zc.getBunji());
 		jsonArr.add(jobj);
 	}
 	out.println(jsonArr.toString());
 %>