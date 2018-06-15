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
		
		int basket_quantity = Integer.parseInt(request.getParameter("basket_quantity"));
//		int member_no = Integer.parseInt(request.getParameter("member_no"));
		int member_no = 1;
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		
		int result = new ProductService().insertBasket(basket_quantity, member_no, product_no);
		if(result>0) {
			RequestDispatcher view = request.getRequestDispatcher("/productDetail");
			request.setAttribute("product_no", product_no);
			view.forward(request, response);
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
