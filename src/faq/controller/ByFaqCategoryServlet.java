package faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;

/**
 * Servlet implementation class ByFaqCategoryServlet
 */
@WebServlet(name = "ByFaqCategory", urlPatterns = { "/byFaqCategory" })
public class ByFaqCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ByFaqCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			String category = request.getParameter("category");

			
			ArrayList<Faq> faqList = new FaqService().viewByCategory(category);
			
			if(!faqList.isEmpty())
			{
				request.setAttribute("faqList",faqList);
				RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/viewByCategory.jsp");
				view.forward(request,response);
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