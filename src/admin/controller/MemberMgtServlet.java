package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.MemberService;
import admin.model.vo.Member;
import admin.model.vo.MemberPageData;

/**
 * Servlet implementation class MemberMgtServlet
 */
@WebServlet(name = "MemberMgt", urlPatterns = { "/memberMgt" })
public class MemberMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMgtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int currentPage;
		if(request.getParameter("currentPage")==null)
		{
			currentPage =1;
		}
		else
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		MemberPageData mpd =new MemberService().viewAllMember(currentPage);
		
	
		
	
			request.setAttribute("mpd",mpd);
			RequestDispatcher view = request.getRequestDispatcher("/views/adminPage/memberMgt.jsp");
			view.forward(request, response);
			
	
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
