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

import member.model.service.MemberService;
import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Basket;

/**
 * Servlet implementation class BuyDirectServlet
 */
@WebServlet(name = "BuyDirect", urlPatterns = { "/buyDirect" })
public class BuyDirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyDirectServlet() {
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
		
		
		if(m==null) {//로그인 안되있으면
			response.sendRedirect("/views/memberPage/loginPage.html");	//로그인하는 페이지로 이동
		}
		else {	//로그인 되있으면 바로구매 페이지로 이동
			int memberNo = m.getMemberNo();
			Member member = new MemberService().selectOneMember(memberNo);	//로그인한 계정 정보 가져오기
			System.out.println("member-name" + member.getMemberName());
			
			int basketQuantity = Integer.parseInt(request.getParameter("basketQuantity"));//수량
			int productNo = Integer.parseInt(request.getParameter("productNo"));//상품번호
			new ProductService().insertBasket(basketQuantity, memberNo, productNo);	//주문할 상품 일단 장바구니에 넣어둠
			
			//그 상품 arraylist로 정보 가져오기 (제일 마지막에 담긴 장바구니 정보)
			ArrayList<Basket> basketList = new ArrayList<Basket>();
			basketList = new ProductService().getLastBasket(memberNo);
			
			//구매 페이지로 이동
			RequestDispatcher view = request.getRequestDispatcher("/views/productPage/Purchase.jsp");
			request.setAttribute("basket", basketList);	//구매할 상품 정보
			request.setAttribute("member", member);		//로그인한 계정의 정보	
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
