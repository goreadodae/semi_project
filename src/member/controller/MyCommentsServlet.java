package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.BuyProduct;
import member.model.vo.Comments;

/**
 * Servlet implementation class MyCommentsServlet
 */
@WebServlet(name = "MyComments", urlPatterns = { "/myComments" })
public class MyCommentsServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int userNo = Integer.parseInt(request.getParameter("userNo"));

         ArrayList<Comments>  comments = new MemberService().comments(userNo);
         
         RequestDispatcher view = request.getRequestDispatcher("/views/memberPage/myHomeCommentsPage.jsp");
         request.setAttribute("c", comments);
         view.forward(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}