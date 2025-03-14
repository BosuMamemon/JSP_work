package com.member.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.member.model.MemberDAO;
import com.member.model.MemberDAOImpl;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class MemberJoinController
 */
@WebServlet("/member/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher rd = request.getRequestDispatcher("memberJoin.jsp");
//		rd.forward(request, response);
		request.getRequestDispatcher("memberJoin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDTO member = new MemberDTO();
		member.setAdmin(Integer.parseInt(request.getParameter("admin")));
		member.setEmail(request.getParameter("email"));
		member.setName(request.getParameter("name"));
		member.setPassword(request.getParameter("password"));
		member.setTel(request.getParameter("tel"));
		member.setUserID(request.getParameter("userID"));
		
		MemberDAO dao = new MemberDAOImpl();
		dao.memberJoin(member);
		
		response.sendRedirect("loginForm.jsp");
		
	}

}
