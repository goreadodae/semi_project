package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateReadyServelt
 */
@WebServlet(name = "NoticeUpdateReady", urlPatterns = { "/noticeUpdateReady" })
public class NoticeUpdateReadyServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateReadyServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
	      HttpSession session = request.getSession(false);
	      
	      //2. view에서 보낸 데이터를 변수에 저장
	      int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	      
	      //3. 비즈니스로직
	      Notice notice = new NoticeService().noticeSelect(noticeNo);
	      
	      
	      //4. view에 결과 출력
	      if(notice!=null && session.getAttribute("user")!=null) {
	         RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/noticeUpdateReady.jsp");
	         request.setAttribute("notice", notice);
	         view.forward(request, response);
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
