package product.model.vo;

public class Basket {
	private int basket_no;
	private String product_name;
	private String product_1st_pic;
	private int basket_quantity;
	private int product_price;
	
	public Basket() {}
	
	public Basket(int basket_no, String product_name, String product_1st_pic, int basket_quantity, int product_price) {
		super();
		this.basket_no = basket_no;
		this.product_name = product_name;
		this.product_1st_pic = product_1st_pic;
		this.basket_quantity = basket_quantity;
		this.product_price = product_price;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_1st_pic() {
		return product_1st_pic;
	}

	public void setProduct_1st_pic(String product_1st_pic) {
		this.product_1st_pic = product_1st_pic;
	}

	public int getBasket_quantity() {
		return basket_quantity;
	}

	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	

}
