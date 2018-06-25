package member.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet(name = "FindPwd", urlPatterns = { "/findPwd" })
public class FindPwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userId = request.getParameter("id");
      String userName = request.getParameter("name");
      String email = request.getParameter("email");      
      String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
      
      
      int result = new MemberService().findPwd(userId, userName, email, uuid);
      
      
      if(result>0) {
    	  response.getWriter().print(1);
          response.getWriter().close(); 
      }else{
    	  response.getWriter().print(0);
          response.getWriter().close();
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