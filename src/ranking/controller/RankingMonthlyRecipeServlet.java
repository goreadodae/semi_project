package ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ranking.model.service.RankingService;
import ranking.model.vo.Ranking;

/**
 * Servlet implementation class RankingMonthlyRecipeServlet
 */
@WebServlet(name = "RankingMonthlyRecipe", urlPatterns = { "/rankingMonthlyRecipe" })
public class RankingMonthlyRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingMonthlyRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		ArrayList<Ranking> monthRecipeList = new RankingService().monthRecipeRanking(year,month);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(monthRecipeList,response.getWriter());
		//Gson을 만들어서 JSON에게 보내준다!
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
