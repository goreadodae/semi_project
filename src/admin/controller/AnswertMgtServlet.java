package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import qna.model.vo.Question;

/**
 * Servlet implementation class AnswertMgtServlet
 */
@WebServlet(name = "AnswertMgt", urlPatterns = { "/answertMgt" })
public class AnswertMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswertMgtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int  queNo = Integer.parseInt(request.getParameter("queNo"));
		
		Question qt = new AdminService().questionDetail(queNo);

		
		
		if(qt!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/adminPage/answerMgtPage.jsp");
			request.setAttribute("qt",qt);
			view.forward(request, response);
				
		}
		else {
			System.out.println("실수");
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
