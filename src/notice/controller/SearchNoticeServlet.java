package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.PageData;

/**
 * Servlet implementation class SearchNoticeServlet
 */
@WebServlet(name = "SearchNotice", urlPatterns = { "/searchNotice" })
public class SearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String searchByName  = request.getParameter("searchByName")==null?"":request.getParameter("searchByName");
		String searchByTitle  = request.getParameter("searchByTitle")==null?"":request.getParameter("searchByTitle");
		String searchByContents  = request.getParameter("searchByContents")==null?"":request.getParameter("searchByContents");
		String inputWord = request.getParameter("inputWord");
		
		
		System.out.println(searchByName);
		System.out.println(searchByTitle);
		System.out.println(searchByContents);
		System.out.println(inputWord);
		
		
	
		int currentPage;
		if(request.getParameter("currentPage")==null)
		{
			currentPage=1;
		}
		else
		{
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		PageData pd = new NoticeService().searchNotice(currentPage,searchByName,searchByTitle,searchByContents,inputWord);
		 
		if(pd!=null)
		{
			RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/searchNoticePage.jsp");
			request.setAttribute("pageData",pd);
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
