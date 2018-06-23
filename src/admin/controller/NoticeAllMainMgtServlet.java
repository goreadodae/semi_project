package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.UserCountMgrService;

/**
 * Servlet implementation class NoticeAllMainMgtServlet
 */
@WebServlet(name = "NoticeAllMainMgt", urlPatterns = { "/noticeAllMainMgt" })
public class NoticeAllMainMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAllMainMgtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.setCharacterEncoding("UTF-8");
		
		int result [] = new UserCountMgrService().boardCount();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
