package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String loginId = request.getParameter("loginId");
		String loginPwd = request.getParameter("loginPwd");
		String beforeURI = request.getParameter("beforeURI");
		
		boolean banCheck=false;
		
		ArrayList<String> banURI = new ArrayList<String>(); 
		banURI.add("http://localhost/views/memberPage/findPwdPage.jsp"); 
		banURI.add("http://localhost/views/memberPage/findIdPage.jsp"); 
		banURI.add("http://localhost/views/memberPage/membershipPage.jsp"); 
		
		Member m = new MemberService().login(loginId, loginPwd);
		
		if (m == null) {
			System.out.println("유저가 없습니다.");
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", m);
			
			 for(String bu : banURI){
				 if(!beforeURI.equals(bu)) {
					 banCheck=false;
				 }else {
					 banCheck=true;
					 break;
					}
		        }
			 if(banCheck==true) {
				 response.sendRedirect("/index.jsp");
			 }else {	
				 response.sendRedirect(beforeURI);
			 }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}