<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	AddressDAO jdao = new AddressDAO();
	ArrayList<Address> sArr = jdao.list(field, word);
	int count = jdao.getCount(field, word);
	
	// gson.jar 파일을 이용~~~~
	Gson gson = new Gson();
	Map<String, Object> hm = new HashMap<>();
	hm.put("jArr", sArr);
	hm.put("jCount", count);
	String jsonStr = gson.toJson(hm);	// 딸깍 한번에 객체를 그냥 JSON으로 변형(키와 밸류만 있으면 맵이든 딕셔너리든 안 가리고 다 먹음)
	
	out.println(jsonStr);
%>