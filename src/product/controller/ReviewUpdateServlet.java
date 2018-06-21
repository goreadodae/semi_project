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
		//파일 업로드를 구현하려면 몇가지 정보가 필요함
		// 1. 사용자 계정명 (업로드한 사람 정보가 있어야 함, session 객체에서 꺼냄)
		HttpSession session = request.getSession(false);
		//세션에 저장된 userid ->> 로그인 중인 사용자
		String userId = ((Member)session.getAttribute("user")).getMemberId();
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));//상품넘버
		/*String buyProductImage = request.getParameter("buyProductImage");//구매한 상품 이미지
*/		int rating = Integer.parseInt(request.getParameter("rating"));//상품 만족도
		String buyingAfterText = request.getParameter("buyingAfterText"); //상품 후기 textarea
		//String buyingAfterImage = request.getParameter("buyingAfterImage"); //상품 후기 이미지
		

		System.out.println("상품 번호 : " + productNo+"  별점  :  " +rating + "  후 기    :   " +buyingAfterText + " 유저 아이디 : " + userId);
		
		Review r = new Review();
		
		if(session.getAttribute("user") !=null)
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
			
		}else {
			response.sendRedirect("/views/productPage/reviewUpdateFail.html"); //로그인시 이용이 가능 or 실패 로 이동! 일단은 그 페이지로!
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
