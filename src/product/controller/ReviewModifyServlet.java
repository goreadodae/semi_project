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
@WebServlet(name = "ReviewModify", urlPatterns = { "/reviewModify" })
public class ReviewModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewModifyServlet() {
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
		String userId = ((Member)session.getAttribute("user")).getMemberId();
		System.out.println(userId);
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));//리뷰넘버
		int productNo = Integer.parseInt(request.getParameter("productNo"));//상품넘버

		System.out.println("리뷰 번호 : " + reviewNo+"  상품 번호  :  " +productNo + " 유저 아이디 : " + userId);
		
		Review r = new Review();
		
		if(m!=null)
		{	
			
			int result = new ReviewService().modifyReview(r);
			if(result>0)
			{
				response.sendRedirect("/productDetail?productNo="+productNo);
			}else {
				
			}
			
		}else {
			response.sendRedirect("/views/memberPage/loginPage.html");	//로그인하는 페이지로 이동
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
