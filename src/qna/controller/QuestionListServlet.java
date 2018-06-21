package qna.controller;

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
import qna.model.service.QnaService;
import qna.model.vo.Question;

/**
 * Servlet implementation class QuetionListServlet
 */
@WebServlet(name = "QuestionList", urlPatterns = { "/questionList" })
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		int memberNo=0;
		Member m = (Member)(session.getAttribute("user"));
	
		if(m!=null)
		{
			
			memberNo = m.getMemberNo();
			ArrayList<Question> qList = new QnaService().questionList(memberNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/oneToOneQNAPage.jsp");
			request.setAttribute("qList", qList);		
			view.forward(request, response);
		}
		else
		{
			response.sendRedirect("/views/customerCenterPage/oneToOneQNAPage.jsp");
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
