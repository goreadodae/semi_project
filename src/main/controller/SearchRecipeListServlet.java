package main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.service.MainService;
import main.model.vo.SearchRecipePageData;

@WebServlet(name = "SearchRecipeList", urlPatterns = { "/searchRecipeList" })
public class SearchRecipeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchRecipeListServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 페이지 변수
		int page;
		
		HashMap <Integer,String> categoryClassList = new HashMap <Integer,String>();
		HashMap <Integer,String> categorySituationList = new HashMap <Integer,String>();
		HashMap <Integer,String> categoryMethodList = new HashMap <Integer,String>();
		HashMap <Integer,String> categoryIngreList = new HashMap <Integer,String>();
		
		categoryClassList = new MainService().getClassCategory();
		categorySituationList = new MainService().getSituationCategory();
		categoryMethodList = new MainService().getMethodCategory();
		categoryIngreList = new MainService().getIngreCategory();
		
		//첫페이지면 1로 셋팅 그외 페이지면 해당 페이지 값을 가져옴
		if(request.getParameter("page")==null) 
		{  
			page = 1;		// 현재 페이지
		} else 
		{
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String searchVal = request.getParameter("searchVal");	// 사용자 검색
		
		String cate1 = "0";				// 종류별
		String cate2 = "0";				// 상황별
		String cate3 = "0";				// 방법별
		String cate4 = "0";				// 재료별
		String order = "null";			// 
		
		SearchRecipePageData sRPD = new MainService().recipeAll(page, cate1, cate2, cate3, cate4, order, searchVal);
		
		// 종류별, 상황별, 재료별, 방법별
		request.setAttribute("classList", categoryClassList);
		request.setAttribute("situationList", categorySituationList);
		request.setAttribute("methodList", categoryMethodList);
		request.setAttribute("ingredientList", categoryIngreList);
		
		request.setAttribute("cate1", cate1);
		request.setAttribute("cate2", cate2);
		request.setAttribute("cate3", cate3);
		request.setAttribute("cate4", cate4);
		request.setAttribute("order", order	);
		request.setAttribute("searchVal", searchVal);
		
		// 페이지 정보
		request.setAttribute("pageData", sRPD);
		
		// 디스패쳐
		RequestDispatcher view = request.getRequestDispatcher("/views/recipePage/RecipeList.jsp");
		
		// 보내기
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
