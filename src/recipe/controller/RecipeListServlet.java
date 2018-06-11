package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.model.service.RecipeService;

/**
 * Servlet implementation class RecipeListServlet
 */
@WebServlet(name = "RecipeList", urlPatterns = { "/recipeList" })
public class RecipeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap <Integer,String> categoryClassList = new RecipeService().getClassCategory();
		HashMap <Integer,String> categorySituationList = new RecipeService().getSituationCategory();
		HashMap <Integer,String> categoryMethodList = new RecipeService().getMethodCategory();
		HashMap <Integer,String> categoryIngreList = new RecipeService().getIngreCategory();
		if(!categoryClassList.isEmpty()&&
				!categorySituationList.isEmpty()&&
				!categoryMethodList.isEmpty()&&
				!categoryIngreList.isEmpty()) {
			request.setAttribute("classList", categoryClassList);
			request.setAttribute("situationList", categorySituationList);
			request.setAttribute("methodList", categoryMethodList);
			request.setAttribute("ingredientList", categoryIngreList);
			String cate1 = request.getParameter("cate1");//종류별
			String cate2 = request.getParameter("cate2");//상황별
			String cate3 = request.getParameter("cate3");//방법별
			String cate4 = request.getParameter("cate4");//재료별
			request.setAttribute("cate1", cate1);
			request.setAttribute("cate2", cate2);
			request.setAttribute("cate3", cate3);
			request.setAttribute("cate4", cate4);
			if(cate1!=null&&cate2!=null&&cate3!=null&&cate4!=null) {
				
			}
			else {

			}
			RequestDispatcher view = request.getRequestDispatcher("/views/recipePage/RecipeList.jsp");
			view.forward(request, response);
		}
		else {
			
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
