package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class BasketInsertServlet
 */
@WebServlet(name = "BasketInsert", urlPatterns = { "/basketInsert" })
public class BasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int basketQuantity = Integer.parseInt(request.getParameter("basketQuantity"));
//		int member_no = Integer.parseInt(request.getParameter("member_no"));
		int memberNo = 1;
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		
		
		int result = new ProductService().insertBasket(basketQuantity, memberNo, productNo);
		if(result>0) {
			System.out.println("성공");
		}
		else {
			response.sendRedirect("/views/productPage/error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
