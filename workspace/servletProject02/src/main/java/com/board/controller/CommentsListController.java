package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.board.model.CommentsDAO;
import com.board.model.CommentsDAOImpl;
import com.board.model.CommentsDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class CommentsListController
 */
@WebServlet("/board/commentsList.do")
public class CommentsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		CommentsDAO dao = new CommentsDAOImpl();
		ArrayList<CommentsDTO> cList = dao.commentList(bNum);
		int count = dao.commentCount(bNum);
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<>();
		map.put("jArr", cList);
		map.put("count", count);
		String jsonStr = gson.toJson(map);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
