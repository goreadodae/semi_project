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
import product.model.vo.Buying;
import product.model.vo.Ordercall;

/**
 * Servlet implementation class BuyingSelectAllServlet
 */
@WebServlet(name = "BuyingSelectAll", urlPatterns = { "/buyingSelectAll" })
public class BuyingSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyingSelectAllServlet() {
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
			response.sendRedirect("/views/memberPage/loginPage.jsp");	//로그인하는 페이지로 이동
		}
		else {			//로그인 되있으면
			int memberNo = m.getMemberNo();
			
			//user가 구매한 전체 상품 리스트 DB에서 받아옴
			ArrayList<Buying> buyingList = new ProductService().selectBuyingAll(memberNo);
			//user의 구매내역 가져오기
			ArrayList<Ordercall> orderList = new ProductService().selectOrdercallAll(memberNo);
			
			//전체 구매내역 페이지로 이동
			RequestDispatcher view = request.getRequestDispatcher("/views/productPage/BuyingListAll.jsp");
			request.setAttribute("buying", buyingList);
			request.setAttribute("order", orderList);
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
