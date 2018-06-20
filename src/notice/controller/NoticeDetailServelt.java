package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailServelt
 */
@WebServlet(name = "NoticeDetail", urlPatterns = { "/noticeDetail" })
public class NoticeDetailServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String cnt = request.getParameter("noticeNo");// 쿠키값 비교할때 스트링형으로 해야함 
		Notice notice = new NoticeService().viewDetailNotice(noticeNo);//해당 공지사항 번호 가져옴
		String preNotice = new NoticeService().previousNotice(noticeNo);//이전페이지 제목
		String nexNotice = new NoticeService().nextNotice(noticeNo);//다음페이지 제목
		boolean GetedCookies = false; //쿠키가 없을때
		Cookie[] cookies = request.getCookies();//쿠키 가져옴

			for(Cookie c : cookies)
			{
				if(c.getName().equals(cnt))
				{
					GetedCookies=true;//공지사항을 볼때 쿠키값이 추가가 되어있다면 조회수증가가 안됨 	
				}
			}
			if(!GetedCookies) //쿠키가 없을때임 즉 오늘 처음 보는 공지사항임
			{
				int result = new NoticeService().viewCount(noticeNo);//쿠키를 가지고 있지 않을때 조회수를 업데이트 해줌
				if(result>0)//업데이트가 성공한다면...(조회수가 증가한다면)
				{
					Cookie cK = new Cookie(cnt,cnt); //쿠키객체생성
					System.out.println(cK.getName());
					cK.setMaxAge(1*24*60*60);//쿠키 수명임 (하루)
					response.addCookie(cK);//쿠키 추가!
				}
			}
		if(notice!=null)
		{
			request.setAttribute("notice",notice);
			request.setAttribute("preNotice", preNotice);
			request.setAttribute("nexNotice", nexNotice);
			RequestDispatcher view = request.getRequestDispatcher("/views/customerCenterPage/noticeContentsPage.jsp");
			view.forward(request, response);
		}
		else
		{
			
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
