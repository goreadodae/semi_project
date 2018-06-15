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
 * Servlet implementation class BasketUpdateServlet
 */
@WebServlet(name = "BasketUpdate", urlPatterns = { "/basketUpdate" })
public class BasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int basket_quantity = Integer.parseInt(request.getParameter("basket_quantity"));
		int basket_no = Integer.parseInt(request.getParameter("basket_no"));
		
		if(basket_quantity>=1) {
			int result = new ProductService().updateBasket(basket_quantity,basket_no);
			if(result>0) {
				int member_no=1;	//로그인 정보 일단 1로 지정해놓음
				RequestDispatcher view = request.getRequestDispatcher("/basketSelect");
				request.setAttribute("member_no", member_no);
				view.forward(request, response);
			}
			else {
				System.out.println("뭐가 문제징?");
				response.sendRedirect("/views/productPage/error.jsp");
			}
		}else {
			int member_no=1;	//로그인 정보 일단 1로 지정해놓음
			RequestDispatcher view = request.getRequestDispatcher("/basketSelect");
			request.setAttribute("member_no", member_no);
			view.forward(request, response);
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
