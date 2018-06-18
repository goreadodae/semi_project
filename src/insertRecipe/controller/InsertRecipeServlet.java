package insertRecipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insertRecipe.model.service.InsertRecipeService;
import insertRecipe.model.vo.InsertRecipe;

/**
 * Servlet implementation class InsertRecipeServlet
 */
@WebServlet(name = "InsertRecipe", urlPatterns = { "/insertRecipe" })
public class InsertRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.전송값 한글이 있을경우 처리할 수 있도록 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//2.View에서 전송한 데이터를 받아 변수에 저장
		InsertRecipe ir = new InsertRecipe();
				
		ir.setRecipeTitle(request.getParameter("recipeTitle")); //제목
		ir.setRecipeIntro(request.getParameter("recipeIntro")); //소개
		ir.setRecipePic(request.getParameter("mainRPic")); //메인사진
		ir.setCookServing(request.getParameter("cookServing")); //인분
		ir.setCookTime(request.getParameter("CookTime")); //시간
		ir.setCookLevel(request.getParameter("CookLevel")); //난이도
		//재료
		String [] materList = request.getParameterValues("materList");
		String materListAll = "";
		for(int i=0; i<materList.length ;i++) {
			materListAll += materList[i];
		}
		ir.setIngredient(materListAll); //재료
		
		
		ir.setTip(request.getParameter("recipeTip")); //팁
		//완성사진 값 불러오기
		String sendPicSucOne = request.getParameter("sendPicSucOne");
		String sendPicSucTwo = request.getParameter("sendPicSucTwo");
		String sendPicSucThrid = request.getParameter("sendPicSucThrid");
		String sendPicSucFour = request.getParameter("sendPicSucFour");
		String sendPicSucFive = request.getParameter("sendPicSucFive");
		String sendPicSucAll = sendPicSucOne+"@"+sendPicSucTwo+"@"+sendPicSucThrid+"@"+sendPicSucFour+"@"+sendPicSucFive;	
		ir.setCompletePic(sendPicSucAll); //완성사진 
		ir.setRecipeTag(request.getParameter("recipeTag")); //태그
		ir.setVideo(request.getParameter("recipeVideo")); //동영상
		
		String classNo = request.getParameter("class_no"); //종류별
		int classNoChg = 0;
		switch(classNo) {
		case "밑반찬" : classNoChg=63; break; 
		case "메인반찬" : classNoChg = 56; break;
		case "국/탕" : classNoChg = 54; break;
		case "찌개" : classNoChg = 55; break;
		case "디저트" : classNoChg=60; break;
		case "면/만두" : classNoChg=53; break;
		case "밥/죽/떡" : classNoChg=52; break;
		case "퓨전" : classNoChg=61; break;
		case "김치/젓갈/장류" : classNoChg=57; break;
		case "양념/소스/잼" : classNoChg=58; break;
		case "양식" : classNoChg=65; break;
		case "샐러드" : classNoChg=64; break;
		case "스프" : classNoChg=68; break;
		case "빵" : classNoChg=66; break;
		case "과자" : classNoChg=69; break;
		case "차/음료/술" : classNoChg=59; break;
		case "기타" : classNoChg=62; break;
		}
		ir.setClassNo(classNoChg);
		
		String situationNo = request.getParameter("situation_no"); //상황별
		int situationNoChg = 0;
		switch(situationNo) {
		case "일상": situationNoChg=12; break;
		case "초스피드": situationNoChg=18; break;
		case "손님접대": situationNoChg=13; break;
		case "술안주": situationNoChg=19; break;
		case "다이어트" : situationNoChg=21; break;
		case "도시락" : situationNoChg=15; break;
		case "영양식" : situationNoChg=43; break;
		case "간식" : situationNoChg=17; break;
		case "야식" : situationNoChg=45; break;
		case "푸드스타일링" : situationNoChg=20; break;
		case "해장" : situationNoChg=46; break;
		case "명절" : situationNoChg=44; break;
		case "이유식" : situationNoChg=14; break;
		case "기타" : situationNoChg=22; break;
		}
		ir.setSituationNo(situationNoChg);
		
		String methodNo = request.getParameter("method_no"); //방법별
		int methodNoChg = 0;
		switch(methodNo) {
		case "볶음" : methodNoChg=6; break;
		case "끓이기" : methodNoChg=1; break;
		case "부침" : methodNoChg=7; break;
		case "조림" : methodNoChg=36; break;
		case "무침" : methodNoChg=41; break;
		case "비빔" : methodNoChg=42; break;
		case "찜" : methodNoChg=8; break;
		case "절임" : methodNoChg=10; break;
		case "튀김" : methodNoChg=9; break;
		case "삶기" : methodNoChg=38; break;
		case "굽기" : methodNoChg=67; break;
		case "데치기" : methodNoChg=39; break;
		case "회" : methodNoChg=37; break;
		case "기타" : methodNoChg=11; break;
		}
		ir.setMethodNo(methodNoChg);
		
		String ingredient = request.getParameter("ingredient_no"); //재료별
		int ingredientNoChg = 0;
		switch(ingredient) {
		case "소고기" : ingredientNoChg=70; break;
		case "돼지고기" : ingredientNoChg=71; break;
		case "닭고기" : ingredientNoChg=72; break;
		case "육류" : ingredientNoChg=23; break;
		case "채소류" : ingredientNoChg=28; break;
		case "해물류" : ingredientNoChg=24; break;
		case "달걀/유제품" : ingredientNoChg=50; break;
		case "가공식품류" : ingredientNoChg=33; break;
		case "쌀" : ingredientNoChg=47; break;
		case "밀가루" : ingredientNoChg=32; break;
		case "건어물류" : ingredientNoChg=25; break;
		case "버섯류" : ingredientNoChg=31; break;
		case "과일류" : ingredientNoChg=48; break;
		case "콩/건과류" : ingredientNoChg=27; break;
		case "곡류" : ingredientNoChg=26; break;
		case "기타" : ingredientNoChg=34; break;
		}
		ir.setIngreNo(ingredientNoChg);
		
		int result = new InsertRecipeService().insertRecipe(ir);
		
		System.out.println(result);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
