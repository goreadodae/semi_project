package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;

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
		MultipartRequest multi = null;
		String uploadFilePath = "C:\\Users\\user1\\git\\semi_project\\WebContent\\imgs\\member_img\\profile_img";
		int fileMaxSize = 10 * 1024 * 1024;

		multi = new MultipartRequest(request, uploadFilePath, fileMaxSize, "utf-8", new DefaultFileRenamePolicy());

		String userId = multi.getParameter("userId");// 유저 아이디
		String userPwd = multi.getParameter("savePwd");
		String Phone = multi.getParameter("savePhone");
		String email = multi.getParameter("saveEmail");
		String address = multi.getParameter("postcode") + " | " + multi.getParameter("roadAddress") + " | "
				+ multi.getParameter("addAddress");
		String nickname = multi.getParameter("saveNick");

		String beforeFileName = multi.getOriginalFileName("profile"); // 원본 파일이름
		String afterFileName = multi.getFilesystemName("profile"); // 바뀐파일이름

		String fullFilePath = uploadFilePath + "\\" + afterFileName;

		int result = new MemberService().changInfo(userId, fullFilePath, userPwd, Phone, email, address, nickname);

		if (result > 0) {
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