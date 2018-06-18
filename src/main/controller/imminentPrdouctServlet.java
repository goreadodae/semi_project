package main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import main.model.service.MainService;
import main.model.vo.MainProduct;

/**
 * Servlet implementation class imminentPrdouctServlet
 */
@WebServlet(name = "ImminentServlet", urlPatterns = { "/imminentServlet" })
public class imminentPrdouctServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public imminentPrdouctServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		ArrayList<MainProduct> list = new MainService().getImminentProduct();

		JSONArray resultArray = new JSONArray();
		for (MainProduct mp : list) {

			JSONObject result = new JSONObject();

			result.put("product_no", mp.getProduct_no());
			result.put("product_quantity", mp.getProduct_quantity());
			result.put("product_name", mp.getProduct_name());
			result.put("product_price", mp.getProduct_price());
			result.put("product_1st_pic", mp.getProduct_1st_pic());

			resultArray.add(result);

		}

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(resultArray);
		response.getWriter().close();
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
