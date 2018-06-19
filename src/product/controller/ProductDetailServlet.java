package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet(name = "ProductDetail", urlPatterns = { "/productDetail" })
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int productNo = Integer.parseInt(request.getParameter("productNo"));

		Product productInfo = new Product();
		productInfo = new ProductService().getProduct(productNo);
		
		if(productInfo!=null) {
			RequestDispatcher view = request.getRequestDispatcher("/views/productPage/ProductDetail.jsp");
			request.setAttribute("productInfo", productInfo);
			view.forward(request, response);
		}
		else {
			response.sendRedirect("/views/productPage/ProductMain.jsp");
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
