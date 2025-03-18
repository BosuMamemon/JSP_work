package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.board.model.CommentsDAO;
import com.board.model.CommentsDAOImpl;
import com.board.model.CommentsDTO;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class commentInsertController
 */
@WebServlet("/board/commentsInsert.do")
public class CommentsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String comment = request.getParameter("comment");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		HttpSession session = request.getSession();
		MemberDTO sUser = (MemberDTO)session.getAttribute("sUser");
		if(sUser==null) {
			out.println("login");
			return;
		}
		String userID = sUser.getUserID(); 
		
		CommentsDAO dao = new CommentsDAOImpl();
		CommentsDTO comments = new CommentsDTO(userID, comment, bNum);
		
		int count = dao.commentInsert(comments);
		out.print(count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
