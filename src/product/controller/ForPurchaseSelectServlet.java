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
import product.model.vo.Basket;

/**
 * Servlet implementation class ForPurchaseSelectServlet
 */
@WebServlet(name = "ForPurchaseSelect", urlPatterns = { "/forPurchaseSelect" })
public class ForPurchaseSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForPurchaseSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//로그인 정보 임의로 1로 지정해놓음
		int member_no=1;
		
		ArrayList<Basket> basketList = new ArrayList<Basket>();
		basketList = new ProductService().getMyBasket(member_no);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/productPage/Purchase.jsp");
		request.setAttribute("basket", basketList);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
