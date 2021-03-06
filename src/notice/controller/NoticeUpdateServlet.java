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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet(name = "NoticeUpdate", urlPatterns = { "/noticeUpdate" })
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
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
		
		n.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
		n.setNoticeTitle(request.getParameter("noticeTitle"));
		n.setNoticeContents(request.getParameter("noticeBoard"));
		
		 if(session.getAttribute("user")!=null && ((Member)session.getAttribute("user")).getMemberId().equals("user28")) {
	         
	         int result = new NoticeService().updateNotice(n);
	         
	         if(result>0) {
	            
	            response.sendRedirect("/noticeDetail?noticeNo="+n.getNoticeNo());
	            
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
