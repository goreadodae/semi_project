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

/**
 * Servlet implementation class BuyingSelectRecentServlet
 */
@WebServlet(name = "BuyingSelectRecent", urlPatterns = { "/buyingSelectRecent" })
public class BuyingSelectRecentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyingSelectRecentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//방금 구매한 상품들의 갯수
		int rowCount = Integer.parseInt(request.getParameter("rowCount"));
		///로그인 정보
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//방금 구매한 상품 리스트 DB에서 받아옴
		ArrayList<Buying> buyingList = new ProductService().selectBuyingRecent(memberNo, rowCount);
		
		//구매내역 페이지로 이동
		RequestDispatcher view = request.getRequestDispatcher("/views/productPage/BuyingListRecent.jsp");
		request.setAttribute("buying", buyingList);
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
