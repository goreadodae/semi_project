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

		//1. �븳湲��씠 �엳�쓣 寃쎌슦 �씤肄붾뵫
		request.setCharacterEncoding("utf-8");

		//2. 蹂��닔�뿉�꽌 媛� 爰쇰궡�꽌 ���옣
		int product_no = Integer.parseInt(request.getParameter("product_no"));

		//3. 鍮꾩쫰�땲�뒪 濡쒖쭅 泥섎━
		Product productInfo = new Product();
		productInfo = new ProductService().getProduct(product_no);
		
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
