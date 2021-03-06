package main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import main.model.service.MainService;
import main.model.vo.MainRecipe;

/**
 * Servlet implementation class RecipeServlet
 */
@WebServlet("/recipeServlet")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		ArrayList<MainRecipe> list = new MainService().getRecipe();
		JSONArray resultArray = new JSONArray();
		
		for (MainRecipe mr : list) {
			
			JSONObject result = new JSONObject();
			
			result.put("recipe_no", mr.getRecipeNo());
			result.put("member_no", mr.getUserNo());
			result.put("recipe_title", mr.getRecipeTitle());
			result.put("recipe_pic", mr.getRecipePic());
			result.put("recipe_week", mr.getRecipeTodayViews());
			result.put("recipe_month", mr.getRecipeMonthViews());
			result.put("cook_time", mr.getCookTime());
			result.put("cook_level", mr.getCookLevel());
			result.put("member_id", mr.getMemberId());
			
			resultArray.add(result);

		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(resultArray);
		response.getWriter().close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
