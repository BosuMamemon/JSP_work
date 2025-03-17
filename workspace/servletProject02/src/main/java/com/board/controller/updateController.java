package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;
import com.utils.JSFunction;

/**
 * Servlet implementation class updateController
 */
@WebServlet("/board/update.do")
public class updateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAOImpl();
		
		BoardDTO board = dao.findByNum(num);
		dao.close();
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardDTO board = new BoardDTO();
		BoardDAO dao = new BoardDAOImpl();
		
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setUserID(request.getParameter("userID"));
		board.setSubject(request.getParameter("subject"));
		board.setEmail(request.getParameter("email"));
		board.setContent(request.getParameter("content"));
		
		int uCount = dao.boardUpdate(board);
		
		if(uCount > 0) {
			JSFunction.alertLocation(response, "게시글을 수정했습니다.", "list.do");
		} else {
			JSFunction.alertBack(response, "수정 중 오류가 발생했습니다.");
		}
	}

}
