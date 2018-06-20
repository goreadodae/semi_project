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
import product.model.vo.Product;

/**
 * Servlet implementation class BasketSelectServlet
 */
@WebServlet(name = "BasketSelect", urlPatterns = { "/basketSelect" })
public class BasketSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//로그인 정보 임의로 1로 지정해놓음
		int memberNo=1;
		
		ArrayList<Basket> basketList = new ArrayList<Basket>();
		basketList = new ProductService().getMyBasket(memberNo);
		System.out.println("실행////");
		
		for(int i=0; i<basketList.size(); i++) {
			System.out.println("이름" + basketList.get(i).getProductName());
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/productPage/Basket.jsp");
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
