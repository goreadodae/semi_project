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
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2. 변수값 저장 (내용, 별점, 리뷰 번호, 아이디(닉네임))
		HttpSession session = request.getSession(false);
		//세션에 저장된 userid ->> 로그인 중인 사용자
		Member m = (Member)session.getAttribute("user");

		
		/*Review r = new Review();*/
		
		if(m!=null)
		{	
			
			
			String userId = ((Member)session.getAttribute("user")).getMemberId();
			int productNo = Integer.parseInt(request.getParameter("productNo"));//상품넘버

			System.out.println("  상품 번호  :  " +productNo + " 유저 아이디 : " + userId);
			
			ArrayList<Review> reviewBuyList = new ReviewService().reviewBuyCheckList(userId,productNo);
			//System.out.println(reviewBuyList);
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
