package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet(name = "NoticeInsert", urlPatterns = { "/noticeInsert" })
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	      
	      HttpSession session = request.getSession();
	      
	      Notice n = new Notice();
	      
	      n.setNoticeTitle(request.getParameter("insertNoticeTitle"));
	      n.setNoticeContents(request.getParameter("insertNoticeBoard"));
	      String userId = ((Member)session.getAttribute("user")).getMemberId();
	      n.setNoticeWriter(userId);
	      
	      if(session.getAttribute("user")!=null && ((Member)session.getAttribute("user")).getMemberId().equals("user28")) {
	          
	          int result = new NoticeService().noticeInsert(n);
	         
	          if(result>0) {
	            
	             response.sendRedirect("/noticeList");
	             
	          }else {
	            
	          }
	          
	      }else {
	         
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
