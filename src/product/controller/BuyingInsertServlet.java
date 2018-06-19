package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class BuyingInsertServlet
 */
@WebServlet(name = "BuyingInsert", urlPatterns = { "/buyingInsert" })
public class BuyingInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyingInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//구매할 상품들의 장바구니번호들 (배열로 받아옴)
		String[] basketNoList = request.getParameterValues("basketNo");
		
		//구매할 상품들을 구매내역에 추가하고 장바구니 비우기
		for(int i=0; i<basketNoList.length ;i++) {
	         int result = new ProductService().insertBuying(Integer.parseInt(basketNoList[i]));	//구매내역 추가
	         new ProductService().deleteBasket(Integer.parseInt(basketNoList[i]));	//장바구니 비우기
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
