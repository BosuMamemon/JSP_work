package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.model.BoardDAO;
import com.board.model.BoardDAOImpl;
import com.board.model.BoardDTO;
import com.comm.PageUtil;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/board/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = new BoardDAOImpl();
		
//		검색 관련
		String searchField = (request.getParameter("searchField") == null ? "" : request.getParameter("searchField"));
		String searchWord = (request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord"));
		Map<String, Object> map = new HashMap<>();
		
		if(searchWord != "") {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
//		검색 포함 게시글 갯수
		int count = dao.selectCount(map);
		
//		페이징 관련
		String pageNum = (request.getParameter("pageNum") == null ? "1" : request.getParameter("pageNum"));
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int rowNo = count - (pageSize * (currentPage - 1));
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<BoardDTO> bList =  dao.selectListPage(map);
		
//		총 페이지 수
		int totalPage = count / pageSize + (count%pageSize==0?0:1);
		int blockPage = 3;
		int startPage = ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		PageUtil page = new PageUtil(totalPage, blockPage, startPage, endPage, currentPage, searchField, searchWord);
		
		dao.close();
		
		request.setAttribute("barr", bList);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("rowNo", rowNo);
		
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
