package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;
import recipe.model.vo.Process;

/**
 * Servlet implementation class RecipeServlet
 */
@WebServlet(name = "Recipe", urlPatterns = { "/recipe" })
public class RecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		Recipe recipe = new RecipeService().recipeSelect(recipeNo);
		ArrayList <Process> processList = new RecipeService().processSelect(recipeNo);
		if(recipe!=null) {
			request.setAttribute("recipe", recipe);
			request.setAttribute("processList", processList);
			RequestDispatcher view = request.getRequestDispatcher("/views/recipePage/recipeSelect.jsp");
			view.forward(request, response);
		}else {
			response.sendRedirect("/views/recipePage/recipeEmpty.html");
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

