package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Answer;

/**
 * Servlet implementation class AnswerServlet
 */
@WebServlet(name = "Answer", urlPatterns = { "/answer" })
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Answer ans = new Answer();
		ans.setAnsContents(request.getParameter("ansContents"));
		ans.setQueNo(Integer.parseInt(request.getParameter("queNo")));
		ans.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));

		int result = new AdminService().insertAnsInfo(ans);//답변시 답변테이블에 정보를 저장
		int comAns = new AdminService().completeAns(ans);//답변시 질문테이블에서 답변여부를 n->y로 변경
		if(result>0&&comAns>0)
		{
			
			
			response.sendRedirect("/qnaMgt");
		}
		else
		{
			
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
