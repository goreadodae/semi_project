package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.PageData;

/**
 * Servlet implementation class viewAllNoticeServlet
 */
@WebServlet(name = "NoticeList", urlPatterns = { "/noticeList" })
public class viewAllNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewAllNoticeServlet() {
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
				currentPage=1;
			}
			else
			{
				currentPage=Integer.parseInt(request.getParameter("currentPage"));
			}
			PageData pd = new NoticeService().noticeAll(currentPage);
			
			if(pd!=null)
			{
				RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/noticePage.jsp");
				request.setAttribute("pageData", pd);
				view.forward(request, response);
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
