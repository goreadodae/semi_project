package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

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
		//구매한 상품 이미지
		String buyProductImage = request.getParameter("buyProductImage");
		



		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
