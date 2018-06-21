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

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet(name = "LoginCheck", urlPatterns = { "/loginCheck" })
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		ArrayList<Member> list = new MemberService().selectAll();
		
		JSONArray resultArray = new JSONArray();
		
		for (Member m : list) {

			JSONObject result = new JSONObject();
			result.put("member_no", m.getMemberNo());
			result.put("member_id", m.getMemberId());
			result.put("member_pwd", m.getMemberPwd());
			result.put("member_name", m.getMemberName());
			result.put("BIRTH_DATE", m.getBirthDate());
			result.put("PHONE", m.getPhone());
			result.put("EMAIL", m.getEmail());
			result.put("ADDRESS", m.getAddress());
			result.put("PROFILE", m.getProfile());
			result.put("NICKNAME", m.getNickName());
			
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
