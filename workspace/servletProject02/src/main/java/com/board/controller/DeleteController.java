package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;
import com.utils.JSFunction;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = new BoardDAOImpl();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int dCount = dao.boardDelete(num);
		dao.close();
		
		System.out.println("board 테이블에서 " + dCount + "개의 행을 삭제했습니다.");
		
//		자바 스크립트 코드 추가 방식
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		if(dCount > 0) {
//			String str = "<script>";
//			str += "alert('게시글이 삭제되었습니다.');";
//			str += "location.href = 'list.do';";
//			str += "</script>";
//			
//			out.println(str);
//		} else {
//			String str = "<script>";
//			str += "alert('삭제 중 오류가 발생했습니다.');";
//			str += "location.href = 'list.do';";
//			str += "</script>";
//			
//			out.println(str);
//		}
		
		if(dCount > 0) {
			JSFunction.alertLocation(response, "게시글이 삭제되었습니다.", "/board/list.do");
		} else {
			JSFunction.alertBack(response, "삭제 중 오류가 발생했습니다.");			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
