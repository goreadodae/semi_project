package product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import product.model.vo.Basket;
import product.model.vo.Buying;
import product.model.vo.Ordercall;
import product.model.vo.Product;
import product.model.vo.Review;

public class ProductDao {
	//모든 상품 정보
	public ArrayList<Product>  getAllProduct(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectAll");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("product_no"));
				pro.setProductQuantity(rset.getInt("product_quantity"));
				pro.setProductName(rset.getString("product_name"));
				pro.setProductPrice(rset.getInt("product_price"));
				pro.setProduct1stPic(rset.getString("product_1st_pic"));
				pro.setProductSpecPic(rset.getString("product_spec_pic"));
				pro.setProductIntro(rset.getString("product_intro"));
				pro.setProductInfo(rset.getString("product_info"));
				
				list.add(pro);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}

	//상품 상세 정보
	public Product getProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product productInfo = null;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectOne");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				productInfo = new Product();
				productInfo.setProductNo(rset.getInt("product_no"));
				productInfo.setProductQuantity(rset.getInt("product_quantity"));
				productInfo.setProductName(rset.getString("product_name"));
				productInfo.setProductPrice(rset.getInt("product_price"));
				productInfo.setProduct1stPic(rset.getString("product_1st_pic"));
				productInfo.setProductSpecPic(rset.getString("product_spec_pic"));
				productInfo.setProductIntro(rset.getString("product_intro"));
				productInfo.setProductInfo(rset.getString("product_info"));
				productInfo.setRecipeNo(rset.getInt("recipe_no"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return productInfo;
	}



	//이달의 레시피 정보
	public ArrayList<Product> getThisMonthProduct(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("productSelectThisMonth");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("product_no"));
				pro.setProductQuantity(rset.getInt("product_quantity"));
				pro.setProductName(rset.getString("product_name"));
				pro.setProductPrice(rset.getInt("product_price"));
				pro.setProduct1stPic(rset.getString("product_1st_pic"));
				pro.setProductSpecPic(rset.getString("product_spec_pic"));
				pro.setProductIntro(rset.getString("product_intro"));
				pro.setProductInfo(rset.getString("product_info"));
				list.add(pro);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}

	//로그인계정의 장바구니 정보
	public ArrayList<Basket> getMyBasket(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Basket> bList = new ArrayList<Basket>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("basketSelect");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Basket b = new Basket();
				b.setBasketNo(rset.getInt("bascket_no"));
				b.setProductNo(rset.getInt("product_no"));
				b.setProductName(rset.getString("product_name"));
				b.setProductQuantity(rset.getInt("product_quantity"));
				b.setProduct1stPic(rset.getString("product_1st_pic"));
				b.setBasketQuantity(rset.getInt("bascket_quantity"));
				b.setProductPrice(rset.getInt("product_price"));

				bList.add(b);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return bList;
	}


	//바로 구매하기 버튼을 누를시의 상품 정보(제일 마지막에 담긴 장바구니 정보 가져옴)
	public ArrayList<Basket> getLastBasket(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Basket> bList = new ArrayList<Basket>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("basketDirectSelect");

			pstmt = conn.prepareStatement("select bascket_no,product_no,product_name,PRODUCT_1ST_PIC,BASCKET_QUANTITY,PRODUCT_PRICE from product join bascket using(PRODUCT_NO) where bascket_no=(select max(bascket_no) from bascket where member_no=?)");
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Basket b = new Basket();
				b.setBasketNo(rset.getInt("bascket_no"));
				b.setProductName(rset.getString("product_name"));
				b.setProduct1stPic(rset.getString("product_1st_pic"));
				b.setBasketQuantity(rset.getInt("bascket_quantity"));
				b.setProductPrice(rset.getInt("product_price"));
				b.setProductNo(rset.getInt("product_no"));
				
				bList.add(b);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return bList;
	}

	//장바구니 추가
	public int insertBasket(Connection conn, int basketQuantity,int memberNo,int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketInsert");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketQuantity);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, productNo);
			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}



	//장바구니 수량 변경
	public int updateBasket(Connection conn, int basketQuantity, int basketNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketUpdate");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketQuantity);
			pstmt.setInt(2, basketNo);

			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}


