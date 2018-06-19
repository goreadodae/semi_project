package ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ranking.model.service.RankingService;
import ranking.model.vo.Ranking;

/**
 * Servlet implementation class RankingTodayServlet
 */
@WebServlet(name = "RankingTodayMove", urlPatterns = { "/rankingTodayMove" })
public class RankingTodayMoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RankingTodayMoveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//인코딩
		request.setCharacterEncoding("utf-8");
		
		String datepicker = request.getParameter("datepicker"); 
/*		String [] dateSplit = datepicker.split("/");
		int day = Integer.parseInt(dateSplit[2]);
		String empty = "";
		if(0<day&&day<10) {
			empty = "0"+day;
			}
		System.out.println(empty);
		*/
		System.out.println(datepicker + " 값 가져오기 성공 날짜이동");
		ArrayList<Ranking> todayList = new RankingService().todayMoveRecipeRanking(datepicker);
		
		System.out.println("날짜이동서블릿"+todayList);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(todayList,response.getWriter());
		
		//Gson을 만들어서 JSON에게 보내준다!

		
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
