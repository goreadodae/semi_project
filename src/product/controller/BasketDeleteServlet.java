package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class BasketDeleteServlet
 */
@WebServlet(name = "BasketDelete", urlPatterns = { "/basketDelete" })
public class BasketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 한글이 있을 경우 인코딩
		request.setCharacterEncoding("utf-8");

		//2. 변수에서 값 꺼내서 저장
		int basket_no = Integer.parseInt(request.getParameter("basket_no"));

		//3. 비즈니스 로직 처리
		int result = new ProductService().deleteBasket(basket_no);
		
		if(result>0) {
			response.sendRedirect("/basketSelect");
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
