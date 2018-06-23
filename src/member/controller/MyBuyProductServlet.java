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

/**
 * Servlet implementation class MyBuyProductServlet
 */
@WebServlet(name = "MyBuyProduct", urlPatterns = { "/myBuyProduct" })
public class MyBuyProductServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBuyProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int userNo = Integer.parseInt(request.getParameter("userNo"));
      
      ArrayList<BuyProduct>  productList = new MemberService().buyProduct(userNo);
      
      RequestDispatcher view = request.getRequestDispatcher("/views/memberPage/myHomeOrderList.jsp");
      request.setAttribute("p", productList);
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