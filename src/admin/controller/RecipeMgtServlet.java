package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.AdminRecipePageData;

/**
 * Servlet implementation class RecipeMgtServlet
 */
@WebServlet(name = "RecipeMgt", urlPatterns = { "/recipeMgt" })
public class RecipeMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeMgtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		if(request.getParameter("page")==null) {  //첫페이지면 1로 셋팅 그외 페이지면 해당 페이지 값을 가져옴
			page = 1;
		}
		else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		AdminRecipePageData arpd = new AdminService().recipeAll(page);
		request.setAttribute("pageData", arpd);
		RequestDispatcher view = request.getRequestDispatcher("/views/adminPage/recipeMgtPage2.jsp");
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
