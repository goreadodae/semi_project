package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class ChangeInfoServlet
 */
@WebServlet(name = "ChangeInfo", urlPatterns = { "/changeInfo" })
public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int fileMaxSize = 10 * 1024 * 1024;
		int result = 0;
		
		String uploadFilePath = getServletContext().getRealPath("/") + "uploadfile";
		System.out.println(uploadFilePath);
		String fileName = "/uploadfile/";

		String encType = "UTF-8";

		// 위에 정보를 바탕으로 MultipartRequest 객체를 생성
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, fileMaxSize, encType,
				new DefaultFileRenamePolicy());

		String stepImgFile= multi.getFilesystemName("profile");
		
        String fullFileStepPath = fileName+stepImgFile;

		String userId = multi.getParameter("userId");// 유저 아이디
		String userPwd = multi.getParameter("savePwd");
		String Phone = multi.getParameter("savePhone");
		String email = multi.getParameter("saveEmail");
		String address = multi.getParameter("postcode") + " | " + multi.getParameter("roadAddress") + " | "
				+ multi.getParameter("addAddress");
		String nickname = multi.getParameter("saveNick");
		int profits = Integer.parseInt(multi.getParameter("savaProfits"));
		String beforeFileName;
		String afterFileName;
		String fullFilePath;
		
		if(multi.getOriginalFileName("profile")==null) {
			stepImgFile = multi.getParameter("beforeProfile");
			fullFileStepPath = stepImgFile;
		} else {
			beforeFileName = multi.getOriginalFileName("profile"); // 원본 파일이름
	        afterFileName = multi.getFilesystemName("profile"); // 바뀐파일이름
	        fullFilePath = "/imgs/profile_img/"+ afterFileName;
		}
		
		Member m = new MemberService().changInfo(userId, fullFileStepPath, userPwd, Phone, email, address, nickname, profits);
		if (m != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", m);
			response.sendRedirect("/views/memberPage/myHomeMainPage.jsp");
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}