package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import qna.model.service.QnaService;

/**
 * Servlet implementation class QuestionUpdateServlet
 */
@WebServlet(name = "QuestionUpdate", urlPatterns = { "/questionUpdate" })
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int queNo = Integer.parseInt(request.getParameter("queNo"));
		String queTitle = request.getParameter("queTitle");
		String queContents = request.getParameter("contents");
		int buyingNo =(request.getParameter("inquiry")==null) ? 0: Integer.parseInt(request.getParameter("inquiryNo"));
		HttpSession session = request.getSession(false);
		int memberNo = ((Member)session.getAttribute("user")).getMemberNo();

		
		int result = new QnaService().updateQuestion(queNo,queTitle,buyingNo,memberNo,queContents);
		
		if(result>0)
		{
			response.sendRedirect("/questionList");
			
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
