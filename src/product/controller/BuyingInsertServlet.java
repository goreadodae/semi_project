package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.Ordercall;

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
		////구매 처리 서블릿(장바구니 있던 내용을 구매내역으로 옮김)
		request.setCharacterEncoding("utf-8");
		
		//구매할 상품들의 장바구니번호들 (배열로 받아옴)
		String[] basketNoList = request.getParameterValues("basketNo");
		String[] productNoList = request.getParameterValues("productNo"); //상품번호
		String[] basketQuantityList = request.getParameterValues("basketQuantity");//수량
		
		//가격정보
		int totalFee = Integer.parseInt(request.getParameter("totalFee"));
		int deliveryFee = Integer.parseInt(request.getParameter("deliveryFee"));
		int finalFee = Integer.parseInt(request.getParameter("finalFee"));
		
		Ordercall oc = new Ordercall();
		oc.setTotalFee(totalFee);
		oc.setDeliveryFee(deliveryFee);
		oc.setFinalFee(finalFee);
		
		//0. 주문내역에 추가
		int result0 = new ProductService().insertOrdercall(oc);
		
		//구매할 상품들을 구매내역에 추가하고 장바구니 비우기
		for(int i=0; i<basketNoList.length ;i++) {
	         int result1 = new ProductService().insertBuying(Integer.parseInt(basketNoList[i]));//1.구매내역 추가
	         int result2 = new ProductService().deleteBasket(Integer.parseInt(basketNoList[i]));//2.장바구니 비우기
	         int result3 = new ProductService().updateProduct(Integer.parseInt(productNoList[i]), Integer.parseInt(basketQuantityList[i]));//3.수량 줄이기
	         int result4 = new ProductService().deleteBasketOver(Integer.parseInt(productNoList[i]));//4.수량초과인 장바구니 모두 삭제
	         
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
