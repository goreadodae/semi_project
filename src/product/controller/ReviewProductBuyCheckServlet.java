package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import product.model.service.ReviewService;
import product.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet(name = "ReviewProductBuyCheck", urlPatterns = { "/reviewProductBuyCheck" })
public class ReviewProductBuyCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewProductBuyCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax를 통해 리뷰 작성 및 수정을 할 때, 사용자가 상품을 구매한 이력이 있는지 확인!
		//인코딩
		request.setCharacterEncoding("utf-8");
		
	    //로그인 되어져 있는세션의 아이디 가져오기
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("user");

		if(m!=null)
		{	
			//변수에 값 저장
			String userId = ((Member)session.getAttribute("user")).getMemberId();//세션에서 아이디 가져오기
			int productNo = Integer.parseInt(request.getParameter("productNo"));//상품넘버

			ArrayList<Review> reviewBuyList = new ReviewService().reviewBuyCheckList(userId,productNo);
			
			if(reviewBuyList!=null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(reviewBuyList,response.getWriter());
			}else {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson("",response.getWriter());
			}
		}else {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson("",response.getWriter());
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
