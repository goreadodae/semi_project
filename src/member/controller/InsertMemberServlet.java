package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet(name = "InsertMember", urlPatterns = { "/insertMember" })
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		String phone = request.getParameter("phone1")+request.getParameter("phone2");
		String address = request.getParameter("postcode")+" | "+request.getParameter("roadAddress")+" | "+request.getParameter("addAddress");
		
		StringBuffer setPhone = new StringBuffer(phone);
		
		setPhone.insert(3, "-");
		setPhone.insert(8, "-");
		
		String birth = request.getParameter("birth");
		StringBuffer setBirth = new StringBuffer(birth);
		setBirth.insert(2, "/");
		setBirth.insert(5, "/");
		
		m.setMemberId(request.getParameter("userId"));
		m.setMemberPwd(request.getParameter("userPwd"));
		m.setMemberName(request.getParameter("userName"));
		m.setBirthDate(setBirth.toString());
		m.setPhone(setPhone.toString());
		m.setAddress(address);
		m.setGender(request.getParameter("gender"));
		m.setEmail(request.getParameter("email"));
		m.setNickName(request.getParameter("userNickName"));
		m.setProfile(request.getParameter("userProfile"));
		
		Member user = new MemberService().insertMember(m);
		
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", m);
			response.sendRedirect("/index.jsp");
		}else {
			// 에러페이지
			response.sendRedirect("insertError.jsp");
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
