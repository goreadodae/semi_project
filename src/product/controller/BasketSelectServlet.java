package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
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
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);	
		Member m = (Member)session.getAttribute("user");
		
		if(m==null) {	//로그인 안되있으면
			response.sendRedirect("/views/memberPage/loginPage.html");	//로그인하는 페이지로 이동
		}
		else {
			int memberNo=m.getMemberNo();
			
			ArrayList<Basket> basketList = new ArrayList<Basket>();
			basketList = new ProductService().getMyBasket(memberNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/productPage/Basket.jsp");
			request.setAttribute("basket", basketList);
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
