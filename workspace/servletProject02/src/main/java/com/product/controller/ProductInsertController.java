package com.product.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.fileUpload.FileUtil;
import com.product.model.ProductDAO;
import com.product.model.ProductDTO;

/**
 * Servlet implementation class ProductInsertController
 * 파일 업로드
 * 톰캣 버전 9: cos.jar / commons-fileupload, commons-io.jar 같은 라이브러리 사용가능
 * 톰캣 버전 10: Part라는 클래스로 처리해야 함
 */
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
	)
@WebServlet("/product/productInsert.do")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
//		파일 업로드 경로 확인
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
//		파일 업로드
		String originalFileName = "";
		try {
			originalFileName = FileUtil.uploadFile(request, saveDirectory);			
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		ProductDTO product = new ProductDTO();
		
//		원본 파일명 및 저장된 파일 이름 설정
		if(originalFileName!="") {
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			product.setOfile(originalFileName);
			product.setSfile(savedFileName);
		}
		product.setDescription(request.getParameter("description"));
		product.setName(request.getParameter("name"));
		product.setUnitPrice(Integer.parseInt(request.getParameter("unitPrice")));
		
		ProductDAO dao = new ProductDAO(); 
		dao.productInsert(product);
		dao.close();
		
		response.sendRedirect("productList.do");
	}

}
