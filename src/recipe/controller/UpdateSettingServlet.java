package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import recipe.model.service.RecipeService;
import recipe.model.vo.Process;
import recipe.model.vo.Recipe;
import recipe.model.vo.RecipeInfo;

/**
 * Servlet implementation class UpdateSettingServlet
 */
@WebServlet(name = "UpdateSetting", urlPatterns = { "/updateSetting" })
public class UpdateSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSettingServlet() {
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
		RecipeInfo ri = new RecipeInfo();
		ri.setProcessList(processList);
		ri.setRecipe(recipe);
		if(recipe!=null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(ri,response.getWriter());
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
