package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/update.my")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = new BoardDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bdto = dao.selectData(num);
		
		request.setAttribute("board", bdto);
		request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		bdto.setNum(Integer.parseInt(request.getParameter("num")));
		bdto.setUserID(request.getParameter("userID"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setContent(request.getParameter("content"));
		
		dao.updateData(bdto);
		
		response.sendRedirect("list.my");
	}

}
