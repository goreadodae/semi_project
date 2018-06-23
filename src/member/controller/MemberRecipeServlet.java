package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import main.model.vo.MainRecipe;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberRecipeServlet
 */
@WebServlet(name = "MemberRecipe", urlPatterns = { "/memberRecipe" })
public class MemberRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		ArrayList<Member> list = new MemberService().getMemberInfo();
		
		System.out.println(list);
		JSONArray resultArray = new JSONArray();

		for (Member m : list) {

			JSONObject result = new JSONObject();
			
			result.put("member_no", m.getMemberNo());
			result.put("nickname", m.getNickName());
			result.put("profile",m.getProfile());

			resultArray.add(result);

		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(resultArray);
		response.getWriter().close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
