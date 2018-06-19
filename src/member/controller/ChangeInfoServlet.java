package member.controller;

import java.io.File;
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
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MultipartRequest multi = null;
      String uploadFilePath="C:\\Users\\user1\\git\\semi_project\\WebContent\\imgs\\member_img\\profile_img";
      int fileMaxSize = 10*1024*1024;
      
      multi = new MultipartRequest(request, uploadFilePath, fileMaxSize,"utf-8",new DefaultFileRenamePolicy());
      
      String beforeFileName = multi.getOriginalFileName("profile"); //원본 파일이름
       String afterFileName = multi.getFilesystemName("profile"); //바뀐파일이름
       System.out.println(beforeFileName+"   "+afterFileName);
      
       //String userId = request.getParameter("cloneId");
       String userId = multi.getParameter("userId");
       String fullFilePath = uploadFilePath+"\\"+afterFileName;
       System.out.println(uploadFilePath);
        System.out.println(fullFilePath);
         //3. 파일의 길이-크기(length)
         File file = new File(fullFilePath); //해당 파일을 오픈
         long fileSize = file.length();
         // 파일사이즈가 long인 이유?
         // 파일 사이즈는 Byte단위
         
         int result = new MemberService().changInfo(userId, fullFilePath);
         
         if(result>0) {
            System.out.println("성공");
         }else {
            System.out.println("실패");
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