	//장바구니 삭제
	public int deleteBasket(Connection conn, int basketNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketDelete");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketNo);
			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	//구매내역 테이블 추가
	public int insertBuying(Connection conn, int basketNo, int orderNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("buyingInsert");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, basketNo);
			pstmt.setInt(2, basketNo);
			pstmt.setInt(3, basketNo);
			pstmt.setInt(4, orderNo);

			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	//상품의 남은 수량 감소
	public int updateProduct(Connection conn, int productNo, int basketQuantity) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("productUpdate");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, basketQuantity);
			pstmt.setInt(3, productNo);

			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	//수량초과인 장바구니 모두 삭제
	public int deleteBasketOver(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("basketDeleteOver");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, productNo);

			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	//0.주문내역 추가
	public int insertOrdercall(Connection conn, Ordercall oc) {
		PreparedStatement pstmt = null;
		int result = 0;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/productQuery.properties"));
			String query = prop.getProperty("ordercallInsert");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, oc.getTotalFee());
			pstmt.setInt(2, oc.getDeliveryFee());
			pstmt.setInt(3, oc.getFinalFee());
			pstmt.setInt(4, oc.getMemberNo());
			result = pstmt.executeUpdate();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	
	//0.5 주문내역의 주문번호 받아오기
	public Ordercall getOrderNo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Ordercall ordercall = null;

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("ordercallSelectRecent");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				ordercall = new Ordercall();
				ordercall.setOrderNo(rset.getInt("order_no"));
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return ordercall;
	}
	

	//방금 구매한 내역 정보 보기
	public ArrayList<Buying> selectBuyingRecent(Connection conn, int memberNo, int rowCount) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Buying> list = new ArrayList<Buying>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("buyingSelectRecent");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, rowCount);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Buying b = new Buying();
				b.setBuyingNo(rset.getInt("buying_no"));
				b.setProductNo(rset.getInt("product_no"));
				b.setBuyingQuantity(rset.getInt("buying_quantity"));
				b.setBuyingDate(rset.getDate("buying_date"));
				b.setProductName(rset.getString("product_Name"));
				b.setProductPrice(rset.getInt("product_price"));
				b.setProduct1stPic(rset.getString("product_1st_pic"));

				list.add(b);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	
	//로그인 계정의 전체 주문 내역 보기
	public ArrayList<Ordercall> selectOrdercallAll(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ordercall> list = new ArrayList<Ordercall>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("ordercallSelect");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Ordercall oc = new Ordercall();
				oc.setOrderNo(rset.getInt("order_no"));
				oc.setTotalFee(rset.getInt("total_fee"));
				oc.setDeliveryFee(rset.getInt("delivery_fee"));
				oc.setDiscount(rset.getInt("discount"));
				oc.setFinalFee(rset.getInt("final_fee"));
				oc.setOrdererInfo(rset.getString("orderer_info"));
				oc.setDeliveryInfo(rset.getString("delivery_info"));
				oc.setMemberNo(rset.getInt("member_no"));

				list.add(oc);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}
	
	//로그인 계정의 전체 구매내역 보기
	public ArrayList<Buying> selectBuyingAll(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Buying> list = new ArrayList<Buying>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path+"resources/productQuery.properties"));
			String query = prop.getProperty("buyingSelect");

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Buying b = new Buying();
				b.setBuyingNo(rset.getInt("buying_no"));
				//				b.setProductNo(rset.getInt("product_no"));
				b.setBuyingQuantity(rset.getInt("buying_quantity"));
				b.setBuyingDate(rset.getDate("buying_date"));
				b.setProductName(rset.getString("product_Name"));
				b.setProductPrice(rset.getInt("product_price"));
				b.setProduct1stPic(rset.getString("product_1st_pic"));
				b.setOrderNo(rset.getInt("order_no"));
				
				list.add(b);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}


	//☆ 지현 추가 --> 댓글 나오기
		public ArrayList<Review> noticeComment(Connection conn, int productNo) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			Properties prop = new Properties();
			String path = ReviewDao.class.getResource("").getPath();
			ArrayList<Review> list = new ArrayList<Review>();
			String query = "SELECT review_no, review_contents, review_enroll_date, review_meet, product_no, member_id, nickname FROM REVIEW left join member using(member_id) WHERE PRODUCT_NO = ? order by review_no desc";
			try {
				prop.load(new FileReader(path+"reviewQuery.properties"));
				/*String query = prop.getProperty("reviewAll");*/
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, productNo);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Review r = new Review();
					r.setReviewNo(rset.getInt("review_no"));
					r.setReviewContents(rset.getString("review_contents"));
					r.setEnrollDate(rset.getDate("review_enroll_date"));
					r.setReviewSatisfied(rset.getInt("review_meet"));
					r.setProductNo(rset.getInt("product_no"));
					r.setMemberId(rset.getString("member_id"));
					r.setNickName(rset.getString("nickname"));
					list.add(r);
					
				}
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			
			return list;
		}

	
}
