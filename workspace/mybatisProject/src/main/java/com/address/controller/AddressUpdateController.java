package com.address.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.address.model.AddressDAO;
import com.address.model.AddressDTO;

/**
 * Servlet implementation class AddressUpdateController
 */
@WebServlet("/address/update.my")
public class AddressUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		AddressDTO adto = new AddressDTO(
					Integer.parseInt(request.getParameter("num")),
					request.getParameter("name"),
					request.getParameter("zipcode"),
					request.getParameter("addr"),
					request.getParameter("tel")
				);
		AddressDAO dao = new AddressDAO();
		dao.update(adto);
		
		response.sendRedirect("list.my");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
