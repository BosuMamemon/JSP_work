package com.utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;

public class JSFunction {

	public static void alertLocation(HttpServletResponse response, String msg, String url) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String script = "<script>"
					+ "alert('" + msg + "');"
					+ "location.href = '" + url + "';"
					+ "</script>";
			
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void alertBack(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String script = "<script>"
					+ "alert('" + msg + "');"
					+ "history.back();"
					+ "</script>";
			
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
