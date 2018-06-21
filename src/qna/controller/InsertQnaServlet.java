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
 * Servlet implementation class InsertQnaServlet
 */
@WebServlet(name = "InsertQna", urlPatterns = { "/insertQna" })
public class InsertQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		String queTitle = request.getParameter("qnaTitle");
		int buyingNo = (request.getParameter("inquiry") == null) ? 0: Integer.parseInt(request.getParameter("inquiryNo"));
		 String queContents  = request.getParameter("contents");
		 HttpSession session = request.getSession(false);
		 int memberNo = ((Member)session.getAttribute("user")).getMemberNo();
		 
		int result = new QnaService().insertQuestion(queTitle,queContents,memberNo,buyingNo);
		 
		 if(result>0)
		 {
			 response.sendRedirect("/questionList");
		 }
		 else {
			 System.out.println("실패");
			 
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
