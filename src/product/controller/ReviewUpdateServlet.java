package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ReviewService;
import product.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet(name = "ReviewUpdate", urlPatterns = { "/reviewUpdate" })
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 계정명 (업로드한 사람 정보가 있어야 함, session 객체에서 꺼냄)
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("utf-8");
		
		Member m = (Member)session.getAttribute("user");
		String userId = ((Member)session.getAttribute("user")).getMemberId();//로그인 되어져 있는세션의 아이디 가져오기
		int productNo = Integer.parseInt(request.getParameter("productNo"));//상품넘버
		int rating = Integer.parseInt(request.getParameter("rating"));//상품 만족도
		String buyingAfterText = request.getParameter("buyingAfterText"); //상품 후기 textarea

		Review r = new Review();
		
		if(m!=null)
		{	
			r.setReviewContents(buyingAfterText);
			r.setReviewSatisfied(rating);
			r.setProductNo(productNo);
			r.setMemberId(userId);
			
			int result = new ReviewService().updateReview(r);
			if(result>0)
			{
				response.sendRedirect("/productDetail?productNo="+productNo);
			}else {
				
			}
			
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
