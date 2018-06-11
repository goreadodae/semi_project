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
		HashMap <String,ArrayList<String>> categoryList = new RecipeService().getCategory();
		if(categoryList.containsKey("class")&&
				categoryList.containsKey("situation")&&
				categoryList.containsKey("method")&&
				categoryList.containsKey("ingredient")) {
			RequestDispatcher view = request.getRequestDispatcher("/views/recipePage/RecipeList.jsp");
			request.setAttribute("classList", categoryList.get("class"));
			request.setAttribute("situationList", categoryList.get("situation"));
			request.setAttribute("methodList", categoryList.get("method"));
			request.setAttribute("ingredientList", categoryList.get("ingredient"));
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
