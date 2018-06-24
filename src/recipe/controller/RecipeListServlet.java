package recipe.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.model.service.RecipeService;
import recipe.model.vo.RecipePageData;

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
		int page;
		HashMap <Integer,String> categoryClassList = new HashMap <Integer,String>();
		HashMap <Integer,String> categorySituationList = new HashMap <Integer,String>();
		HashMap <Integer,String> categoryMethodList = new HashMap <Integer,String>();
		HashMap <Integer,String> categoryIngreList = new HashMap <Integer,String>();
		categoryClassList = new RecipeService().getClassCategory();
		categorySituationList = new RecipeService().getSituationCategory();
		categoryMethodList = new RecipeService().getMethodCategory();
		categoryIngreList = new RecipeService().getIngreCategory();
		
		int categoryOrderClass [] = {0,63,56,54,55,60,53,52,61,57,58,65,64,68,66,69,59,62};
		int categoryOrderSituation [] = {0,12,18,13,19,21,15,43,17,45,20,46,44,14,22};
		int categoryOrderIngre [] = {0,70,71,72,23,28,24,50,33,47,32,25,31,48,27,26,34};
		int categoryOrderMethod [] = {0,6,1,7,36,41,42,8,10,9,38,67,39,37,11};
		
		Object category [] = {categoryClassList, categorySituationList, categoryMethodList, categoryIngreList};
		if(request.getParameter("page")==null) {  //첫페이지면 1로 셋팅 그외 페이지면 해당 페이지 값을 가져옴
			page = 1;
		}
		else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String cate1 = request.getParameter("cate1");//종류별
		String cate2 = request.getParameter("cate2");//상황별
		String cate3 = request.getParameter("cate3");//방법별
		String cate4 = request.getParameter("cate4");//재료별
		String order = request.getParameter("order");
		// 지수
		String search = request.getParameter("search"); // 검색
		
		
		System.out.println(search);
		if(cate1==null||cate2==null||cate3==null||cate4==null) {
			cate1="0";
			cate2="0";
			cate3="0";
			cate4="0";
			search="null";
		}
		
		RecipePageData rpd = new RecipeService().recipeAll(page, cate1, cate2, cate3, cate4, order, search);
		request.setAttribute("classList", categoryOrderClass);
		request.setAttribute("situationList", categoryOrderSituation);
		request.setAttribute("methodList", categoryOrderMethod);
		request.setAttribute("ingredientList", categoryOrderIngre);
		request.setAttribute("category", category);
		request.setAttribute("cate1", cate1);
		request.setAttribute("cate2", cate2);
		request.setAttribute("cate3", cate3);
		request.setAttribute("cate4", cate4);
		request.setAttribute("order", order);
		request.setAttribute("search", search);
		
		request.setAttribute("pageData", rpd);
		RequestDispatcher view = request.getRequestDispatcher("/views/recipePage/RecipeList.jsp");
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
