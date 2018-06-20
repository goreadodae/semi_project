package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ProductService;

/**
 * Servlet implementation class BasketInsertServlet
 */
@WebServlet(name = "BasketInsert", urlPatterns = { "/basketInsert" })
public class BasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);	
		Member m = (Member)session.getAttribute("user");
		
		if(m==null) {	//로그인 안되있으면
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("nologin");
			response.getWriter().close();
		}else {			//로그인 되있으면
			int basketQuantity = Integer.parseInt(request.getParameter("basketQuantity"));
			int memberNo = m.getMemberNo();
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			
			int result = new ProductService().insertBasket(basketQuantity, memberNo, productNo);
			if(result>0) {
				response.setCharacterEncoding("utf-8");
				response.getWriter().print("success");
				response.getWriter().close();
			}
			else {
				response.setCharacterEncoding("utf-8");
				response.getWriter().print("fail");
				response.getWriter().close();
			}
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
